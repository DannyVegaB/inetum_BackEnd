Feature: Gestionar usuarios

  Background:
    * url 'https://serverest.dev/'

  Scenario: Listar usuarios existentes
    Given path 'usuarios'
    When method get
    Then status 200
    And print response
    * def response = response
    * def quantidade = response.quantidade
    * assert quantidade >= 0
    And print quantidade