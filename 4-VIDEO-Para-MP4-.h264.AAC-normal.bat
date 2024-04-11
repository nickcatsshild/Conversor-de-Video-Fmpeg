REM Você poderá ter mais tutoriais no canal samucatutoriais do youtube

@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

REM For first file
REM %1
REM For multiple files
echo %*

set COUNTER=0
for %%x in (%*) do (
	echo %%x
	set /A COUNTER+=1
)
echo COUNTER = %COUNTER%

if %COUNTER% GTR 0 (
	if %COUNTER% EQU 1 (
		echo _____GET ONE FILE_____
	) else (
		echo _____GET MULTI FILES: %COUNTER% files_____
	)
	for %%x in (%*) do (
REM //////////////////// MAIN \\\\\\\\\\\\\\\\\\\\\\\\\		
		ffmpeg -i %%x -map 0 -c:v libx264 -c:a aac -strict -2 -c:s mov_text "%%~nx.H264.AAC.mp4"
	)
) else (
	echo _____GET NO ONE FILES_____
)

pause


 -c:v libx264 -crf 26 -vf 