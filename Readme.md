# Painel de Manutenção

Script de manutenção e diagnóstico desenvolvido em **Bat** para uso em ambientes Windows. O objetivo é oferecer um **painel interativo** que automatiza diversas tarefas comuns de infraestrutura de TI e suporte técnico.

Ideal para quem atua com **helpdesk, suporte N1/N2** ou deseja manter seu próprio computador limpo e funcional com um clique.

---

## Funcionalidades

O script oferece um menu interativo com as seguintes opções:

1. Ver configurações de IP (`ipconfig /all`)
2. Renovar IP (`ipconfig /release` + `renew`)
3. Flush de DNS (`ipconfig /flushdns`)
4. Reinício rápido do computador
5. Limpeza de arquivos temporários (`%temp%` e `C:\Windows\Temp`)
6. Verificação de integridade (SFC, CHKDSK, Verifier)
7. Diagnóstico DirectX (`dxdiag`)
8. Atualização de programas via **Winget**
9. Correção automática para erros de impressão (`0x0000011b`, `0x00000709`, etc.)
10. Reinício do serviço de spooler de impressão
11. Limpeza de cache dos navegadores (Chrome, Edge, Firefox)

---

## Como usar

Dê dois cliques no arquivo .bat.

Escolha a opção desejada no menu digitando o número.

O script executará automaticamente as ações selecionadas.
