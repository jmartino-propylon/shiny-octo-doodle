@echo off
@REM This file runs http.server on port 8080 specifying directory Resources as root
python -m http.server --directory .\Resources 8080