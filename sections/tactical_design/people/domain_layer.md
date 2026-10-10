People no tiene agregados propios, porque sgt no es dueño de los datos de ninguna persona. Su modelo de dominio es el lenguaje publicado que comparten los demás módulos: las identidades con las que Monitoring y Plots se refieren a las personas, y los perfiles con los que el módulo responde cuando una lectura necesita mostrar datos personales.

Las identidades del personal son el objectGUID de su cuenta en el directorio, que se mantiene aunque cambie el nombre de usuario. FieldAgentId y GeneralManagementAssistantId son tipos distintos aunque apunten a la misma cuenta, de modo que el compilador impide usar a un revisor donde se espera a un agente de campo.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryLegalDocument</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Documento legal que identifica a un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: LegalDocumentType<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">LegalDocumentType</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Tipo de documento legal y el formato que exige a su número.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DNI (8 dígitos)<br>FOREIGNER_ID_CARD (9 a 12 caracteres)<br>PASSPORT (6 a 12 caracteres)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ matches(number): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldAgentId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identidad del agente de campo que visita el terreno y realiza la evaluación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">GeneralManagementAssistantId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identidad del asistente de gerencia general que revisa las evaluaciones.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryProfile</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Datos personales de un beneficiario según el registro de beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ document: BeneficiaryLegalDocument<br>+ names: String<br>+ paternalSurname: String<br>+ maternalSurname: String<br>+ dateOfBirth: LocalDate<br>+ ubigeo: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldAgentProfile</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Datos de un agente de campo según el directorio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: FieldAgentId<br>+ username: String<br>+ displayName: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">GeneralManagementAssistantProfile</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Datos de un asistente de gerencia general según el directorio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: GeneralManagementAssistantId<br>+ username: String<br>+ displayName: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>

Las reglas de este lenguaje se protegen con las siguientes excepciones, que heredan de BusinessRuleViolationException.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingLegalDocumentTypeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo documento legal indica su tipo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidLegalDocumentNumberException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El número del documento tiene el formato que exige su tipo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingStaffIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda identidad del personal tiene valor.</td>
        </tr>
    </tbody>
</table>
</div>
