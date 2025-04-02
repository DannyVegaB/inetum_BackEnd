Feature: Gestionar usuarios

  Background:
    * url 'https://serverest.dev/'

  Scenario: Registrar usuario con correo existente
    Given path 'usuarios'
    And request
    """
      {
        "nome": "Fulano da Silva4",
        "email": "beltrano4@qa.com.br",
        "password": "teste",
        "administrador": "true"
      }
    """
    When method post
    Then status 400
    And print response
   
Scenario: Registrar usuario con correo aleatorio
    * def randomNumber = Math.floor(Math.random() * 10000)
    * def emailGenerado = 'beltrano' + randomNumber + '@qa.com.br'
    Given path 'usuarios'
    And request
    """
    {
      "nome": "Fulano da Silva4",
      "email": "#(emailGenerado)",
      "password": "teste",
      "administrador": "true"
    }
    """
    When method post
    Then status 201
    And print response
    * def response = response
    * def message = response.message
    * assert message == "Cadastro realizado com sucesso"
    And print message
    




