@SETLOCAL
@echo off

if "%1" == "" (
  @ECHO ++
  @ECHO ++ ERROR: Missing Filename [e.g. 'kalender2018.htm']
  @ECHO ++
  @GOTO end
)

if "%2" == "" (
  @ECHO ++
  @ECHO ++ ERROR: Missing date_time [e.g. '20190415-14422364']
  @ECHO ++
  @GOTO end
)

@REM -- Global settings
@SET _FTP_SCRIPT_=host.ftp
@SET _SCRIPT_TO_RUN_=%2_get_script_to_run.ftp

@ECHO ++
@ECHO ++ _FTP_SCRIPT_    : %_FTP_SCRIPT_%
@ECHO ++ _SCRIPT_TO_RUN_ : %_SCRIPT_TO_RUN_%
@ECHO ++

@REM Create FTP script to download the requested file
@TYPE %_FTP_SCRIPT_% > %_SCRIPT_TO_RUN_%
@ECHO get %1 >> %_SCRIPT_TO_RUN_%
@ECHO bye >> %_SCRIPT_TO_RUN_%
@REM @ECHO --
@REM @TYPE %_SCRIPT_TO_RUN_%
@REM @ECHO --

@REM -- Connect to FTP server
ftp -v -s:%_SCRIPT_TO_RUN_% 1> %2_ftp_get.log 2>&1

:end
@REM  End of "GetFileFromFtp.bat"

@echo on
@ENDLOCAL
