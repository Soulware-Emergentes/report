Se refinan los Quality Attribute Scenarios de Primary Functionality, en orden de prioridad según el Architectural Drivers Backlog. Cada cuadro completa los campos del escenario y registra las preguntas que quedan abiertas.

Refinamiento 1: Seguridad

| Campo | Contenido |
| - | - |
| Scenario(s) | Intento de modificar una ficha ya subida. |
| Business Goals | Que la ficha aprobada coincida con la que subió el agente de campo (SGT-3, SGT-6). |
| Relevant Quality Attributes | Seguridad |
| Stimulus | Se intenta modificar el PDF de una ficha después de su subida. |
| Stimulus Source | Actor externo. |
| Environment | Operación normal. |
| Artifact (if known) | Repositorio de fichas y verificación de integridad. |
| Response | El sistema detecta la diferencia con el hash registrado y marca el documento como alterado. |
| Response Measure | 0 modificaciones no detectadas. |
| Questions | ¿Qué mecanismo respalda el registro de integridad: hash en base de datos o Blockchain? |
| Issues | El escenario original nombra Blockchain como artefacto, y esa decisión sigue evaluándose en DRV-01. |

Refinamiento 2: Interoperabilidad

| Campo | Contenido |
| - | - |
| Scenario(s) | Consulta de información a otros sistemas. |
| Business Goals | Reducir el traslado manual de información entre sistemas aislados. |
| Relevant Quality Attributes | Interoperabilidad |
| Stimulus | El sistema consulta información a otro sistema institucional. |
| Stimulus Source | Sistema. |
| Environment | Operación normal. |
| Artifact (if known) | API de integración. |
| Response | El sistema obtiene la información del sistema consultado. |
| Response Measure | Más de un sistema con el que interopera. |
| Questions | ¿Con qué sistemas institucionales debe interoperar y con qué formato de intercambio? |
| Issues | Las entrevistas indican que hoy no existe integración automática entre los sistemas. |

Refinamiento 3: Usabilidad

| Campo | Contenido |
| - | - |
| Scenario(s) | Primera consulta de los terrenos de los beneficiarios. |
| Business Goals | Que el agente de campo detecte y corrija errores de medición durante la misma visita (SGT-2). |
| Relevant Quality Attributes | Usabilidad |
| Stimulus | Un usuario consulta los terrenos de los beneficiarios por primera vez. |
| Stimulus Source | Usuario. |
| Environment | Operación normal. |
| Artifact (if known) | Mapa interactivo. |
| Response | El usuario comprende el flujo de consulta. |
| Response Measure | Menos de 5 minutos. |
| Questions | ¿Cómo se determina que el usuario comprendió el flujo? |
| Issues | Ninguna. |
