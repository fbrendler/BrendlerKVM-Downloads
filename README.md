# Brendler™ KVM

**Um mouse e um teclado para todos os seus aparelhos.**
KVM por software para Windows e Android: leve o cursor até a borda da tela e passe a controlar outro PC, celular ou tablet, sem trocar de periférico.

**Página do projeto:** https://fbrendler.github.io/BrendlerKVM-Downloads/
**⬇️ Baixar:** [página da versão mais recente](https://github.com/fbrendler/BrendlerKVM-Downloads/releases/latest)

> Versão de testes gratuita. O código-fonte não é público; este repositório publica só os programas e a documentação de uso.

## Downloads

Na página da versão, em **Assets**:

| Arquivo | Onde instalar |
| --- | --- |
| `BRENDLERServer-<versão>.exe` | PC principal (o que tem o mouse e o teclado) |
| `BrendlerClient-<versão>.exe` | Cada PC Windows extra |
| `BrendlerClient-Android-<versão>.apk` | Celulares e tablets Android |
| `SHA256SUMS.txt` | Código de verificação dos arquivos |

Use a **mesma versão** em todos os aparelhos.

**Requisitos:** Windows 10 ou 11 (64 bits) e Android 7.0 ou mais novo, todos na mesma rede local.

## Como usar

1. **No PC principal**, abra o `BRENDLERServer.exe` e clique em **Iniciar servidor**. Na primeira vez, permita o programa no firewall do Windows (redes privadas).
2. **Pareie cada aparelho (só na primeira vez):** no servidor, em **Segurança**, clique em **Parear novo dispositivo** e use o código de 6 dígitos (válido por 2 minutos).
3. **Nos outros PCs**, abra o `BrendlerClient.exe`, digite o código em **Segurança** e clique em **Parear**.
4. **No Android**, instale o APK (permita "instalar apps desconhecidos"), ative o **serviço de acessibilidade** do app e toque em **Conectar**.
5. **No servidor**, arraste cada tela para a posição certa e clique em **Salvar**.
6. Leve o mouse até a borda da tela para passar para o outro aparelho. Para voltar, use a borda de retorno ou **F9**.

## Segurança

- A comunicação usa **TLS**, com pareamento por código de 6 dígitos. Depois de parear, confira a **identidade do servidor** mostrada no cliente e no servidor.
- Os programas **ainda não são assinados digitalmente**, então o Windows pode mostrar "O Windows protegeu o computador". Clique em **Mais informações → Executar assim mesmo**.
- Para conferir se o download está íntegro, compare o SHA-256 do arquivo com o do `SHA256SUMS.txt`. No PowerShell: `Get-FileHash .\BRENDLERServer-<versão>.exe -Algorithm SHA256`.

## Limitações

- Copiar e colar funciona só com **texto**.
- `Ctrl+Alt+Del` sempre age no PC principal.
- Programas abertos como administrador no PC extra podem ignorar o cliente; nesse caso, rode o `BrendlerClient.exe` como administrador também.
- No Android, alguns apps (jogos, campos de senha, apps protegidos) podem ignorar os toques e o texto, porque o controle usa o serviço de acessibilidade do sistema.

## Privacidade

Os programas não enviam dados para os desenvolvedores. O texto copiado, as teclas e os movimentos do mouse trafegam só pela sua rede local, criptografados. Veja os [termos e a política de privacidade](TERMOS-E-PRIVACIDADE.md).

## Dê sua opinião

- Respondeu o formulário? Obrigado! Se ainda não: https://forms.gle/COLE-AQUI-O-LINK-DO-SEU-FORMULARIO
- Encontrou um erro? [Abra uma issue](https://github.com/fbrendler/BrendlerKVM-Downloads/issues/new). O botão **Relatar problema**, em **Sobre** nos programas, copia o registro para você colar.

© 2026 Brendler. Todos os direitos reservados.
