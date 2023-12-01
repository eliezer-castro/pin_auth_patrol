Feature: Autenticação de Usuários com Números de Telefone

  Scenario: Exibição de Números de Telefone Parcialmente Ocultos
    Given que o usuário abre o aplicativo de autenticação
    When a tela inicial é carregada
    Then uma lista de números de telefone com os últimos dois dígitos visíveis deve ser exibida

  Scenario: Seleção de Número de Telefone
    Given que o usuário está na tela inicial
    When o usuário seleciona um número de telefone da lista
    Then o número de telefone selecionado deve ser confirmado e o usuário avança para a tela de confirmação

  Scenario: Alteração de País na Tela de Confirmação
    Given que o usuário está na tela de confirmação do número de telefone
    When o usuário seleciona a opção de alterar o país
    And escolhe um novo país da lista disponível
    Then o código do país do número de telefone deve ser atualizado

  Scenario: Navegação para Tela de Pincode
    Given que o usuário confirmou o número de telefone na tela anterior
    When o usuário clica no botão para avançar para a tela de Pincode
    Then a tela de Pincode é exibida

  Scenario: Alteração de Número de Telefone na Tela de Pincode
    Given que o usuário está na tela de Pincode
    When o usuário escolhe alterar o número de telefone
    Then o usuário é redirecionado para a tela inicial para selecionar um novo número

  Scenario: Funcionalidade de Reenviar Código Pincode
    Given que o usuário está na tela de Pincode
    And 30 segundos se passaram desde o último envio do código
    When o usuário clica no link para reenviar o código Pincode
    Then um novo código Pincode deve ser enviado ao usuário

  Scenario: Confirmação de Pincode
    Given que o usuário recebeu o código Pincode
    When o usuário insere o Pincode correto na tela de Pincode
    Then a confirmação é aceita e o usuário avança para a tela de sucesso

  Scenario: Navegação para Tela de Sucesso Após Confirmação do Pincode
    Given que o usuário inseriu corretamente o Pincode
    When o Pincode é validado
    Then o usuário é direcionado para a tela de sucesso, indicando a conclusão do processo de verificação
