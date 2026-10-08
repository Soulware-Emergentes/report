La capa de infraestructura lee el registro de la base de datos PostgreSQL de beneficiarios. La aplicación se conecta con un rol que solo puede leer y escribir datos, y Flyway aplica las migraciones con un rol propietario del esquema.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JpaBeneficiaryRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa BeneficiaryRepository con JPA.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- delegate: BeneficiaryJpaRepository<br>- publisher: ApplicationEventPublisher</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ getById(id): Beneficiary</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryEntity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Fila de la tabla beneficiaries.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">id: UUID<br>legalDocumentType, legalDocumentNumber<br>names, paternalSurname, maternalSurname<br>dateOfBirth: LocalDate<br>ubigeo: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryJpaRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Acceso JPA a beneficiaries.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Métodos derivados de JpaRepository</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JdbcBeneficiaryProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa BeneficiaryProjection con SQL sobre beneficiaries.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findPage(BeneficiariesPage): BeneficiariesPageResult<br>+ findByDocuments(BeneficiariesByDocument): List&lt;BeneficiaryResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiarySeeder</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Startup Runner</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Carga los beneficiarios de seed/beneficiaries.sql al iniciar, solo si el registro está vacío.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jdbc: JdbcTemplate<br>- dataSource: DataSource<br>- seed: Resource</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ run(args): void</td>
        </tr>
    </tbody>
</table>
</div>

BeneficiarySeeder llena un registro vacío con 150 beneficiarios de prueba, que reemplazan al registro institucional mientras la solución no se conecte con él. Un registro que ya tiene beneficiarios se deja como está, así que la carga ocurre una sola vez por base de datos.
