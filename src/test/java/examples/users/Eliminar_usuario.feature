Feature: Gestionar usuarios

  Background:
    * url 'https://serverest.dev/'

  Scenario: Registrar usuario valido
    Given path 'usuarios'
    And path '802yYn9ghWAFkF6A'
    When method delete
    Then status 200
    And print response
    * def response = response
    * def message = response.message
    * assert message == "Nenhum registro excluído"
    And print message
   