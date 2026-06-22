@echo off
setlocal

if "%~1"=="" (
	echo Usage: %~nx0 "path\to\file.docx"
	pause
	exit /b 1
)

set "input=%~f1"
set "filename=%~nx1"
set "folder=%~dp1"
set "output=%~dpn1.md"
set "media=%~dpn1_media"

echo The full path of the file is: "%input%"
echo file is: "%filename%"
echo the folder is: "%folder%"
echo running pandoc...
echo writing markdown...

pandoc -s "%input%" -t gfm --extract-media="%media%" -o "%output%"
if errorlevel 1 (
	echo Conversion failed.
	pause
	exit /b 1
)

echo complete! Wrote: "%output%"
echo media folder, if any images were extracted: "%media%"
pause
