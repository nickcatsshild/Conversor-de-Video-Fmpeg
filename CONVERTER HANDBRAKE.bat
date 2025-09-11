@echo off

REM Loop para cada argumento (item arrastado)
:loop
if "%~1"=="" goto end

REM Obtém o diretório do arquivo de vídeo original
set "videoDir=%~dp1"

REM Itera pelos arquivos em todas as pastas e subpastas no diretório atual (%~1)
FOR /R "%~1" %%G IN (*.mkv) do (
    REM Obtém o nome do arquivo sem extensão
    set "fileName=%%~nG"

    REM Executa o HandBrakeCLI para converter o arquivo de vídeo sem suporte para NVENC
    "C:\Program Files\Handbrake\HandBrakeCLI" -i "%%G" -o "!videoDir!\!fileName!.mp4" -e x265 --encoder-preset medium --encoder-profile main --encoder-level 3.1 -q 28 --cfr --aencoder av_aac -E copy --all-audio --all-subtitles --optimize --verbose=1 
)

REM Desloca os argumentos para processar o próximo item
shift
goto loop

:end
echo Conversão concluída. Pressione qualquer tecla para continuar.
pause
