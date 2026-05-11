@echo off
echo Iniciando servidor local para o Gerador de Relatorios ABNT...
echo.
echo O site sera acessivel em: http://localhost:8000
echo.
echo Pressione Ctrl+C para parar o servidor
echo.
cd /d "%~dp0"
python -m http.server 8000