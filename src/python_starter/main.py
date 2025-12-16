"""Main entry point for the python-starter application."""

import sys
from typing import NoReturn


def main() -> NoReturn:
    """Main application entry point."""
    print("Hello from python-starter!")
    print(f"Python version: {sys.version}")
    sys.exit(0)


if __name__ == "__main__":
    main()

