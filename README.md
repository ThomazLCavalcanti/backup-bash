# Script de Backup Automatizado (Bash)

Este projeto oferece um **script Bash simples e portátil** para:

1. Compactar um diretório de origem em um arquivo `.tar.gz` com carimbo de data/hora  
2. Armazenar o arquivo compactado em uma pasta local `backups/`  
3. Excluir backups antigos conforme um período de retenção configurável  

## ⚙️ Pré-requisitos

- Linux ou macOS com Bash 4+
- `tar`, `gzip` e `find` (normalmente já instalados)

## 🔧 Configuração (`.env`)

| Variável         | Padrão             | Descrição                                  |
| ---------------- | ------------------ | ------------------------------------------ |
| `SOURCE_DIR`     | `/var/www`         | Diretório a ser copiado                    |
| `BACKUP_DIR`     | `./backups`        | Pasta local onde os arquivos serão salvos |
| `RETENTION_DAYS` | `7`                | Dias para manter os arquivos de backup     |

## 🗑️ Política de Retenção

Após cada backup bem-sucedido, o script remove arquivos `.tar.gz` mais antigos que o número de dias definido em `RETENTION_DAYS`.

## 🖥️ Exemplo de Agendamento com Cron

```cron
0 2 * * * /home/usuario/backup-script/backup.sh >> /var/log/backup.log 2>&1
```

## ✨ Licença

MIT — use como quiser, apenas mantenha os créditos.
