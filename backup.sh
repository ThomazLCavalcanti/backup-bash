#!/usr/bin/env bash
# Script de Backup Automatizado
# Autor: <Seu Nome>
# Data: 2025-05-23
#
# Este script compacta um diretório de origem em um arquivo com carimbo de data,
# salva localmente, envia (opcionalmente) para a AWS S3, e aplica uma política
# de retenção para excluir backups antigos.

set -euo pipefail

# Carrega variáveis de configuração do .env, se existir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"
if [[ -f "$ENV_FILE" ]]; then
  source "$ENV_FILE"
fi

# Valores padrão
SOURCE_DIR="${SOURCE_DIR:-/var/www}"
BACKUP_DIR="${BACKUP_DIR:-$SCRIPT_DIR/backups}"
RETENTION_DAYS="${RETENTION_DAYS:-7}"
S3_BUCKET="${S3_BUCKET:-}"   # Exemplo: s3://meubucket/backups

TIMESTAMP="$(date +'%Y-%m-%d_%H-%M-%S')"
ARCHIVE_NAME="$(basename "$SOURCE_DIR")_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

mkdir -p "$BACKUP_DIR"

echo "Criando arquivo $ARCHIVE_PATH ..."
tar -czf "$ARCHIVE_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [[ -n "$S3_BUCKET" ]]; then
  echo "Enviando $ARCHIVE_NAME para $S3_BUCKET ..."
  aws s3 cp "$ARCHIVE_PATH" "$S3_BUCKET/"
fi

# Remove arquivos antigos de acordo com a retenção
echo "Removendo backups com mais de $RETENTION_DAYS dias ..."
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime "+$RETENTION_DAYS" -print -delete

echo "Backup concluído com sucesso!"
