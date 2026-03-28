Feature: API REST CRUD - Idiomas

# Background: configuración base para todos los escenarios
Background:
    # URL base del servidor de producción
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    * def idiomaRequest = { idioma: 'Francés', descripcion: 'Idioma hablado en Francia' }

# Escenario 1: Validar status 201 y tipo de dato en la respuesta
Scenario: Crear idioma y validar status 201 y tipo de dato en el body
    # Se envía un request válido para crear un idioma
    Given path 'idiomas'
    And request idiomaRequest
    When method post
    Then status 201
    # Validar que la respuesta contiene los campos esperados y tipos correctos
    And match response == { id: '#number', idioma: '#string', descripcion: '#string' }

# Escenario 2: Outline con ejemplos, validar status 201 y body completo (id solo tipo de dato)
Scenario Outline: Crear idioma con ejemplos y validar status 201 y body: <idioma>
    Given path 'idiomas'
    And request { idioma: '<idioma>', descripcion: '<descripcion>' }
    When method post
    Then status 201
    # Validar body completo, id solo tipo de dato
    And match response == { id: '#number', idioma: '<idioma>', descripcion: '<descripcion>' }

    Examples:
      | idioma   | descripcion                        |
      | Aleman   | Idioma hablado principalmente en Alemania |
      | Italiano | Idioma hablado en Italia           |

# Nota: Se recomienda limpiar los datos de prueba en un entorno real para evitar duplicados.
# Los ejemplos usan datos distintos para evitar conflictos en la base de datos.
