La capa de infraestructura guarda los terrenos en PostgreSQL con la extensión PostGIS y delega en la librería JTS el cálculo geométrico que el dominio pide a PlotGeometry.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JpaPlotRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa PlotRepository con JPA y consultas espaciales nativas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jpaRepository: PlotJpaRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ save(plot): Plot<br>+ getById(id): Plot<br>+ findIntersecting(boundary): List&lt;Plot&gt;<br>+ findOwnedBy(owner): Optional&lt;Plot&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotEntity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Fila de la tabla plots, con el perímetro como polígono PostGIS.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">id: UUID<br>ownerDocumentType, ownerDocumentNumber<br>boundary: Polygon<br>ubigeo: String<br>registrationDate: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotJpaRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Acceso JPA a plots, con la consulta nativa de terrenos que intersecan un perímetro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findIntersecting(...): List&lt;PlotEntity&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotGeometries</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Mapper</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Convierte un PlotBoundary en polígono con el SRID de su zona UTM, y un polígono almacenado de vuelta en zona y vértices.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">~ toPolygon(boundary): Polygon<br>~ toBoundary(polygon): PlotBoundary</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JtsPlotGeometry</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Domain Service Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa PlotGeometry calculando con JTS el área de la intersección de dos perímetros.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ sharedArea(first, second): SharedArea</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JdbcPlotProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa PlotProjection con consultas SQL sobre plots.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findById(PlotById): Optional&lt;PlotResult&gt;<br>+ findInRegion(PlotsInRegion): List&lt;PlotResult&gt;<br>+ findOfOwner(PlotOfOwner): Optional&lt;PlotResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

La tabla plots guarda el perímetro en las coordenadas UTM en que se midió y, además, una columna footprint generada en coordenadas geográficas WGS84 con un índice espacial GIST. Así, la búsqueda de vecinos compara terrenos medidos en zonas UTM distintas, y la consulta por región usa un índice sobre el prefijo del ubigeo.
