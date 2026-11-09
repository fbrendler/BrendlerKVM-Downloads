@echo off
REM Gera o arquivo SHA256SUMS.txt com o codigo de verificacao dos executaveis desta pasta.
REM Coloque este arquivo na MESMA pasta dos .exe e .apk de uma versao e de dois cliques.
powershell -NoProfile -Command "Get-ChildItem -File *.exe,*.apk | ForEach-Object { (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower() + '  ' + $_.Name } | Set-Content -Encoding ascii SHA256SUMS.txt"
echo.
echo Pronto! Veja o arquivo SHA256SUMS.txt e anexe-o a versao (release) junto com os programas.
pause
