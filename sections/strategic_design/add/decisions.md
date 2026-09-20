Primera iteración de ADD, sobre los drivers de importancia e impacto altos: DRV-01, DRV-02 y DRV-03. Cada patrón se evaluó por cumplimiento del driver, cumplimiento de los Constraints y esfuerzo de implementación.

DRV-01: se selecciona el hash del PDF almacenado con el registro de la ficha (SGT-3 y SGT-6), porque cumple la medida de cero modificaciones no detectadas con el menor esfuerzo.

DRV-02: se selecciona el despliegue on-premise, porque es el único que cumple TS-01 sin condiciones adicionales.

DRV-03: se selecciona un adaptador por sistema externo detrás de la API de integración, porque aísla los cambios de cada sistema.

Candidate Pattern Evaluation Matrix:

| Driver ID | Título de Driver | Patrón | Pro | Con |
| - | - | - | - | - |
| DRV-01 | Integridad de las fichas subidas | Hash almacenado con el registro | Cumple SGT-3 y SGT-6 con bajo esfuerzo. | Depende de que la base de datos no sea alterada. |
| DRV-01 | Integridad de las fichas subidas | Registro con Blockchain | Hace inalterable el registro de la ficha. | Exige infraestructura adicional y mayor esfuerzo. |
| DRV-01 | Integridad de las fichas subidas | Almacenamiento de solo escritura | Impide sobrescribir el archivo subido. | No permite verificar que el archivo sea el original. |
| DRV-02 | Datos de beneficiarios dentro de la institución | Despliegue on-premise | Cumple TS-01. | Requiere infraestructura y mantenimiento propios. |
| DRV-02 | Datos de beneficiarios dentro de la institución | Despliegue híbrido | Aprovecha la nube para componentes sin datos de beneficiarios. | Requiere separar y controlar qué datos salen. |
| DRV-02 | Datos de beneficiarios dentro de la institución | Nube con anonimización | Reduce el costo de infraestructura. | Puede incumplir TS-01. |
| DRV-03 | Interoperabilidad con otros sistemas | Adaptador por sistema externo | Aísla los cambios de cada sistema. | Añade un componente por cada sistema integrado. |
| DRV-03 | Interoperabilidad con otros sistemas | Integración punto a punto | Es la más simple de implementar. | El acoplamiento crece con cada sistema nuevo. |
| DRV-03 | Interoperabilidad con otros sistemas | Bus de servicios empresariales | Centraliza la integración. | Introduce una infraestructura pesada para pocos sistemas. |
