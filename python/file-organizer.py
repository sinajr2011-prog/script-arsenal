#!/usr/bin/env python3
"""
file-organizer.py
Organize files in a folder by extension into subfolders.

Usage:
    python file-organizer.py --dir ~/Downloads
    python file-organizer.py --dir . --dry-run
"""

import argparse
from pathlib import Path
import shutil

# Common categories
CATEGORIES = {
    "Images": {".jpg", ".jpeg", ".png", ".gif", ".webp", ".svg", ".bmp", ".ico"},
    "Videos": {".mp4", ".mkv", ".avi", ".mov", ".wmv", ".flv", ".webm"},
    "Audio": {".mp3", ".wav", ".flac", ".aac", ".ogg", ".m4a"},
    "Documents": {".pdf", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".txt", ".md", ".csv"},
    "Archives": {".zip", ".rar", ".7z", ".tar", ".gz", ".bz2"},
    "Code": {".py", ".js", ".ts", ".html", ".css", ".json", ".xml", ".sh", ".java", ".cpp", ".c", ".go", ".rs"},
}

def get_category(ext: str) -> str:
    ext = ext.lower()
    for cat, extensions in CATEGORIES.items():
        if ext in extensions:
            return cat
    return "Others"

def main():
    parser = argparse.ArgumentParser(description="Organize files by type")
    parser.add_argument("--dir", default=".", help="Directory to organize")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen")
    args = parser.parse_args()

    path = Path(args.dir).expanduser().resolve()
    if not path.is_dir():
        print(f"Error: {path} is not a directory")
        return

    files = [f for f in path.iterdir() if f.is_file()]
    moved = 0

    for f in files:
        category = get_category(f.suffix)
        target_dir = path / category
        target = target_dir / f.name

        if args.dry_run:
            print(f"[DRY] {f.name} → {category}/")
        else:
            target_dir.mkdir(exist_ok=True)
            shutil.move(str(f), str(target))
            print(f"✅ {f.name} → {category}/")
            moved += 1

    if not args.dry_run:
        print(f"\n✨ Organized {moved} files.")

if __name__ == "__main__":
    main()
