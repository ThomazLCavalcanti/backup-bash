#!/bin/bash

# Configurações
FONTE="/home/$USER/documentos"
DESTINO="/home/$USER/backups"
DATA=$(date +"%Y-%m-%d_%H-%M-%S")
ARQUIVO="backup_$DATA.tar.gz"

# Cria o diretório de destino se não existir
mkdir -p "$DESTINO"

# Realiza o backup com compressão
tar -czf "$DESTINO/$ARQUIVO" -C "$FONTE" .

# Confirmação
echo "Backup realizado com sucesso: $DESTINO/$ARQUIVO"
