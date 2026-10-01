#!/usr/bin/env python3
"""
password-gen.py
Generate strong random passwords.

Usage:
    python password-gen.py
    python password-gen.py --length 20 --count 5
    python password-gen.py -l 16 --no-symbols
"""

import argparse
import secrets
import string

def generate_password(length: int = 16, use_symbols: bool = True) -> str:
    alphabet = string.ascii_letters + string.digits
    if use_symbols:
        alphabet += "!@#$%^&*()-_=+[]{}|;:,.<>?"
    return "".join(secrets.choice(alphabet) for _ in range(length))

def main():
    parser = argparse.ArgumentParser(description="Strong password generator")
    parser.add_argument("-l", "--length", type=int, default=16, help="Password length (default: 16)")
    parser.add_argument("-c", "--count", type=int, default=1, help="How many passwords to generate")
    parser.add_argument("--no-symbols", action="store_true", help="Exclude symbols")
    args = parser.parse_args()

    for i in range(args.count):
        pwd = generate_password(args.length, not args.no_symbols)
        print(pwd)

if __name__ == "__main__":
    main()
