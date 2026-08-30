@echo off
REM TIGHC Profiles — Git commit script (Windows)
REM v1.3.4 — Add commit.bat/commit.sh

git add -A
git commit -m "chore(v1.3.4): add commit.bat/commit.sh — pre-written commit+tag scripts, rewritten with each commit's exact message/tag before being run — Version: v1.3.4"
git tag -a v1.3.4 -m "TIGHC Profiles v1.3.4 — Add commit.bat/commit.sh"
