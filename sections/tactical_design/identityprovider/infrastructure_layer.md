La capa de infraestructura configura el servidor de autorización y lo conecta con el directorio y con los registros del proveedor de identidad. También sirve las páginas propias de staff, generadas con Thymeleaf en inglés y en español con los tokens del sistema de diseño de SGT: el inicio de sesión, el aviso que se muestra antes de volver a una aplicación y el hub con las aplicaciones de la persona.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">AuthorizationServerConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Define el emisor y la clave de firma, leída desde archivos para que los tokens sigan siendo válidos tras un reinicio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ authorizationServerSettings(issuer): AuthorizationServerSettings<br>+ authorizationService(): OAuth2AuthorizationService<br>+ jwkSource(...): JWKSource</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SecurityConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Define tres cadenas de seguridad en orden: los endpoints OpenID Connect, la API del directorio y las páginas de staff con el formulario de inicio de sesión. Deja que el endpoint de autorización responda por sí mismo las solicitudes con prompt=none, y permite CORS desde los orígenes de los frontends en los endpoints de tokens, userinfo y configuración.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">~ authorizationServerSecurity(http, eligibility): SecurityFilterChain<br>~ directoryApiSecurity(...): SecurityFilterChain<br>~ loginSecurity(http): SecurityFilterChain<br>~ passwordEncoder(): PasswordEncoder<br>~ corsConfigurationSource(webOrigins): CorsConfigurationSource</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ProjectedRegisteredClientRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Entrega al servidor de autorización las aplicaciones registradas, leídas con ClientProjection; rechaza guardar registros.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- clientProjection: ClientProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findById(id): RegisteredClient<br>+ findByClientId(clientId): RegisteredClient</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DirectoryAuthenticationProvider</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Verifica las credenciales del formulario con DirectoryApi y nombra a la persona por su objectGUID.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- directoryApi: DirectoryApi</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ authenticate(login): Authentication</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">EligibilityValidator</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Validator</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Deja entrar a una persona a una aplicación solo si sus grupos tienen un rol en la API solicitada. Un navegador anónimo cuenta como uno que no ha iniciado sesión.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- directoryApi: DirectoryApi<br>- grantProjection: GrantProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ accept(context): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">StaffTokenCustomizer</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Token Customizer</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Agrega a cada token las claims de su tipo: roles para personas, scopes para servicios y perfil para el token de identidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- directoryApi: DirectoryApi<br>- grantProjection: GrantProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ customize(context): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RequestedAccess</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Lo que pidió un cliente, leído de sus scopes: la API y el rol con el que actuar.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ resources: List&lt;String&gt;<br>+ actAs: Optional&lt;String&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">~ resource(): Optional&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcClientProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa ClientProjection con SQL sobre client_registrations, applications, environments y sus tablas relacionadas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findByClientId(ClientByClientId): Optional&lt;ClientResult&gt;<br>+ findById(ClientById): Optional&lt;ClientResult&gt;<br>+ findLaunchable(ClientsOfGroups): List&lt;LaunchableClientResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcGrantProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa GrantProjection con SQL sobre role_assignments y scope_grants.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findRoles(RolesOfGroups): List&lt;String&gt;<br>+ findScopes(ScopesOfClient): List&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">LoginPageConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Sirve el formulario de inicio de sesión en /login y el aviso de /continuing, y registra sus interceptores.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- signedIn: SignedInLoginInterceptor<br>- requestingApplication: RequestingApplicationInterceptor<br>- continuation: ContinuationInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ addViewControllers(registry): void<br>+ addInterceptors(registry): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ContinuedLogin</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Helper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Distingue un inicio de sesión al que envió una aplicación, marcado con continue, de uno abierto a mano. Solo el primero retoma la solicitud de autorización guardada; el segundo la descarta y termina en el hub. Conserva la marca tras un intento fallido.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">~ isContinued(request): boolean<br>~ successHandler(): AuthenticationSuccessHandler<br>~ failureHandler(): AuthenticationFailureHandler</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RequestingApplicationInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Interceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Nombra en el formulario la aplicación que pidió el inicio de sesión y, fuera de producción, su entorno. Los toma del registro de la aplicación y nunca de la solicitud, para que un enlace no pueda hacer que la página nombre otra aplicación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- requestCache: RequestCache<br>- clientProjection: ClientProjection<br>- messageSource: MessageSource</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ postHandle(request, response, handler, model): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SignedInLoginInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Interceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Saca del formulario a un navegador que ya inició sesión: lo envía a la aplicación que pidió el inicio de sesión o al hub.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- requestCache: RequestCache</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ preHandle(request, response, handler): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ContinuationInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Interceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Da al aviso de /continuing la dirección de la aplicación a la que vuelve el navegador, tomada de la solicitud de autorización guardada; sin ella, envía al hub.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- requestCache: RequestCache</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ preHandle(request, response, handler): boolean<br>+ postHandle(request, response, handler, model): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">HubPageConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Sirve el hub en / y el aviso de /opening con el que una tarjeta del hub abre su aplicación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- hub: HubInterceptor<br>- opening: OpeningInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ addViewControllers(registry): void<br>+ addInterceptors(registry): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">HubInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Interceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Llena el hub: los datos de la persona según el directorio y las aplicaciones que puede abrir, agrupadas por entorno con producción primero.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- directoryApi: DirectoryApi<br>- clientProjection: ClientProjection<br>- messageSource: MessageSource</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ postHandle(request, response, handler, model): void<br>~ launchableBy(personId, locale): List&lt;EnvironmentApplications&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">OpeningInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Interceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Abre la aplicación de una tarjeta del hub en su dirección de inicio. La busca entre las que la persona puede abrir, por el client id de la tarjeta, de modo que un enlace no puede llevar a otro sitio ni abrir una aplicación sin rol.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- hub: HubInterceptor</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ preHandle(request, response, handler): boolean<br>+ postHandle(request, response, handler, model): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">UiLocalesFilter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Filter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Atiende el parámetro ui_locales de OpenID Connect: guarda en la sesión el primer idioma soportado que pide la aplicación, para que el formulario se muestre en él.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- localeResolver: LocaleResolver<br>- authorizationEndpoint: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;"># doFilterInternal(request, response, chain): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">LocaleConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Define los idiomas de staff, inglés por defecto y español, y elige el de cada solicitud: el guardado en la sesión, si no el de Accept-Language, y si no inglés.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ SUPPORTED_LOCALES: List&lt;Locale&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">~ localeResolver(): LocaleResolver<br>+ supportedLocale(languageTag): Optional&lt;Locale&gt;</td>
        </tr>
    </tbody>
</table>
</div>

Las autorizaciones en curso se guardan en memoria, por lo que un reinicio cierra todas las sesiones. Los registros de aplicaciones, API, roles y scopes son datos de la base de datos, y el servidor de autorización solo los lee.
