@echo off
REM Helper to commit and push render.yaml to the current branch
REM Run this from the repository root in Windows Command Prompt or PowerShell

nSET BRANCH=main
IF "%1" NEQ "" SET BRANCH=%1

ngit add render.yaml
git commit -m "Add Render manifest"
git push origin %BRANCH%

nIF %ERRORLEVEL% NEQ 0 (
  echo.
  echo Push failed. Check your git credentials or branch name and try again.
)
EXIT /B %ERRORLEVEL%
