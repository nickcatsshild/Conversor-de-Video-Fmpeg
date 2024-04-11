@echo off
echo %CD%
echo %~dp0
cd /d %~dp0

REM Para o primeiro arquivo
REM %1
REM Para vários arquivos
echo %*

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
        REM Remove as meta tags do arquivo antes de converter para H.265
        ffmpeg -i %%x -map_metadata -1 -c copy "%%~dpn_NoMetaTags.mp4"
        REM Converte o arquivo sem as meta tags para H.265 e salva no mesmo local do arquivo de origem
        ffmpeg -i "%%~dpn_NoMetaTags.mp4" -c:v libx265 -crf 28 -c:a aac -strict -2 -c:s mov_text "%%~nx_NoMetaTags.H265.AAC.mp4"
        REM Exclui o arquivo temporário sem as meta tags
        del "%%~dpn_NoMetaTags.mp4"
    )
) else (
    echo _____NENHUM ARQUIVO ENCONTRADO_____
)

pause
