El backlog de drivers se construyó a partir de las User Stories de Primary Functionality, los Quality Attribute Scenarios y los Constraints. Cada driver se calificó según su importancia para los stakeholders y su impacto en la complejidad técnica de la arquitectura, y la tabla ordena primero los de importancia e impacto altos.

| Driver ID | Título de Driver | Descripción | Importancia para Stakeholders | Impacto en Architecture Technical Complexity |
| - | - | - | - | - |
| DRV-01 | Integridad de las fichas subidas | Detectar cualquier modificación de una ficha después de su subida (SGT-3, SGT-6, escenario de Seguridad). | High | High |
| DRV-02 | Datos de beneficiarios dentro de la institución | Procesar y almacenar los datos de beneficiarios sin usar servicios en la nube (TS-01). | High | High |
| DRV-03 | Interoperabilidad con otros sistemas | Consultar información de más de un sistema institucional mediante una API de integración (escenario de Interoperabilidad). | High | High |
| DRV-04 | Extracción automática de campos de la ficha | Extraer los campos críticos de la ficha para su revisión y corrección por el asistente (SGT-5). | High | High |
| DRV-05 | Acceso según el rol del usuario | Restringir las funciones disponibles según el rol de cada usuario (SGT-10). | High | Medium |
| DRV-06 | Visualización de puntos capturados | Mostrar en un mapa interactivo los puntos enviados por la estación total (SGT-2, escenario de Usabilidad). | Medium | Medium |
| DRV-07 | Conservación de la ficha oficial | Conservar el PDF de la ficha firmada como respaldo del expediente (TS-02). | Medium | Low |
