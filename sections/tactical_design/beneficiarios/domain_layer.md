El agregado Beneficiary describe a una persona atendida por el programa, identificada por su documento legal y ubicada por el distrito donde reside. Como el registro solo se lee, un beneficiario únicamente se reconstituye desde el almacenamiento; el agregado no tiene operaciones de cambio. Ningún par de beneficiarios comparte documento legal.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 12px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 21%;">Clase</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 13%;">Categoría</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 16%;">Propósito</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Atributos</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Métodos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Beneficiary</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Persona atendida por el programa.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- id: BeneficiaryId<br>- legalDocument: LegalDocument<br>- name: PersonName<br>- dateOfBirth: DateOfBirth<br>- residence: Ubigeo</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ reconstitute(id, legalDocument, name, dateOfBirth, residence): Beneficiary</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identifica a un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">LegalDocument</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Documento legal que identifica al beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: LegalDocumentType<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">LegalDocumentType</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Tipo de documento legal y el formato que acepta para su número.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DNI (8 dígitos)<br>FOREIGNER_ID_CARD (9 a 12 caracteres)<br>PASSPORT (6 a 12 caracteres)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ accepts(number): boolean<br>+ named(name): LegalDocumentType</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonName</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Nombre del beneficiario tal como figura en su documento.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ names: String<br>+ paternalSurname: String<br>+ maternalSurname: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DateOfBirth</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fecha de nacimiento del beneficiario tal como figura en su documento.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ubigeo</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Código de seis dígitos del distrito donde reside el beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Persiste y recupera agregados Beneficiary.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(beneficiary): Beneficiary<br>+ getById(id): Beneficiary<br>+ getAllByIds(ids): List&lt;Beneficiary&gt;<br>+ delete(beneficiary): void</td>
        </tr>
    </tbody>
</table>
</div>

Los tipos de documento y sus formatos coinciden con los de LegalDocumentType en el lenguaje publicado de People, en sgt. Cada servicio mantiene su propia copia, de modo que un documento válido en sgt también lo es en el registro.

Las reglas del contexto se protegen con las siguientes excepciones. BeneficiaryNotFoundException hereda de EntityNotFoundException; el resto hereda de BusinessRuleViolationException.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 35%;">Excepción</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 65%;">Regla de negocio que protege</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingBeneficiaryIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo beneficiario tiene identidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingLegalDocumentException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo beneficiario tiene un documento legal.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingLegalDocumentTypeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo documento legal indica su tipo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">UnknownLegalDocumentTypeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El tipo de documento es uno de los que conoce el registro.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidLegalDocumentNumberException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El número del documento tiene el formato que exige su tipo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPersonNameException, BlankPersonNameException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo beneficiario tiene nombres y ambos apellidos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingDateOfBirthException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo beneficiario tiene fecha de nacimiento.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingResidenceException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo beneficiario indica el distrito donde reside.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingUbigeoException, InvalidUbigeoException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un ubigeo tiene exactamente seis dígitos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TooManyBeneficiariesRequestedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una búsqueda por documentos resuelve como máximo 100 beneficiarios.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryNotFoundException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las operaciones sobre un beneficiario se refieren a uno registrado.</td>
        </tr>
    </tbody>
</table>
</div>
