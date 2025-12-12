"""Tests for the main module."""

import pytest

from python_starter.main import main


def test_main_exits_successfully(capsys):
    """Test that main function runs without errors."""
    with pytest.raises(SystemExit) as exc_info:
        main()

    assert exc_info.value.code == 0

    captured = capsys.readouterr()
    assert "Hello from python-starter!" in captured.out
    assert "Python version:" in captured.out
