@SETLOCAL
@echo off

if "%1" == "" (
  @ECHO ++
  @ECHO ++ ERROR: Missing Year [e.g. '2021']
  @ECHO ++
  @GOTO end
)

@REM -- Global settings
@SET _WORD_="C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
@SET _FILE_=%1
@SET _EXT_=.htm
@ECHO ++ %date%
@ECHO ++ %time%
@SET CUR_YYYY=%date:~9,4%
@SET CUR_MM=%date:~6,2%
@SET CUR_DD=%date:~3,2%
@SET CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (@SET CUR_HH=0%time:~1,1%)
@SET CUR_NN=%time:~3,2%
@SET CUR_SS=%time:~6,2%
@SET CUR_MS=%time:~9,2%
@SET _DATE_TIME_=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%%CUR_MS%

@ECHO ++
@ECHO ++ _WORD_      : %_WORD_%
@ECHO ++ _FILE_      : %_FILE_%
@ECHO ++ _EXT_       : %_EXT_%
@ECHO ++ _DATE_TIME_ : %_DATE_TIME_%
@ECHO ++

@REM -- Get the specified file from the FTP server
@CALL .\GetFileFromFtp.bat %_FILE_%%_EXT_% %_DATE_TIME_%

@REM -- Make backup copy of loaded file
@COPY %_FILE_%%_EXT_% %_DATE_TIME_%_%_FILE_%%_EXT_%.bak

@REM -- Open the file in WORD
@CALL %_WORD_% %_FILE_%%_EXT_%

@REM -- Put the specified file on the FTP server
@CALL .\PutFileFromFtp.bat %_FILE_%%_EXT_% %_DATE_TIME_%

@REM -- Remove the local copy
@CALL del /Q /S %_FILE_%%_EXT_%

:end
@REM  End of "UpdateKalender.bat"

@echo on
@ENDLOCAL

exit