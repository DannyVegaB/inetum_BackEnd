Feature: Gestionar usuarios

  Background:
    * url 'https://serverest.dev/'

  Scenario: Actualizar usuarios con datos validos
    Given path 'usuarios'
    And path '0uxuPY0cbmQhpEz1'
    And request
    """
       {
      "nome": "Fulano da Silva2",
      "email": "beltrano2@qa.com.br",
      "password": "teste",
      "administrador": "true"
      }
    """
    When method put
    Then status 200
    And print response
    * def response = response
    * def message = response.message
    * assert message == "Registro alterado com sucesso"
    And print message

  Scenario: Buscar usuarios con correo existente
    Given path 'usuarios'
    And path '0uxuPY0cbmQhpEz1'
    And request
    """
       {
      "nome": "Fulano da Silva2",
      "email": "beltrano@qa.com.br",
      "password": "teste",
      "administrador": "true"
      }
    """
    When method put
    Then status 400
    And print response
    * def response = response
    * def message = response.message
    * assert message == "Este email já está sendo usado"
    And print message
   