El siguiente diagrama de base de datos muestra las tablas de Identity Provider en la base de datos PostgreSQL de staff. Se elaboró en LucidChart a partir de las migraciones Flyway del servicio.

<img src="assets/tactical_design/identityprovider/code_level/db_diagram/schema.png" alt="Diagrama de base de datos de identityprovider" style="display: block; width: 100%; height: auto; margin: 0 auto;">

La tabla api_resources guarda las API registradas, y api_roles y api_scopes los roles y scopes que define cada una. La tabla client_registrations guarda las aplicaciones registradas; la restricción CHECK exige secreto solo a los clientes confidenciales. client_redirect_uris y client_resources guardan las direcciones de retorno y las API vinculadas a cada aplicación. role_assignments asigna roles a grupos del directorio, referenciados por identidad, y scope_grants otorga scopes a las aplicaciones.
