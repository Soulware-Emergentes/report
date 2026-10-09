El siguiente diagrama de componentes del modelo C4 muestra los componentes de Identity Provider dentro de la API de Staff y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-IdentityProvider del workspace de la solución.

<img src="assets/tactical_design/identityprovider/component_level/components.png" alt="Diagrama de componentes de Identity Provider" style="display: block; width: 100%; height: auto; margin: 0 auto;">

El servidor de autorización atiende el inicio de sesión de la aplicación web y de la aplicación móvil, y la emisión de tokens de servicio a la API de SGT. Para cada solicitud busca la aplicación en ProjectedRegisteredClientRepository, autentica a la persona con DirectoryAuthenticationProvider, valida su acceso con EligibilityValidator y arma el token con StaffTokenCustomizer. Los datos de las personas y sus grupos se obtienen de DirectoryApiService.
