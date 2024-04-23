@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

:RemoveMetaTags
echo Removendo meta tags de %1
ffmpeg -i "%~1" -map_metadata -1 -c copy "%~dpn1.mp4"
goto :eof

set COUNTER=0

for %%x in (%*) do (
    echo %%x
    set /A COUNTER+=1
)
echo COUNTER = %COUNTER%

if %COUNTER% GTR 0 (
    if %COUNTER% EQU 1 (
        echo _____PEGAR UM ARQUIVO_____
    ) else (
        echo _____PEGAR MÚLTIPLOS ARQUIVOS: %COUNTER% arquivos_____
    )
    
    for %%x in (%*) do (
        call :RemoveMetaTags "%%x"
        echo Convertendo "%%x" para H.265 com áudio AAC...
        set "outfile=%%~dpnx1"
        set "outfile=%outfile:.=%"  REM Remove pontos no nome do arquivo para evitar conflitos
        ffmpeg -i "%~dpn1_NoMetaTags.mp4" -map 0 -c:v libx265 -crf 28 -c:a aac -strict -2 -c:s mov_text "%outfile%.mp4"
        del "%~dpn1_NoMetaTags.mp4"
    )
) else (
    echo _____NENHUM ARQUIVO ENCONTRADO_____
)

pause
