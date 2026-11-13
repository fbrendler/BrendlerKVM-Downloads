# Brendler™ KVM

**Um mouse e um teclado para todos os seus aparelhos.**
KVM por software para Windows, Android e Fire TV: leve o cursor até a borda da tela e passe a controlar outro PC, celular, tablet ou TV, sem trocar de periférico.

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
| `BrendlerClient-FireTV-<versão>.apk` | Fire TV Stick e outras TVs com Android (mesmo APK do Android) |

Use os arquivos da **mesma página de versão** em todos os aparelhos.

**Requisitos:** Windows 10 ou 11 (64 bits), Android 7.0 ou mais novo e Fire OS 7 ou mais novo, todos na mesma rede local.

## Como usar

1. **No PC principal**, abra o `BRENDLERServer.exe` e clique em **Iniciar servidor**. Na primeira vez, permita o programa no firewall do Windows (redes privadas).
2. **Pareie cada aparelho (só na primeira vez):** no servidor, em **Segurança**, clique em **Parear novo dispositivo** e use o código de 6 dígitos (válido por 2 minutos).
3. **Nos outros PCs**, abra o `BrendlerClient.exe`, digite o código em **Segurança** e clique em **Parear**.
4. **No Android**, instale o APK (permita "instalar apps desconhecidos"), ative o **serviço de acessibilidade** do app e toque em **Conectar**.
5. **No servidor**, arraste cada tela para a posição certa e clique em **Salvar**.
6. Leve o mouse até a borda da tela para passar para o outro aparelho. Para voltar, use a borda de retorno ou **F9**.

No Android, o **botão direito** do mouse é **Voltar** e o **botão do meio** faz o toque longo.

## Fire TV Stick

A instalação na TV é feita uma vez, pelo PC do servidor:

1. Na TV: **Configurações › Minha Fire TV › Sobre**, clique 7 vezes no nome do aparelho para liberar as **Opções do desenvolvedor**. Depois ligue **Depuração ADB** e permita **Apps de origem desconhecida**.
2. No PC do servidor, instale o ADB: `winget install Google.PlatformTools`.
3. No PC, com o IP da TV (**Configurações › Minha Fire TV › Sobre › Rede**):
   ```
   adb connect IP-DA-TV
   adb install -r BrendlerClient-FireTV-<versão>.apk
   adb shell pm grant com.example.kvmclient android.permission.WRITE_SECURE_SETTINGS
   ```
   Na primeira conexão, a TV pergunta se permite a depuração: marque **Sempre permitir** e escolha **Permitir**.
4. Abra o app na TV, toque em **Ativar** e depois em **Conectar**. Pareie como os outros aparelhos.

Deixe a **Depuração ADB** ligada: quando a TV conecta, o servidor usa o ADB do PC para iniciar nela um ajudante que faz as teclas do controle remoto e o clique de mouse. Depois de atualizar o app na TV, abra-o uma vez para ele reconectar.

Na TV, o botão direito e o do meio são **Voltar**, e as setas e o Enter do teclado funcionam como o controle remoto. Em apps feitos só para o controle remoto, como a **Netflix**, a roda do mouse move o destaque e o clique funciona como o **OK** (abre o item em destaque, não o que está embaixo do ponteiro).

## Segurança

- A comunicação usa **TLS**, com pareamento por código de 6 dígitos. Depois de parear, confira a **identidade do servidor** mostrada no cliente e no servidor.
- Os programas **ainda não são assinados digitalmente**, então o Windows pode mostrar "O Windows protegeu o computador". Clique em **Mais informações → Executar assim mesmo**.
- Para conferir se o download está íntegro, compare o SHA-256 do arquivo com o que aparece nas notas da versão. No PowerShell: `Get-FileHash .\BRENDLERServer-<versão>.exe -Algorithm SHA256`.

## Limitações

- Copiar e colar funciona só com **texto**.
- `Ctrl+Alt+Del` sempre age no PC principal.
- Programas abertos como administrador no PC extra podem ignorar o cliente; nesse caso, rode o `BrendlerClient.exe` como administrador também.
- No Android, alguns apps (jogos, campos de senha, apps protegidos) podem ignorar os toques e o texto, porque o controle usa o serviço de acessibilidade do sistema.
- Na Fire TV, em apps como a Netflix não dá para escolher um item apontando com o mouse (use a roda ou as setas), e o ç e as letras acentuadas saem como a letra simples.

## Privacidade

Os programas não enviam dados para os desenvolvedores. O texto copiado, as teclas e os movimentos do mouse trafegam só pela sua rede local, criptografados. Veja os [termos e a política de privacidade](TERMOS-E-PRIVACIDADE.md).

## Dê sua opinião

- Respondeu o formulário? Obrigado! Se ainda não: https://docs.google.com/forms/d/e/1FAIpQLSddDwyJyYAHb9AUyOxCz4mrtE7LsTi0Xcry_dMa1NjzJBXQag/viewform
- Encontrou um erro? [Abra uma issue](https://github.com/fbrendler/BrendlerKVM-Downloads/issues/new). O botão **Relatar problema**, em **Sobre** nos programas, copia o registro para você colar.

© 2026 Brendler. Todos os direitos reservados.
