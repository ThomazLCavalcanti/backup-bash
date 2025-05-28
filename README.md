# 🗂️ Script de Backup com Bash

Este script realiza backups de uma pasta específica no sistema Linux, comprimindo os arquivos em formato `.tar.gz` e salvando-os em um diretório de destino, com a data e hora incluídas no nome do arquivo.

---

## 🔧 Requisitos

- Sistema Linux ou compatível com shell Bash
- Comando `tar` disponível
- Permissão para ler a pasta de origem e gravar na pasta de destino

---

## 📁 Estrutura

- Pasta de origem: `/home/$USER/documentos`
- Pasta de destino: `/home/$USER/backups`
- Nome do arquivo: `backup_YYYY-MM-DD_HH-MM-SS.tar.gz`

---

## 🚀 Como usar

1. **Clone o repositório ou baixe o script:**
   ```bash
   git clone https://github.com/ThomazLCavalcanti/backup-bash.git
   cd backup-bash
   ```

2. **Dê permissão de execução:**
   ```bash
   chmod +x backup.sh
   ```

3. **Execute o script:**
   ```bash
   ./backup.sh
   ```

4. **Verifique o backup gerado:**
   O arquivo será salvo em `/home/seu_usuario/backups`.

---

## 📝 Personalização

Você pode editar as variáveis no início do script para ajustar os caminhos:

```bash
FONTE="/caminho/da/sua/pasta"
DESTINO="/caminho/do/destino/do/backup"
```

---

## ✅ Exemplo de saída

```bash
Backup realizado com sucesso: /home/seu_usuario/backups/backup_2025-05-28_14-30-00.tar.gz
```

---
