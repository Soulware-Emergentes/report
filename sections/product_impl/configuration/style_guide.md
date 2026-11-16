Todo el código de la solución se escribe en inglés: nombres de paquetes, clases, métodos, variables, tablas, columnas, endpoints, claves de mensajes y comentarios. El español queda solo en los textos que ve el usuario. Las convenciones se agrupan por lenguaje.

Java sigue las Code Conventions for the Java Programming Language de Oracle y la Google Java Style Guide en nombres y estructura, con estas decisiones propias del equipo:
- Clases e interfaces en PascalCase, métodos y variables en camelCase, constantes en UPPER_SNAKE_CASE y paquetes en minúsculas sin separadores, por ejemplo identityprovider o publishedlanguage.
- Indentación de cuatro espacios. Cuando una lista de argumentos o parámetros no cabe en una línea, la continuación se indenta un nivel y el paréntesis de cierre va en su propia línea.
- En una cadena de métodos, el receptor y la primera llamada quedan en la misma línea y cada llamada siguiente va en una línea propia, indentada un nivel.
- Todo acceso a un miembro de instancia se califica con this, para distinguir un campo de una variable local y un método heredado de uno estático.
- Una expresión cuyo significado no es evidente, como la condición de un if, se asigna antes a una variable con un nombre que diga qué significa.
- Los nombres de clase dicen el rol que cumplen: FieldSheet es un agregado, FieldSheetRepository su repositorio, FieldSheetController la puerta REST, y las clases de prueba terminan en Test o, si necesitan base de datos, en IT.

La organización del código sigue los patrones tácticos de Domain-Driven Design descritos en el Capítulo V. Cada bounded context es un módulo de Spring Modulith con los paquetes domain, application, infrastructure e interfaces, más publishedlanguage cuando el módulo publica tipos para otros módulos. ArchUnit y Spring Modulith verifican en cada build las reglas de dependencia entre capas y módulos, y una violación falla las pruebas.

Las APIs REST siguen las convenciones de recursos: rutas versionadas bajo /api/v1, sustantivos en plural y kebab-case para los recursos (/field-sheets, /plots), identificadores como variables de ruta ({fieldSheetId}), y subrecursos para las acciones que cambian el estado de un recurso (/field-sheets/{fieldSheetId}/approval). Los errores responden con un formato de sobre común y claves de mensaje con la forma error.modulo.motivo, por ejemplo error.shared.unauthenticated.

SQL usa snake_case para tablas y columnas, con tablas en plural (plots, field_sheets) y palabras reservadas en mayúsculas. Cada cambio de esquema es una migración de Flyway llamada VN__descripcion.sql, donde N es su número de versión, por ejemplo V4__plots.sql, y una migración ya aplicada no se modifica: cualquier corrección va en una migración nueva. Cada migración explica en un comentario inicial las decisiones de modelado que el esquema no muestra por sí solo.

Gherkin se usa para los criterios de aceptación de las User Stories, en inglés y con las palabras clave Scenario, Given, When y Then, siguiendo Gherkin Conventions for Readable Specifications: cada escenario describe un solo comportamiento, Given establece el contexto, When contiene una única acción del usuario y Then el resultado observable, redactado desde la perspectiva del negocio y sin detalles de la interfaz.
