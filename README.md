# Script de Backup Automatizado (Bash)

Este projeto oferece um **script Bash simples e portátil** para:

1. Compactar um diretório de origem em um arquivo `.tar.gz` com carimbo de data/hora  
2. Armazenar o arquivo compactado em uma pasta local `backups/`  
3. _Opcionalmente_ enviar o arquivo para um bucket S3 da AWS  
4. Excluir backups antigos conforme um período de retenção configurável  

## ⚙️ Pré-requisitos

- Linux ou macOS com Bash 4+
- `tar`, `gzip` e `find` (normalmente já instalados)
- (Opcional) **AWS CLI** configurado, se quiser enviar para o S3

## 🚀 Uso Rápido

```bash
git clone <repo-url>
cd backup-script
cp .env.example .env        # edite os valores de acordo com seu ambiente
./backup.sh
```

## 🔧 Configuração (`.env`)

| Variável         | Padrão             | Descrição                                  |
| ---------------- | ------------------ | ------------------------------------------ |
| `SOURCE_DIR`     | `/var/www`         | Diretório a ser copiado                    |
| `BACKUP_DIR`     | `./backups`        | Pasta local onde os arquivos serão salvos |
| `RETENTION_DAYS` | `7`                | Dias para manter os arquivos de backup     |
| `S3_BUCKET`      | _(vazio)_          | URI do bucket S3 (`s3://bucket/pasta`)     |

## 🗑️ Política de Retenção

Após cada backup bem-sucedido, o script remove arquivos `.tar.gz` mais antigos que o número de dias definido em `RETENTION_DAYS`.

## 🖥️ Exemplo de Agendamento com Cron

```cron
0 2 * * * /home/usuario/backup-script/backup.sh >> /var/log/backup.log 2>&1
```

## ✨ Licença

MIT — use como quiser, apenas mantenha os créditos. Divirta-se!
