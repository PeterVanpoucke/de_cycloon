:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::: Log into GitHub, download Excel page, update Excel page, submit changes :::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@ECHO off
setlocal EnableDelayedExpansion

CD "%~dp0"

ECHO +++ Update Calendar 'De Cycloon'

::: Expect the year indication
if "%1" == "" (
  ECHO +++
  ECHO +++ ERROR: Missing Year [e.g. '2021']
  ECHO +++
  GOTO end
)

::: Global settings
SET _WORD_="C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
SET _FILE_=%1
SET _EXT_=.htm
ECHO +++ %date%
ECHO +++ %time%
SET CUR_YYYY=%date:~9,4%
SET CUR_MM=%date:~6,2%
SET CUR_DD=%date:~3,2%
SET CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (@SET CUR_HH=0%time:~1,1%)
SET CUR_NN=%time:~3,2%
SET CUR_SS=%time:~6,2%
SET CUR_MS=%time:~9,2%
SET _DATE_TIME_=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%%CUR_MS%

ECHO +++
ECHO +++ _WORD_      : %_WORD_%
ECHO +++ _FILE_      : %_FILE_%
ECHO +++ _EXT_       : %_EXT_%
ECHO +++ _DATE_TIME_ : %_DATE_TIME_%

:: Get the specified file from GitHub
ECHO +++
ECHO +++ Login to GitHub
call gh auth login --hostname GitHub.com --git-protocol https --with-token < token.txt

ECHO +++ Sync local repository from remote parent
call gh repo sync

ECHO +++ Make backup copy of file '../%_FILE_%%_EXT_%'
COPY ../%_FILE_%%_EXT_% ../_backup/%_DATE_TIME_%_%_FILE_%%_EXT_%.bak




ECHO +++ Logout from GitHub
call gh auth logout --hostname GitHub.com


:end
ECHO +++
ECHO +++ DONE!
