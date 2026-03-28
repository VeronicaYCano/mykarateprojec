Feature: Validar endpoint PUT /idiomas/{id} segun contrato OpenAPI

  # Background comun para todos los escenarios
  Background:
    # Base URL del servidor de produccion
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    # Definir un id valido existente para pruebas
    * def idiomaId = 1
    # Definir el body base para actualizacion
    * def idiomaActualizado = { idioma: 'Ingles', descripcion: 'Idioma hablado en varios paises' }

  # Escenario 1: Validar status 200 y tipo de datos en la respuesta al actualizar un campo
  Scenario: Actualizar idioma por ID - status 200 y validacion de tipos
    Given path 'idiomas', idiomaId
    And request { idioma: 'Ingles' }
      # Solo se actualiza el campo idioma
    When method put
    Then status 200
    # Validar que la respuesta tiene la estructura y tipos correctos
    And match response == { id: '#number', idioma: '#string', descripcion: '#string?' }

  # Escenario 2: Validar status 200 y valor completo del body en la respuesta
  Scenario: Actualizar idioma por ID - status 200 y validacion de body completo
    Given path 'idiomas', idiomaId
    And request idiomaActualizado
    When method put
    Then status 200
    # Validar que la respuesta coincide exactamente con el body enviado mas el id
    # Se usa #(variable) para interpolar variables en Karate DSL
    And match response == { id: #(idiomaId), idioma: #(idiomaActualizado.idioma), descripcion: #(idiomaActualizado.descripcion) }
