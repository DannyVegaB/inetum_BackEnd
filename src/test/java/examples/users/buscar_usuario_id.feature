Feature: Gestionar usuarios

  Background:
    * url 'https://serverest.dev/'

  Scenario: Buscar usuarios con id valido
    Given path 'usuarios'
    And path '0uxuPY0cbmQhpEz1'
    When method get
    Then status 200
    And print response

  Scenario: Buscar usuarios con id invalido
    Given path 'usuarios'
    And path '0uxuPY0cbmQhpEz2'
    When method get
    Then status 400
    And print response
    * def response = response
    * def message = response.message
    * assert message == "Usuário não encontrado"
    And print message
   