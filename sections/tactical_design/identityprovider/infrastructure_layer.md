La capa de infraestructura configura el servidor de autorización y lo conecta con el directorio y con los registros del proveedor de identidad.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">AuthorizationServerConfiguration</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define el emisor y la clave de firma, leída desde archivos para que los tokens sigan siendo válidos tras un reinicio.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authorizationServerSettings(issuer): AuthorizationServerSettings<br>+ authorizationService(): OAuth2AuthorizationService<br>+ jwkSource(...): JWKSource</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SecurityConfiguration</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define tres cadenas de seguridad en orden: los endpoints OpenID Connect, la API del directorio y el formulario de inicio de sesión.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">~ authorizationServerSecurity(http, eligibility): SecurityFilterChain<br>~ directoryApiSecurity(...): SecurityFilterChain<br>~ loginSecurity(http): SecurityFilterChain<br>~ passwordEncoder(): PasswordEncoder</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ProjectedRegisteredClientRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entrega al servidor de autorización las aplicaciones registradas, leídas con ClientProjection; rechaza guardar registros.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- clientProjection: ClientProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findById(id): RegisteredClient<br>+ findByClientId(clientId): RegisteredClient</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DirectoryAuthenticationProvider</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Verifica las credenciales del formulario con DirectoryApi y nombra a la persona por su objectGUID.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- directoryApi: DirectoryApi</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authenticate(login): Authentication</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EligibilityValidator</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Validator</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Deja entrar a una persona a una aplicación solo si sus grupos tienen un rol en la API solicitada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- directoryApi: DirectoryApi<br>- grantProjection: GrantProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ accept(context): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">StaffTokenCustomizer</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Token Customizer</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Agrega a cada token las claims de su tipo: roles para personas, scopes para servicios y perfil para el token de identidad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- directoryApi: DirectoryApi<br>- grantProjection: GrantProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ customize(context): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RequestedAccess</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lo que pidió un cliente, leído de sus scopes: la API y el rol con el que actuar.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ resources: List&lt;String&gt;<br>+ actAs: Optional&lt;String&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">~ resource(): Optional&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JdbcClientProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa ClientProjection con SQL sobre client_registrations y sus tablas relacionadas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findByClientId(ClientByClientId): Optional&lt;ClientResult&gt;<br>+ findById(ClientById): Optional&lt;ClientResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JdbcGrantProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa GrantProjection con SQL sobre role_assignments y scope_grants.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findRoles(RolesOfGroups): List&lt;String&gt;<br>+ findScopes(ScopesOfClient): List&lt;String&gt;</td>
        </tr>
    </tbody>
</table>
</div>

Las autorizaciones en curso se guardan en memoria, por lo que un reinicio cierra todas las sesiones. Los registros de aplicaciones, API, roles y scopes son datos de la base de datos, y el servidor de autorización solo los lee.
