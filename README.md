# README.md para o Projeto de Autenticação com Números de Telefone

## Descrição do Projeto

Este projeto implementa um aplicativo de autenticação que utiliza números de telefone para verificar a identidade do usuário. O processo envolve várias etapas, desde a seleção de um número de telefone parcialmente oculto até a confirmação final do usuário, passando pela inserção de um pincode recebido.

## Sobre o Patrol e Uso de Page Objects

O Patrol é um framework de testes avançado para aplicativos Flutter, ideal para interagir com funcionalidades nativas da plataforma. Neste projeto, utilizamos o Patrol para garantir uma cobertura de testes abrangente, incluindo interações com elementos nativos e comportamento do aplicativo em diferentes ambientes.

### Por que Usar o Patrol

- **Interatividade com Funcionalidades Nativas:** Essencial para testar aspectos cruciais do processo de autenticação.
- **Consistência em Diferentes Ambientes:** Garante o funcionamento adequado do aplicativo em diversos dispositivos e sistemas operacionais.
- **Eficiência no Desenvolvimento e Testes:** Facilita a integração e agiliza o processo de testes com o Flutter.

### Uso de Page Objects

O padrão Page Object visa melhorar a manutenibilidade e a clareza do código de teste. Este padrão envolve a criação de objetos que representam páginas ou componentes da interface do usuário, encapsulando as interações e os elementos de cada página, o que torna os testes mais legíveis e fáceis de atualizar.

## Funcionalidades

- **Tela Inicial:** Exibe uma lista de números de telefone com apenas os últimos dois dígitos visíveis.
- **Seleção e Confirmação de Número:** Permite que o usuário selecione e confirme um número de telefone da lista.
- **Alteração de País:** Oferece a opção de alterar o país, suportando diferentes códigos de país.
- **Tela de Pincode:** Possibilita a alteração do número de telefone e o reenvio do código pin após 30 segundos.
- **Tela de Sucesso:** Indica a conclusão bem-sucedida do processo de verificação.

## Dados para Testes

Utilize os seguintes números de telefone e códigos de confirmação nos testes:

- **Paraguai:** Telefone: (21) 123-4567, Código: 722869
- **Argentina:** Telefone: (11) 2345-6789, Código: 483899
- **Equador:** Telefone: (02) 234-5678, Código: 816923
- **Brasil:** Telefone: (11) 93456-7890, Código: 627064
- **Brasil:** Telefone: (21) 94567-8901, Código: 540890

## Tecnologias Utilizadas

- **Flutter:** Framework de desenvolvimento multiplataforma.
- **Flutter Test, Patrol:** Para a implementação de testes automatizados.

## Estrutura dos Testes

Os testes cobrem desde a exibição inicial dos números de telefone até a navegação para a tela de sucesso após a confirmação do pincode.

## Versões das Tecnologias Utilizadas

- **Flutter:** `Versão 3.13.7`
- **Dart:** `Versão 3.1.3`
- **Patrol:** `Versão ^2.3.2`
- **Patrol CLI:** `Versão v2.2.2`
- **Patrol Finders:** `1.0.0`

### Como Verificar as Versões

Para verificar as versões das tecnologias usadas, execute os seguintes comandos no terminal:

- _Flutter:_ `flutter --version`
- _Dart:_ `dart --version`
- _Patrol CLI:_ `patrol --version`

## Como Executar os Testes

1. Clone o repositório.
2. Navegue até a pasta do projeto.
3. Execute `patrol test --target integration_test\tests` no terminal.

## Contribuições

Contribuições são bem-vindas. Abra uma issue ou envie um pull request para melhorias ou correções.

## Licença

Este projeto está sob licença [INSERIR NOME DA LICENÇA]. Consulte o arquivo LICENSE para mais detalhes.

---
