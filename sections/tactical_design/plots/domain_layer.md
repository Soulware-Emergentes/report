El agregado Plot protege dos reglas que abarcan más de un terreno: un beneficiario tiene un solo terreno registrado, y dos terrenos registrados no se superponen en más de la tolerancia permitida (un metro cuadrado). Como ambas reglas dependen de otros agregados, el método de fábrica register recibe el terreno que ya tiene el titular, si lo hay, y los terrenos vecinos, y decide con ellos antes de crear el agregado.

El cálculo del área compartida entre dos polígonos, que pueden ser no convexos, se delega en la interfaz de dominio PlotGeometry, que la infraestructura implementa con una librería de geometría.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 16%;">Clase</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 12%;">Categoría</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 28%;">Propósito</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 22%;">Atributos</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 22%;">Métodos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Plot</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Representa un terreno levantado y registrado a nombre de un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: PlotId<br>- owner: BeneficiaryLegalDocument<br>- boundary: PlotBoundary<br>- ubigeo: Ubigeo<br>- registrationDate: RegistrationDate<br>~ OVERLAP_TOLERANCE: OverlapTolerance</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ register(id, owner, boundary, ubigeo, registrationDate, ownersPlot, neighbours, geometry): Plot<br>+ reconstitute(id, owner, boundary, ubigeo, registrationDate): Plot<br>- overlaps(other, geometry): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identifica un terreno.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotBoundary</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Perímetro levantado del terreno: sus vértices en orden y la zona UTM en que se midieron. Descarta el vértice repetido que cierra el anillo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ zone: UtmZone<br>+ vertices: List&lt;SurveyPoint&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SurveyPoint</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Vértice medido por la estación total, proyectado en la zona UTM del perímetro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">UtmZone</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Zona UTM WGS84 de las coordenadas, con su código EPSG.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ZONE_17S (32717)<br>ZONE_18S (32718)<br>ZONE_19S (32719)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ epsgCode(): int</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ubigeo</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Código INEI de seis dígitos del distrito donde se encuentra el terreno.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RegistrationDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Momento en que se registró el terreno.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SharedArea</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Área común entre dos terrenos, en metros cuadrados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ squareMeters: BigDecimal</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">OverlapTolerance</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Área compartida admitida antes de considerar que dos terrenos se superponen.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ squareMeters: BigDecimal</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ isExceededBy(shared): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persiste y recupera agregados Plot.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ save(plot): Plot<br>+ getById(id): Plot<br>+ getAllByIds(ids): List&lt;Plot&gt;<br>+ delete(plot): void<br>+ findIntersecting(boundary): List&lt;Plot&gt;<br>+ findOwnedBy(owner): Optional&lt;Plot&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotGeometry</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Domain Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Mide la relación entre los perímetros de dos terrenos sobre el terreno real.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ sharedArea(first, second): SharedArea</td>
        </tr>
    </tbody>
</table>
</div>

Las reglas de negocio del módulo se protegen con las siguientes excepciones. Todas heredan de BusinessRuleViolationException, salvo PlotNotFoundException y BeneficiaryHoldsNoPlotException, que heredan de EntityNotFoundException.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 35%;">Excepción</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 65%;">Regla de negocio que protege</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlotIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo terreno tiene identidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlotOwnerException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo terreno está registrado a nombre de un beneficiario.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlotBoundaryException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo terreno tiene un perímetro levantado.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlotUbigeoException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo terreno indica el ubigeo donde se encuentra.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingRegistrationDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo terreno registra cuándo se registró.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingUtmZoneException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo perímetro indica la zona UTM de sus coordenadas.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TooFewBoundaryVerticesException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un perímetro tiene al menos tres vértices distintos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">NonFiniteSurveyPointException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las coordenadas de un vértice son números finitos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingUbigeoException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un ubigeo tiene valor.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidUbigeoException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un ubigeo tiene exactamente seis dígitos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidRegionException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una región consultada es un departamento, una provincia o un distrito: dos, cuatro o seis dígitos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">NegativeSharedAreaException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El área compartida entre dos terrenos no es negativa.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">NegativeOverlapToleranceException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La tolerancia de superposición no es negativa.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryAlreadyHoldsPlotException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un beneficiario tiene un solo terreno registrado.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">OverlappingPlotException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un terreno nuevo no comparte con sus vecinos más área que la tolerancia.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotNotFoundException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las operaciones sobre un terreno se refieren a un terreno registrado.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryHoldsNoPlotException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La consulta del terreno de un beneficiario se refiere a un beneficiario con terreno registrado.</td>
        </tr>
    </tbody>
</table>
</div>
