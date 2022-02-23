@echo off
set COMMIT=%1

if "%COMMIT%" == "" (
    echo "missing parameter"
) else (
    echo "moving to %COMMIT%..."
    git reset HEAD --hard
    git clean -f
    git fetch -p --tags --force
    git checkout origin/main
    git pull origin main --rebase --force
    git checkout "%COMMIT%"
)
