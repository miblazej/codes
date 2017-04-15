import sys
from cx_Freeze import setup, Executable

setup( name = "Gra", version = "3.1", description = "Any Description you like", executables = [Executable("alien_invasion.py", base = "Win32GUI")])