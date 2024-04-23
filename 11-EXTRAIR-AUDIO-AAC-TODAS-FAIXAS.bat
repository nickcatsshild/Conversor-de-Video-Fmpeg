@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

:RemoveMetaTags
echo Removendo meta tags de %1
ffmpeg -i "%~1" -map_metadata -1 -c copy "%~dpn1_NoMetaTags.mp4"
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
        echo Extraindo todas as faixas de áudio de "%%x"...
        ffmpeg -i "%~dpn1_NoMetaTags.mp4" -vn -map 0:a -c:a copy "%~dpn1_%%~na.aac"
        echo Renomeando as faixas de áudio para o padrão ISO 639-2...
        for %%a in ("%~dpn1_*.aac") do (
            if "%%~a"=="" (
                echo Não há faixas de áudio encontradas.
            ) else (
                for /F "delims=_" %%l in ("%%~na") do (
                    ffmpeg -i "%%~a" -c copy -metadata:s:a:0 language=%%l "%%~dpna_%%l.aac"
                )
            )
        )
        del "%~dpn1_NoMetaTags.mp4"
    )
) else (
    echo _____NENHUM ARQUIVO ENCONTRADO_____
)

pause
