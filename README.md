# Conversor de Video Fmpeg
 Script converter videos com Fmpeg
 * Objetivo desse script é converter videos para o formatos desejaveis de uma forma automatizada e simples *

Antes de começar baixe e descompate o ffmpeg na ultima versão para dentro da pasta onde estão os scripts.
Os executáveis do ffmpeg deve estar exatamente dentro do diretório onde estão os scripts.
https://ffmpeg.org/download.html#build-windows

Para aqueles que preferem evitar o uso de programas baseados em linha de comando, desenvolvemos uma série de scripts simplificados para Windows. Estes scripts operam com a facilidade de arrastar e soltar. Basta baixar, descompactar os arquivos, arrastar seus vídeos para o script correspondente e o sistema executará as conversões instantaneamente.

Requisito Essencial: É necessário ter o FFMPEG instalado em seu computador. Caso não tenha, siga as instruções detalhadas em nosso artigo: "Como Instalar o FFEPG no Windows".

Faça o download dos Scripts Prontos FFMPEG para Windows e Linux que em breve vou disponibilizar.

Abaixo, fornecemos uma breve explicação sobre cada script. Para uma compreensão mais detalhada, recomendamos assistir ao vídeo explicativo em nosso canal do YouTube.

Instruções de Uso:
Certifique-se de ter o FFMPEG instalado em seu computador. Caso contrário, você pode baixar os arquivos compactados e descompactá-los na mesma pasta onde estão localizados os scripts.

    Video para MKV
        Converte arquivos de áudio único de vários formatos para MKV. Este script apenas altera o contêiner para MKV, mantendo o restante inalterado.

    Video para MP4 áudio único
        Converte arquivos de áudio único de vários formatos para MP4. Este script apenas altera o contêiner para MP4, mantendo o restante inalterado.

    Áudio para AAC
        Altera apenas o codec de áudio de um vídeo, mantendo o restante inalterado, incluindo o contêiner.

    Video para MP4 Dual
        Converte arquivos de áudio dual de vários formatos para MP4. Este script altera o contêiner para MP4, preservando as duas faixas de áudio e mantendo o restante inalterado.

    Video Para MP4 H264 AAC
        Converte o vídeo para MP4, alterando o codec de vídeo para H264 e o áudio para AAC, proporcionando maior compatibilidade para streaming com Plex, Emby ou Jellyfin. Este script é aplicável apenas a arquivos de áudio único.

    Video para MP4 Dual H264
        Converte o vídeo para MP4, alterando o codec de vídeo para H264 e mantendo as duas faixas originais de áudio. Ideal para maior compatibilidade de streaming com Plex, Emby e Jellyfin.

# NOVOS SCRIPTS

Mais algumas atualizações acabei fazendo a fim de contribuir para melhorar a conversão.
Foi incluido script para converter em h265 e tambem no formato vp8 e vp9 removendo meta tags dos videos e mantendo mesmo tamanho do video.

# CONVERSAO COM FFMPEG EM LINUX

Tambem desenvolvi um script para usar no servdor linux pode ser usado como serviço onde tem um diretorio de entradae um diretorio de saida. ( Obsevação que faço ele consome um pouco de recurso ao estar ativado como serviço )
