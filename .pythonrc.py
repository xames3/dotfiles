from __future__ import annotations

from pprint import pprint

type(exit).__repr__ = lambda self: self()
