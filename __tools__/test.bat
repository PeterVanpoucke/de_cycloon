@SETLOCAL
@echo off

if "%1" == "" (
  @ECHO ++
  @ECHO ++ ERROR: Missing Year [e.g. '2018']
  @ECHO ++
  @GOTO end
)

@REM -- Global settings
@SET _WORD_="C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
@SET _FILE_=kalender%1
@SET _EXT_=.htm

@REM -- Make backup copy of loaded file
@SET CUR_YYYY=%date:~9,4%
@SET CUR_MM=%date:~6,2%
@SET CUR_DD=%date:~3,2%
@SET CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (@SET CUR_HH=0%time:~1,1%)
@SET CUR_NN=%time:~3,2%
@SET CUR_SS=%time:~6,2%
@SET CUR_MS=%time:~9,2%
@SET SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%%CUR_MS%
@ECHO @COPY %_FILE_%%_EXT_% %_FILE_%_%SUBFILENAME%.bak

:end
@REM  End of "test.bat"

@echo on
@ENDLOCAL

@pause
