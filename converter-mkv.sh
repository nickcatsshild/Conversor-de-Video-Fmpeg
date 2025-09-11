#!/bin/bash
# Diretórios de entrada e saída
INPUT_DIR="/mnt/SERIES3/Converter"
OUTPUT_DIR="/mnt/SERIES3/Convertidos"
SUCCESS_LOG="$OUTPUT_DIR/success.log"
ERROR_LOG="$OUTPUT_DIR/error.log"
# Garante que o diretório de saída exista, caso contrário, cria-o
mkdir -p "$OUTPUT_DIR"
# Inicializa os logs
> "$SUCCESS_LOG"
> "$ERROR_LOG"
# Obtém a lista de arquivos no diretório de entrada
FILES="$INPUT_DIR"/*
# Loop para processar cada arquivo
for file in $FILES; do
    # Obtém apenas o nome do arquivo (sem caminho e extensão)
    filename=$(basename -- "$file")
    filename_noext="${filename%.*}"
    # Caminho completo do arquivo de saída
    output_file="$OUTPUT_DIR/$filename_noext.mkv"
    # PRINCIPAL
    ffmpeg -i "$file" -c:v libx265 -crf 28 -c:a aac -strict -2 -c:s mov_text "$output_file" &&
    {
        # Remove as metatags usando exiftool
        exiftool -all= "$output_file"
        # Exclui o arquivo de origem se a conversão for bem-sucedida
        rm "$file"
        # Log de sucesso
        echo "Conversão bem-sucedida: $filename" >> "$SUCCESS_LOG"
    } || {
        # Log de erro
        echo "Erro na conversão: $filename" >> "$ERROR_LOG"
    }
done
echo "Conversão concluída. Os arquivos convertidos foram salvos em: $OUTPUT_DIR"
