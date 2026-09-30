#!/usr/bin/env python3
"""
quick-rename.py
Bulk rename files with a simple pattern.

Usage:
    python quick-rename.py --dir ./photos --from ".jpeg" --to ".jpg"
    python quick-rename.py --dir . --prefix "img_" --dry-run
"""

import argparse
import os
from pathlib import Path

def main():
    parser = argparse.ArgumentParser(description="Quick bulk file renamer")
    parser.add_argument("--dir", default=".", help="Directory to work in")
    parser.add_argument("--from", dest="old", help="String to replace")
    parser.add_argument("--to", dest="new", default="", help="Replacement string")
    parser.add_argument("--prefix", help="Add prefix to all files")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen")
    args = parser.parse_args()

    path = Path(args.dir)
    if not path.is_dir():
        print(f"Error: {path} is not a directory")
        return

    files = [f for f in path.iterdir() if f.is_file()]

    for f in files:
        new_name = f.name

        if args.old is not None:
            new_name = new_name.replace(args.old, args.new)

        if args.prefix:
            new_name = args.prefix + new_name

        if new_name != f.name:
            target = f.with_name(new_name)
            if args.dry_run:
                print(f"[DRY] {f.name} → {new_name}")
            else:
                f.rename(target)
                print(f"✅ {f.name} → {new_name}")

if __name__ == "__main__":
    main()
