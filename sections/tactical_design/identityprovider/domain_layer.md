El dominio tiene dos agregados. ApiResource representa una API registrada, una por despliegue (por ejemplo, sgt-api-dev y sgt-api-prod), y define los roles que pueden tener las personas que la llaman y los scopes que se pueden otorgar a los servicios. Qué significa cada rol o scope lo decide la propia API.

ClientRegistration representa una aplicación registrada, también una por despliegue. Un cliente público, como un frontend, inicia sesión en nombre de las personas y prueba su identidad con PKCE; un cliente confidencial, como un backend, obtiene tokens para sí mismo con su secreto. Cualquiera de los dos solo obtiene tokens para las API a las que está vinculado.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ApiResource</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">API registrada en el proveedor de identidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- id: ApiResourceId<br>- identifier: ResourceIdentifier<br>- roles: Set&lt;AppRole&gt;<br>- scopes: Set&lt;ServiceScope&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ reconstitute(id, identifier, roles, scopes): ApiResource</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ClientRegistration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aplicación registrada que solicita tokens.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- id: ClientRegistrationId<br>- clientId: ClientId<br>- kind: ClientKind<br>- secretHash: ClientSecretHash<br>- loginRedirectUris: Set&lt;RedirectUri&gt;<br>- logoutRedirectUris: Set&lt;RedirectUri&gt;<br>- resources: Set&lt;ResourceIdentifier&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ reconstitute(id, clientId, kind, secretHash, loginRedirectUris, logoutRedirectUris, resources): ClientRegistration</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ApiResourceId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identifica una API registrada.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ClientRegistrationId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identifica el registro de una aplicación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ResourceIdentifier</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Nombre de la API en los tokens: la audiencia del token y el scope que lo solicita.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">AppRole</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Rol que una API define para las personas que la llaman.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ServiceScope</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Permiso que una API define para los servicios que la llaman por cuenta propia.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ClientId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Nombre público de una aplicación registrada.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ClientKind</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Indica si la aplicación puede guardar un secreto.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PUBLIC<br>CONFIDENTIAL</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ClientSecretHash</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Hash BCrypt del secreto de un cliente confidencial.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RedirectUri</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Dirección a la que el proveedor puede devolver a la aplicación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>

Las reglas del módulo se protegen con las siguientes excepciones, que heredan de BusinessRuleViolationException.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingApiResourceIdException, MissingClientRegistrationIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda API y toda aplicación registrada tienen identidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingResourceIdentifierException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda API tiene un identificador.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingClientIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda aplicación tiene un nombre público.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingClientKindException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda aplicación indica si es pública o confidencial.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ConfidentialClientWithoutSecretException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un cliente confidencial tiene secreto.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PublicClientWithSecretException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un cliente público no tiene secreto.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidResourceIdentifierException, InvalidAppRoleException, InvalidServiceScopeException, InvalidClientIdException, InvalidRedirectUriException, InvalidClientSecretHashException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identificadores, roles, scopes, nombres de cliente, direcciones y hashes no están vacíos ni contienen espacios.</td>
        </tr>
    </tbody>
</table>
</div>
