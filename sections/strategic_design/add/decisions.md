Primera iteración de ADD, sobre los drivers de importancia e impacto altos: DRV-01, DRV-02 y DRV-03. Cada patrón se evaluó por cumplimiento del driver, cumplimiento de los Constraints y esfuerzo de implementación.

DRV-01: se selecciona el hash del PDF almacenado con el registro de la ficha (SGT-3 y SGT-6), porque cumple la medida de cero modificaciones no detectadas con el menor esfuerzo.

DRV-02: se selecciona el despliegue on-premise, porque es el único que cumple TS-01 sin condiciones adicionales.

DRV-03: se selecciona un adaptador por sistema externo detrás de la API de integración, porque aísla los cambios de cada sistema.

Candidate Pattern Evaluation Matrix:

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Driver ID</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Título de Driver</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Patrón</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Pro</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Con</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-01</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Integridad de las fichas subidas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Hash almacenado con el registro</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Cumple SGT-3 y SGT-6 con bajo esfuerzo.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Depende de que la base de datos no sea alterada.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-01</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Integridad de las fichas subidas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Registro con Blockchain</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Hace inalterable el registro de la ficha.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Exige infraestructura adicional y mayor esfuerzo.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-01</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Integridad de las fichas subidas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Almacenamiento de solo escritura</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Impide sobrescribir el archivo subido.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">No permite verificar que el archivo sea el original.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-02</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Datos de beneficiarios dentro de la institución</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Despliegue on-premise</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Cumple TS-01.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Requiere infraestructura y mantenimiento propios.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-02</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Datos de beneficiarios dentro de la institución</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Despliegue híbrido</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Aprovecha la nube para componentes sin datos de beneficiarios.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Requiere separar y controlar qué datos salen.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-02</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Datos de beneficiarios dentro de la institución</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Nube con anonimización</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Reduce el costo de infraestructura.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Puede incumplir TS-01.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-03</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Interoperabilidad con otros sistemas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Adaptador por sistema externo</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Aísla los cambios de cada sistema.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Añade un componente por cada sistema integrado.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-03</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Interoperabilidad con otros sistemas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Integración punto a punto</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Es la más simple de implementar.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El acoplamiento crece con cada sistema nuevo.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-03</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Interoperabilidad con otros sistemas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Bus de servicios empresariales</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Centraliza la integración.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Introduce una infraestructura pesada para pocos sistemas.</td>
            </tr>
        </tbody>
    </table>
</div>
