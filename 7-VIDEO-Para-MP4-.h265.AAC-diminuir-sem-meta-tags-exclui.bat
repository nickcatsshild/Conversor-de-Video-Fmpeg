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
        echo Convertendo "%%x" para H.265 com áudio AAC...
        ffmpeg -i "%~dpn1_NoMetaTags.mp4" -map 0 -c:v libx265 -crf 28 -c:a aac -strict -2 -c:s mov_text "%%~dpn1.mp4"

        REM Verificar se a conversão foi concluída corretamente
        if exist "%~dpn1.mp4" (
            echo Conversão concluída com sucesso. Excluindo arquivo de origem...
            del "%%x"
        ) else (
            echo Erro na conversão de "%%x". O arquivo de destino não foi criado.
        )

        REM Identificar e renomear faixas de áudio
        ffmpeg -i "%~dpn1_NoMetaTags.mp4" 2>&1 | findstr "Stream #0:1" | findstr "Audio" >nul && (
            for /f "tokens=3 delims=, " %%a in ('ffmpeg -i "%~dpn1_NoMetaTags.mp4" 2^>^&1 ^| findstr "Stream #0:1" ^| findstr "Audio"') do (
                ffmpeg -i "%~dpn1.mp4" -map 0:1 -c:a copy "%~dpn1_audio_%%a.m4a"
            )
        )

        REM Identificar e renomear legendas
        ffmpeg -i "%~dpn1_NoMetaTags.mp4" 2>&1 | findstr "Stream #0:2" | findstr "Subtitle" >nul && (
            for /f "tokens=3 delims=, " %%a in ('ffmpeg -i "%~dpn1_NoMetaTags.mp4" 2^>^&1 ^| findstr "Stream #0:2" ^| findstr "Subtitle"') do (
                ffmpeg -i "%~dpn1.mp4" -map 0:2 -c:s copy "%~dpn1_subtitle_%%a.srt"
            )
        )

        del "%~dpn1_NoMetaTags.mp4"
    )
) else (
    echo _____NENHUM ARQUIVO ENCONTRADO_____

    REM Criação de um logo de erro
    echo Criando logo de erro...
    echo Erro > error_logo.txt
)

pause
