Feature: Validar endpoint GET /idiomas/{id}

  # Background común para todos los escenarios
  Background:
    # Base URL del servidor de producción
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    # Definir un id válido existente para pruebas
    * def idiomaId = 1

  # Escenario 1: Validar status 200 y tipo de datos en la respuesta
  Scenario: Obtener idioma por ID - status 200 y validación de tipos
    Given path 'idiomas', idiomaId
    When method get
    Then status 200
    # Validar que la respuesta tiene la estructura y tipos correctos
    And match response == { id: '#number', idioma: '#string',descripcion: '#string?'}
    # Comentario: El campo descripcion puede ser nulo según el contrato

  # Escenario 2: Validar status 200 y valor del id en la respuesta
  Scenario: Obtener idioma por ID - status 200 y validación de id
    Given path 'idiomas', idiomaId
    When method get
    Then status 200
    # Validar únicamente el valor del id en la respuesta
    And match response.id == idiomaId
    # Comentario: Solo se valida el campo id, el resto se omite

