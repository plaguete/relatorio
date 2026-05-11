# Gerador de Relatório Diário ABNT

Este é um site completo para geração de relatórios diários formatados segundo as normas ABNT, com upload automático para Google Drive.

## Funcionalidades

- ✅ Formatação completa ABNT (margens, fonte Times 12, espaçamento 1.5, recuo 1.25cm)
- ✅ Numeração hierárquica progressiva (1, 1.1, 1.1.1...)
- ✅ Geração de PDF e DOCX
- ✅ Campo para logo institucional
- ✅ Upload automático para pasta específica no Google Drive
- ✅ Autenticação OAuth2 moderna e segura

## 🚀 Hospedagem no GitHub Pages

Para testar diretamente no GitHub (recomendado para autenticação Google):

### 1. Criar Repositório no GitHub
1. Acesse [GitHub.com](https://github.com) e faça login
2. Clique em "New repository" (botão verde)
3. Nome: `relatorio-abnt` (ou qualquer nome)
4. Descrição: "Gerador de Relatórios ABNT com Google Drive"
5. **IMPORTANTE:** Deixe público (Public)
6. **NÃO** marque "Add a README file"
7. Clique em "Create repository"

### 2. Fazer Upload dos Arquivos

#### Opção A: Upload Manual (Mais Fácil)
1. No repositório criado, clique em **"Add file"** > **"Upload files"**
2. Arraste todos os arquivos da pasta para o GitHub:
   - `index.html`
   - `README.md` 
   - `iniciar_servidor.bat`
   - `.gitignore`
   - `package.json`
3. Clique em **"Commit changes"**

#### Opção B: Via Git (Se Preferir)
```bash
# Instalar Git primeiro (se não tiver)
# Depois executar:
git init
git add .
git commit -m "Primeiro commit - Gerador de Relatórios ABNT"
git branch -M main
git remote add origin https://github.com/SEU_USERNAME/NOME_DO_REPO.git
git push -u origin main
```

### 3. Ativar GitHub Pages
1. No repositório, vá para **Settings** (engrenagem)
2. Role para baixo até **Pages**
3. Em "Source", selecione **Deploy from a branch**
4. Em "Branch", selecione **main** (ou master)
5. Clique em **Save**
6. **Aguarde 2-3 minutos** para o site ficar online
7. O URL será: `https://SEU_USERNAME.github.io/NOME_DO_REPO/`

### 4. Configurar Google OAuth para GitHub Pages
1. Volte ao [Google Cloud Console](https://console.cloud.google.com/)
2. Vá para **APIs e Serviços** > **Credenciais**
3. Clique no seu **Client ID OAuth**
4. Em **URIs de redirecionamento autorizados**, adicione:
   ```
   https://SEU_USERNAME.github.io/NOME_DO_REPO/
   ```
5. Em **Origens JavaScript autorizadas**, adicione:
   ```
   https://SEU_USERNAME.github.io
   ```
6. Clique em **Salvar**

### 5. Atualizar o Código
No arquivo `index.html`, substitua o `CLIENT_ID` pelo seu Client ID atual (se necessário).

### 6. Testar
- Acesse o URL do GitHub Pages
- Clique em "Reautenticar" para fazer login
- Teste gerar e enviar relatórios!

## Como Usar

### 1. Configuração Inicial (Google Cloud Console)

Siga os passos detalhados na seção "Configuração do Google Drive" abaixo.

### 2. Executando o Site

**IMPORTANTE:** Para a autenticação Google funcionar, o site deve ser hospedado localmente (não abrir como arquivo file://).

#### Opção 1: Arquivo .bat (Windows - mais fácil)
```bash
# Clique duas vezes no arquivo "iniciar_servidor.bat"
# Ou execute no terminal: iniciar_servidor.bat
```

#### Opção 2: Python (recomendado)
```bash
cd "caminho/para/pasta/do/projeto"
python -m http.server 8000
```
Depois abra: http://localhost:8000

#### Opção 3: Node.js
```bash
npx http-server -p 8000
```
Depois abra: http://localhost:8000

#### Opção 4: PHP
```bash
php -S localhost:8000
```
Depois abra: http://localhost:8000

### 3. Usando o Site

1. **Preencha os campos:**
   - Título do Relatório
   - Autor
   - Data
   - Instituição
   - Logo (opcional - clique para selecionar imagem)
   - Seções do relatório (Introdução, Objetivos, etc.)

2. **Gere os documentos:**
   - "Gerar e Enviar PDF" - cria PDF ABNT e envia para Drive
   - "Gerar e Enviar DOC" - cria DOCX ABNT e envia para Drive
   - "Gerar Ambos" - cria ambos formatos

3. **Autenticação:**
   - Na primeira vez, clique em "Reautenticar" para fazer login no Google
   - Autorize o acesso ao Google Drive
   - Os arquivos serão salvos automaticamente na pasta especificada

## Configuração do Google Drive

Para integrar com o Google Drive, siga estes passos detalhados (baseado na documentação oficial do Google atualizada para 2026). Você precisará de uma conta Google e acesso ao Google Cloud Console.

### 1. Criar ou Selecionar um Projeto no Google Cloud Console
- Acesse [Google Cloud Console](https://console.cloud.google.com/).
- Se você não tem um projeto, clique em "Criar Projeto" (ou "Create Project").
- Dê um nome ao projeto (ex.: "Gerador Relatorios ABNT").
- Clique em "Criar".

### 2. Habilitar a Google Drive API
- No menu lateral esquerdo, clique em "APIs e Serviços" > "Biblioteca" (APIs & Services > Library).
- Procure por "Google Drive API".
- Clique nela e depois em "Habilitar" (Enable).

### 3. Configurar a Tela de Consentimento OAuth
- No menu lateral, vá para "APIs e Serviços" > "OAuth consent screen" (ou "Google Auth platform" > "Branding").
- Se for a primeira vez, clique em "Get Started".
- Preencha:
  - **App name**: Nome do app (ex.: "Gerador de Relatórios").
  - **User support email**: Seu e-mail de suporte.
  - Clique em "Next".
  - **Audience**: Selecione "Internal" (para uso pessoal) ou "External" (para público).
  - Clique em "Next".
  - **Contact Information**: Adicione seu e-mail.
  - Clique em "Next".
  - Aceite os termos e clique em "Continue" > "Create".
- Isso configura a tela de consentimento.

### 4. Criar Credenciais OAuth 2.0 para Aplicativo Web
- No menu lateral, vá para "APIs e Serviços" > "Credenciais" (Credentials).
- Clique em "Criar Credenciais" > "ID do cliente OAuth" (Create Credentials > OAuth client ID).
- Selecione "Aplicativo da Web" (Web application).
- Dê um nome (ex.: "Web Client").
- Em "Origens JavaScript autorizadas" (Authorized JavaScript origins), adicione somente a origem base, sem caminho e sem barra final:
  - `http://localhost` (para testes locais).
  - `https://plaguete.github.io` (sem `/relatorio/`).
- Em "URIs de redirecionamento autorizados" (Authorized redirect URIs), adicione o endereço completo que contém o caminho, por exemplo:
  - `http://localhost` (ou `http://localhost:8000` se usar porta).
  - `https://plaguete.github.io/relatorio/`.
- Clique em "Criar".
- Copie o **Client ID** gerado. Cole no código do `index.html` em `CLIENT_ID`.

### 5. (Opcional) Criar uma Chave de API
- Embora o código use OAuth principalmente, se precisar de API Key para inicialização, crie uma:
- Em "Credenciais", clique em "Criar Credenciais" > "Chave de API" (API Key).
- Copie a chave gerada. Cole em `API_KEY` no código.
- **Nota**: Para apps web puros, a API Key pode não ser necessária; o OAuth cuida da autenticação.

### 6. Obter o ID da Pasta no Google Drive
- Acesse [Google Drive](https://drive.google.com/).
- Crie uma nova pasta (clique direito > Nova pasta, nomeie como "Relatorios ABNT").
- Abra a pasta.
- Na URL do navegador, copie a parte após `/folders/` (ex.: se a URL for `https://drive.google.com/drive/folders/1ABC123...`, o ID é `1ABC123...`).
- Cole no código em `SUA_PASTA_ID_AQUI`.

### 7. Substituir no Código
- Abra o `index.html`.
- Substitua `'SEU_CLIENT_ID_AQUI'` pelo Client ID.
- Substitua `'SUA_API_KEY_AQUI'` pela API Key (se criada).
- Substitua `'SUA_PASTA_ID_AQUI'` pelo ID da pasta.

### Dicas Adicionais
- Para testes locais, use um servidor HTTP (ex.: `npx http-server` via Node.js) em vez de abrir diretamente o arquivo, pois a API do Google requer HTTPS ou localhost com servidor.
- Se houver erros de CORS ou autenticação, verifique se as origens estão corretas.
- O escopo usado é `https://www.googleapis.com/auth/drive.file` para upload de arquivos.
- Se o projeto for para produção, considere publicar o app e ajustar as configurações de segurança.

Se encontrar problemas, consulte a [documentação oficial do Google Drive API](https://developers.google.com/drive/api/quickstart/js).

## Estrutura do Relatório ABNT

O relatório segue rigorosamente as normas ABNT:

- **Fonte:** Times New Roman ou Arial, tamanho 12
- **Margens:** Superior/Inferior: 3cm, Esquerda/Direita: 2cm
- **Espaçamento:** 1.5 entre linhas
- **Recuo:** 1.25cm para parágrafos
- **Alinhamento:** Justificado
- **Numeração:** Progressiva (1, 1.1, 1.1.1...)
- **Quebra de página:** Antes de títulos principais

## Estrutura dos Arquivos Gerados

```
Nome do Arquivo: [TÍTULO].pdf / [TÍTULO].docx

INSTITUIÇÃO
[Logo se fornecido]

TÍTULO DO RELATÓRIO

Data: [DATA]
Autor: [AUTOR]

1 INTRODUÇÃO
[texto da introdução]

2 OBJETIVOS
[texto dos objetivos]

3 MATERIAIS UTILIZADOS
[texto dos materiais]

4 PARTE EXPERIMENTAL
[texto da parte experimental]

5 RESULTADOS E DISCUSSÃO
[texto dos resultados]

6 OBSERVAÇÕES
[texto das observações]

7 BIBLIOGRAFIA
[texto da bibliografia]
```

## Tecnologias Utilizadas

- **Frontend:** HTML5, CSS3, JavaScript ES6+
- **PDF:** jsPDF v2.5.1
- **DOCX:** docx v7.8.2
- **Autenticação:** Google Identity Services
- **Upload:** Google Drive API v3

## Resolução de Problemas

### Biblioteca DOCX não carrega
- Verifique sua conexão com internet
- Recarregue a página (F5)
- Se persistir, use apenas PDF por enquanto

### Autenticação não funciona
- Certifique-se de que o site está rodando em `http://localhost:8000` (não file://)
- Verifique se o Client ID está correto no código
- Clique em "Reautenticar" se necessário

### Upload falha
- Verifique se você autorizou o acesso ao Google Drive
- Confirme se a pasta de destino existe no Drive
- Verifique sua conexão com internet

## Desenvolvimento

Para modificar o código:
- Edite o `index.html` (contém todo o código)
- Para testar mudanças, reinicie o servidor local
- As bibliotecas são carregadas via CDN automaticamente

## Notas

- Certifique-se de que o navegador permite pop-ups para a autenticação do Google.
- O PDF é gerado localmente no navegador e enviado via API.
- Para desenvolvimento, sempre use um servidor HTTP local (não abra como file://).