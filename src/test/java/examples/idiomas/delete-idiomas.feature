Feature: DELETE /idiomas/{id}
# Pruebas para el endpoint DELETE de idiomas segun contrato OpenAPI

Background:
    # Apunta al servidor de produccion
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    # Definir un id de ejemplo para eliminar
    * def idiomaId = 1

Scenario: Eliminar idioma por ID - status 204 y body vacio
    Given path 'idiomas', idiomaId
    When method delete
    Then status 204
    # El body debe estar vacio (string vacio, no null)
    And match response == ''

