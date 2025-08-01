@echo off
title Painel de Manutenção
color 0A

:menu
cls
echo =====================================
echo         PAINEL DE MANUTENCAO
echo =====================================
echo 1 - Ver configuracoes de IP (ipconfig /all)
echo 2 - Renovar IP (release / renew)
echo 3 - Flush DNS
echo 4 - Reinicio rapido do computador
echo 5 - Limpeza de arquivos temporarios
echo 6 - Verificacao de integridade (SFC / CHKDSK / Verifier)
echo 7 - Diagnostico DirectX (dxdiag)
echo 8 - Atualizar programas via Winget
echo 9 - Correcao de erros de impressao(nao usado no momento)
echo 10 - Reiniciar spooler de impressao(nao usado no momento)
echo 11 - Limpar cache dos navegadores
echo 0 - Sair
echo =====================================
set /p opcao=Escolha uma opcao: 

if "%opcao%"=="1" goto ipconfig
if "%opcao%"=="2" goto renovarIP
if "%opcao%"=="3" goto flushDNS
if "%opcao%"=="4" goto reboot
if "%opcao%"=="5" goto limpezaTemp
if "%opcao%"=="6" goto integridade
if "%opcao%"=="7" goto dxdiag
if "%opcao%"=="8" goto winget
if "%opcao%"=="9" goto correcaoImpressao
if "%opcao%"=="10" goto spooler
if "%opcao%"=="11" goto limparCache
if "%opcao%"=="0" goto sair
goto menu

:ipconfig
cls
echo Exibindo configuracoes de IP...
ipconfig /all
pause
goto menu

:renovarIP
cls
echo Liberando IP...
ipconfig /release
echo Renovando IP...
ipconfig /renew
pause
goto menu

:flushDNS
cls
echo Limpando cache de DNS...
ipconfig /flushdns
pause
goto menu

:reboot
cls
echo Reiniciando o computador...
shutdown /r /t 0
goto fim

:limpezaTemp
cls
echo Limpando arquivos temporarios...
del /s /f /q %temp%\* > nul
del /s /f /q C:\Windows\Temp\* > nul
cleanmgr /sagerun:1
pause
goto menu

:integridade
cls
echo Verificando integridade do sistema...
sfc /scannow
chkdsk C: /f
verifier
pause
goto menu

:dxdiag
cls
echo Abrindo diagnostico DirectX...
start dxdiag
pause
goto menu

:winget
cls
echo Atualizando programas com Winget...
winget upgrade --all
pause
goto menu

:correcaoImpressao
cls
echo Corrigindo erros de impressao (0x0000011b, 0x00000709, etc)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f
net stop spooler
net start spooler
pause
goto menu

:spooler
cls
echo Reiniciando spooler de impressao...
net stop spooler
net start spooler
pause
goto menu

:limparCache
cls
echo Limpando cache dos navegadores...

:: Chrome
del /q /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" > nul

:: Edge
del /q /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" > nul

:: Firefox
for /d %%x in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /q /s "%%x\cache2\*" > nul
)

echo Cache dos navegadores limpo.
pause
goto menu

:sair
exit

:fim
