#!/usr/bin/env python3
"""Development entry point for python-starter.

This file allows running the application directly during development
before the package is installed. For production, use: python -m python_starter
"""

import sys
from pathlib import Path

# Add src to path for development
src_path = Path(__file__).parent / "src"
sys.path.insert(0, str(src_path))

# Import and run the main module
from python_starter.main import main  # noqa: E402

if __name__ == "__main__":
    main()
