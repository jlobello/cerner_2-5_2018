@echo off

REM cerner_2^5_2018
REM Backup Jenkins install using 7zip to a different drive
REM You may want to configure this as a scheduled task on your Jenkins server.

REM Inspired by https://gist.github.com/adamcaudill/2322221
REM Requires 7zip to be installed

set year=%date:~-4,4%
set month=%date:~-10,2%
set day=%date:~-7,2%
set hour=%time:~-11,2%
set hour=%hour: =0%
set min=%time:~-8,2%

set zipfilename=Jenkins-%year%-%month%-%day%-%hour%%min%.zip

set AppExePath="%ProgramFiles(x86)%\7-Zip\7z.exe"
if not exist %AppExePath% set AppExePath="%ProgramFiles%\7-Zip\7z.exe"

if not exist %AppExePath% goto notInstalled

echo Backing up f:\jenkins\*.* to g:\JenkinsBackup\%zipfilename%

%AppExePath% a -r g:\JenkinsBackup\%zipfilename% f:\jenkins\*.*

echo %source% backed up to %dest% is complete!

goto end

:notInstalled

echo Can not find 7-Zip, please install it from:
echo  http://7-zip.org/

:end
