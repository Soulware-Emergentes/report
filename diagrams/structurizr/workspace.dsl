workspace "SGT" "Arquitectura de la solución SGT del programa de apoyo agrícola." {

    !identifiers hierarchical

    model {
        agente = person "Agente de campo" "Visita a los beneficiarios, levanta sus terrenos y envía las fichas de evaluación."
        asistente = person "Asistente de gerencia general" "Revisa y aprueba las fichas, y da seguimiento al avance del POI."

        group "Programa de apoyo agrícola" {
            sgt = softwareSystem "SGT" "Registra los terrenos de los beneficiarios y el seguimiento de sus fichas de evaluación." {
                web = container "Aplicación web" "Revisión de fichas, consulta de terrenos y seguimiento de tareas." "" "Web Browser"
                movil = container "Aplicación móvil" "Registro de terrenos y envío de fichas desde el campo." "" "Mobile App"

                api = container "API de SGT" "Lógica de negocio de terrenos, fichas y personas, como monolito modular." "Java 25, Spring Boot 4.1, Spring Modulith" {
                    serviceTokens = component "OAuth2ServiceTokens" "Obtiene de staff los tokens de servicio con el flujo client credentials." "Spring Security OAuth2 Client" "Shared"

                    fsController = component "FieldSheetController" "Recibe las solicitudes REST de fichas y exige el rol del llamador." "Spring MVC" "Monitoring"
                    fsEvents = component "Consumidores de eventos de fichas" "FieldSheetSubmittedHandler, FieldSheetApprovedHandler y FieldSheetRejectedHandler." "Spring Modulith" "Monitoring"
                    fsCommands = component "FieldSheetCommandService" "Ejecuta los comandos de fichas a través de sus handlers." "Spring" "Monitoring"
                    fsQueries = component "FieldSheetQueryService" "Responde las consultas de fichas y de sus PDF." "Spring" "Monitoring"
                    fsDomain = component "Modelo de dominio de fichas" "Agregado FieldSheet, sus objetos de valor y sus eventos." "Java" "Monitoring"
                    fsRepository = component "JpaFieldSheetRepositoryAdapter" "Persiste el agregado FieldSheet y publica sus eventos." "Spring Data JPA" "Monitoring"
                    fsProjection = component "JdbcFieldSheetProjection" "Lee las fichas con SQL." "Spring JDBC" "Monitoring"
                    scanAdapters = component "ObjectStoreScanStore y ObjectStoreScanLinkProjection" "Verifican los PDF subidos y emiten enlaces firmados." "AWS SDK S3" "Monitoring"
                    taskLedger = component "HttpTaskLedger" "Registra en poi las entregas y revisiones de las tareas." "Spring RestClient" "Monitoring"

                    plotController = component "PlotController" "Recibe las solicitudes REST de terrenos y exige el rol del llamador." "Spring MVC" "Plots"
                    plotCommands = component "PlotCommandService" "Registra terrenos a través de RegisterPlotHandler." "Spring" "Plots"
                    plotQueries = component "PlotQueryService" "Responde las consultas de terrenos." "Spring" "Plots"
                    plotDomain = component "Modelo de dominio de terrenos" "Agregado Plot y sus objetos de valor." "Java" "Plots"
                    plotRepository = component "JpaPlotRepositoryAdapter" "Persiste el agregado Plot y busca terrenos que se intersecan." "Spring Data JPA, Hibernate Spatial" "Plots"
                    plotProjection = component "JdbcPlotProjection" "Lee los terrenos con SQL." "Spring JDBC" "Plots"
                    plotGeometry = component "JtsPlotGeometry" "Calcula el área compartida entre dos perímetros." "JTS" "Plots"

                    peopleApi = component "PeopleApiService" "Resuelve identidades de personas en sus datos para los demás módulos." "Spring" "People"
                    peopleQueries = component "BeneficiaryQueryService y StaffQueryService" "Consultan beneficiarios y personal por lotes." "Spring" "People"
                    beneficiaryClient = component "HttpBeneficiaryProjection" "Consulta el registro de beneficiarios." "Spring RestClient" "People"
                    personClient = component "HttpPersonProjection" "Consulta el directorio de staff." "Spring RestClient" "People"
                }

                scans = container "Almacén de PDF" "Guarda los PDF escaneados de las fichas." "Almacenamiento de objetos compatible con S3" "Storage"
                db = container "Base de datos de SGT" "Terrenos, fichas y registro de publicación de eventos." "PostgreSQL, PostGIS" "Database"
            }

            poi = softwareSystem "POI" "Plan Operativo Institucional: planes, objetivos, actividades y tareas." {
                api = container "API de POI" "Planes y tareas, y el registro de sus entregas." "Java 25, Spring Boot 4.1, Spring Modulith" {
                    planController = component "PlanController" "Recibe las solicitudes REST de planes, objetivos y actividades." "Spring MVC" "Planning"
                    taskController = component "TaskController" "Recibe las solicitudes REST de tareas y de sus entregas." "Spring MVC" "Planning"
                    taskEvents = component "Consumidores de eventos de tareas" "TaskDefinedHandler y TaskCompletedHandler." "Spring Modulith" "Planning"
                    planCommands = component "PlanCommandService" "Define planes, objetivos y actividades, y lleva las tareas abiertas de cada actividad." "Spring" "Planning"
                    taskCommands = component "TaskCommandService" "Define tareas y registra, completa, reabre y reasigna sus entregas." "Spring" "Planning"
                    planQueries = component "PlanQueryService" "Responde las consultas de planes y su avance." "Spring" "Planning"
                    taskQueries = component "TaskQueryService" "Responde las consultas de tareas, por código o por páginas filtradas." "Spring" "Planning"
                    domain = component "Modelo de dominio de planificación" "Agregados Plan y Task y sus objetos de valor." "Java" "Planning"
                    repositories = component "JpaPlanRepositoryAdapter y JpaTaskRepositoryAdapter" "Persisten los agregados Plan y Task y publican sus eventos." "Spring Data JPA" "Planning"
                    projections = component "Proyecciones JDBC" "JdbcPlanProjection, JdbcTaskProjection y JdbcPendingTaskProjection." "Spring JDBC" "Planning"
                }
                db = container "Base de datos de POI" "Planes, objetivos, actividades y tareas." "PostgreSQL" "Database"
            }

            staff = softwareSystem "Staff" "Directorio del personal y proveedor de identidad de la organización." {
                api = container "API de Staff" "Directorio de personal y servidor de autorización OAuth 2.1 y OpenID Connect." "Java 25, Spring Boot 4.1, Spring Authorization Server" {
                    personController = component "PersonController" "Expone las consultas del directorio a otros servicios." "Spring MVC" "Directory"
                    directoryApi = component "DirectoryApiService" "Autentica credenciales, resuelve personas y lista los grupos de una persona." "Spring" "Directory"
                    directoryQueries = component "AccountQueryService, PersonQueryService y GroupQueryService" "Responden las consultas del directorio." "Spring" "Directory"
                    directoryProjections = component "Proyecciones JDBC del directorio" "JdbcCredentialProjection, JdbcPersonProjection y JdbcGroupMembershipProjection." "Spring JDBC" "Directory"

                    authServer = component "Servidor de autorización" "Endpoints OAuth 2.1 y OpenID Connect y formulario de inicio de sesión." "Spring Authorization Server" "IdentityProvider"
                    loginProvider = component "DirectoryAuthenticationProvider" "Verifica las credenciales del formulario contra el directorio." "Spring Security" "IdentityProvider"
                    eligibility = component "EligibilityValidator" "Admite a una persona solo si sus grupos tienen un rol en la API solicitada." "Spring Authorization Server" "IdentityProvider"
                    tokenCustomizer = component "StaffTokenCustomizer" "Agrega roles, scopes y perfil a los tokens." "Spring Authorization Server" "IdentityProvider"
                    clientRepository = component "ProjectedRegisteredClientRepository" "Entrega las aplicaciones registradas al servidor de autorización." "Spring Authorization Server" "IdentityProvider"
                    grantProjections = component "JdbcClientProjection y JdbcGrantProjection" "Leen aplicaciones registradas, roles y scopes." "Spring JDBC" "IdentityProvider"
                }
                db = container "Base de datos de Staff" "Personas, grupos, API y aplicaciones registradas." "PostgreSQL" "Database"
            }

            beneficiarios = softwareSystem "Beneficiarios" "Registro institucional de los beneficiarios del programa." {
                api = container "API de Beneficiarios" "Consulta de beneficiarios por documento legal, de solo lectura." "Java 25, Spring Boot 4.1, Spring Modulith" {
                    controller = component "BeneficiaryController" "Expone la página y la búsqueda por documentos a otros servicios." "Spring MVC" "Registry"
                    queries = component "BeneficiaryQueryService" "Valida los criterios y responde las consultas del registro." "Spring" "Registry"
                    projection = component "JdbcBeneficiaryProjection" "Lee los beneficiarios con SQL." "Spring JDBC" "Registry"
                    seeder = component "BeneficiarySeeder" "Carga los beneficiarios de prueba en un registro vacío al iniciar." "Spring Boot" "Registry"
                }
                db = container "Base de datos de Beneficiarios" "Datos personales de los beneficiarios." "PostgreSQL" "Database"
            }

            ia = softwareSystem "Modelo de IA" "Extrae los campos críticos de la ficha escaneada para su revisión." "Planificado"
        }

        # Personas
        agente -> sgt.movil "Registra terrenos y envía fichas con"
        asistente -> sgt.web "Revisa fichas y consulta tareas con"
        agente -> staff.api "Inicia sesión en" "OpenID Connect"
        asistente -> staff.api "Inicia sesión en" "OpenID Connect"

        # Contenedores de SGT
        sgt.movil -> sgt.api.fsController "Envía fichas" "JSON/HTTPS"
        sgt.movil -> sgt.api.plotController "Registra y consulta terrenos" "JSON/HTTPS"
        sgt.movil -> sgt.scans "Sube el PDF con un enlace firmado" "HTTPS"
        sgt.web -> sgt.api.fsController "Lista, revisa y reasigna fichas" "JSON/HTTPS"
        sgt.web -> sgt.scans "Descarga el PDF con un enlace firmado" "HTTPS"
        sgt.web -> poi.api.planController "Consulta y define planes" "JSON/HTTPS"
        sgt.web -> poi.api.taskController "Consulta y define tareas" "JSON/HTTPS"
        sgt.web -> staff.api.authServer "Obtiene el token de la persona" "OpenID Connect, PKCE"
        sgt.movil -> staff.api.authServer "Obtiene el token de la persona" "OpenID Connect, PKCE"

        # Monitoring
        sgt.api.fsController -> sgt.api.fsCommands "Envía comandos a"
        sgt.api.fsController -> sgt.api.fsQueries "Consulta"
        sgt.api.fsEvents -> sgt.api.fsCommands "Envía comandos a"
        sgt.api.fsCommands -> sgt.api.fsDomain "Ejecuta las reglas de"
        sgt.api.fsCommands -> sgt.api.fsRepository "Carga y guarda fichas con"
        sgt.api.fsCommands -> sgt.api.scanAdapters "Verifica el PDF subido con"
        sgt.api.fsCommands -> sgt.api.taskLedger "Informa entregas y revisiones con"
        sgt.api.fsQueries -> sgt.api.fsProjection "Lee fichas con"
        sgt.api.fsQueries -> sgt.api.scanAdapters "Obtiene enlaces firmados de"
        sgt.api.fsRepository -> sgt.api.fsEvents "Publica los eventos del agregado para" "Spring Modulith"
        sgt.api.fsRepository -> sgt.db "Lee y escribe" "JPA/JDBC"
        sgt.api.fsProjection -> sgt.db "Lee" "JDBC"
        sgt.api.scanAdapters -> sgt.scans "Consulta y firma enlaces" "S3 API"
        sgt.api.taskLedger -> sgt.api.serviceTokens "Obtiene su token de"
        sgt.api.taskLedger -> poi.api.taskController "Registra entregas, completa, reabre y reasigna tareas" "JSON/HTTPS"
        sgt.api -> ia "Envía el PDF para extraer sus campos" "HTTPS" "Planificado"

        # Plots
        sgt.api.plotController -> sgt.api.plotCommands "Envía comandos a"
        sgt.api.plotController -> sgt.api.plotQueries "Consulta"
        sgt.api.plotCommands -> sgt.api.plotDomain "Ejecuta las reglas de"
        sgt.api.plotCommands -> sgt.api.plotRepository "Carga vecinos y guarda terrenos con"
        sgt.api.plotCommands -> sgt.api.plotGeometry "Mide superposiciones con"
        sgt.api.plotQueries -> sgt.api.plotProjection "Lee terrenos con"
        sgt.api.plotRepository -> sgt.db "Lee y escribe" "JPA, PostGIS"
        sgt.api.plotProjection -> sgt.db "Lee" "JDBC, PostGIS"

        # People
        sgt.api.peopleApi -> sgt.api.peopleQueries "Consulta"
        sgt.api.peopleQueries -> sgt.api.beneficiaryClient "Busca beneficiarios con"
        sgt.api.peopleQueries -> sgt.api.personClient "Busca personal con"
        sgt.api.beneficiaryClient -> sgt.api.serviceTokens "Obtiene su token de"
        sgt.api.personClient -> sgt.api.serviceTokens "Obtiene su token de"
        sgt.api.beneficiaryClient -> beneficiarios.api.controller "Busca beneficiarios por documento" "JSON/HTTPS"
        sgt.api.personClient -> staff.api.personController "Busca personas por identidad" "JSON/HTTPS"
        sgt.api.serviceTokens -> staff.api.authServer "Obtiene tokens de servicio" "OAuth 2.1 client credentials"

        # Planning
        poi.api.planController -> poi.api.planCommands "Envía comandos a"
        poi.api.planController -> poi.api.planQueries "Consulta"
        poi.api.taskController -> poi.api.taskCommands "Envía comandos a"
        poi.api.taskController -> poi.api.taskQueries "Consulta"
        poi.api.planCommands -> poi.api.domain "Ejecuta las reglas de"
        poi.api.taskCommands -> poi.api.domain "Ejecuta las reglas de"
        poi.api.planCommands -> poi.api.repositories "Carga y guarda planes con"
        poi.api.taskCommands -> poi.api.repositories "Carga y guarda tareas con"
        poi.api.planQueries -> poi.api.projections "Lee planes con"
        poi.api.taskQueries -> poi.api.projections "Lee tareas con"
        poi.api.repositories -> poi.db "Lee y escribe" "JPA/JDBC"
        poi.api.repositories -> poi.api.taskEvents "Publica los eventos de las tareas para" "Spring Modulith"
        poi.api.taskEvents -> poi.api.planCommands "Envía comandos a"
        poi.api.projections -> poi.db "Lee" "JDBC"
        poi.api -> staff.api.authServer "Valida tokens con la clave publicada por" "JWKS"

        # Directory
        staff.api.personController -> staff.api.directoryQueries "Consulta"
        staff.api.directoryApi -> staff.api.directoryQueries "Consulta"
        staff.api.directoryQueries -> staff.api.directoryProjections "Lee con"
        staff.api.directoryProjections -> staff.db "Lee" "JDBC"

        # Identity Provider
        staff.api.authServer -> staff.api.loginProvider "Autentica el formulario con"
        staff.api.authServer -> staff.api.eligibility "Valida el acceso con"
        staff.api.authServer -> staff.api.tokenCustomizer "Arma los tokens con"
        staff.api.authServer -> staff.api.clientRepository "Busca aplicaciones registradas en"
        staff.api.loginProvider -> staff.api.directoryApi "Verifica credenciales con"
        staff.api.eligibility -> staff.api.directoryApi "Lista los grupos de la persona con"
        staff.api.eligibility -> staff.api.grantProjections "Lee roles de"
        staff.api.tokenCustomizer -> staff.api.directoryApi "Lee perfil y grupos con"
        staff.api.tokenCustomizer -> staff.api.grantProjections "Lee roles y scopes de"
        staff.api.clientRepository -> staff.api.grantProjections "Lee aplicaciones de"
        staff.api.grantProjections -> staff.db "Lee" "JDBC"

        # Beneficiarios
        beneficiarios.api.controller -> beneficiarios.api.queries "Consulta"
        beneficiarios.api.queries -> beneficiarios.api.projection "Lee beneficiarios con"
        beneficiarios.api.projection -> beneficiarios.db "Lee" "JDBC"
        beneficiarios.api.seeder -> beneficiarios.db "Carga los beneficiarios de prueba en" "JDBC"
        beneficiarios.api -> staff.api.authServer "Valida tokens con la clave publicada por" "JWKS"
        sgt.api -> staff.api.authServer "Valida tokens con la clave publicada por" "JWKS"

        prod = deploymentEnvironment "Producción" {
            onprem = deploymentNode "Infraestructura on-premise" "Servidores de la institución; los datos de beneficiarios no salen de ella." "Centro de datos institucional" {
                app = deploymentNode "Servidor de aplicaciones" "Ejecuta las API de la solución." "Linux" {
                    proxy = infrastructureNode "Nginx" "Proxy inverso y balanceador de carga hacia las instancias de cada API." "Nginx"
                    sgtJvm = deploymentNode "JVM de SGT" "Instancias de la API de SGT, cada una con su Tomcat embebido." "Java 25" "" 3 {
                        sgtApi = containerInstance sgt.api
                    }
                    poiJvm = deploymentNode "JVM de POI" "Instancia de la API de POI." "Java 25" {
                        poiApi = containerInstance poi.api
                    }
                    staffJvm = deploymentNode "JVM de Staff" "Instancia de la API de Staff." "Java 25" {
                        staffApi = containerInstance staff.api
                    }
                    beneficiariosJvm = deploymentNode "JVM de Beneficiarios" "Instancia de la API de Beneficiarios." "Java 25" {
                        beneficiariosApi = containerInstance beneficiarios.api
                    }
                }
                data = deploymentNode "Servidor de base de datos" "Aloja las bases de datos de cada servicio." "Linux" {
                    pooler = infrastructureNode "PgBouncer" "Agrupa las conexiones de las instancias en modo transacción." "PgBouncer"
                    postgres = deploymentNode "PostgreSQL" "Una base de datos por servicio, con roles separados para migraciones y ejecución." "PostgreSQL" {
                        sgtDb = containerInstance sgt.db
                        poiDb = containerInstance poi.db
                        staffDb = containerInstance staff.db
                        beneficiariosDb = containerInstance beneficiarios.db
                    }
                }
                files = deploymentNode "Servidor de archivos" "Guarda los PDF de las fichas." "Linux" {
                    objectStore = deploymentNode "Almacenamiento de objetos" "Bucket de PDF accesible con enlaces firmados." "Compatible con S3" {
                        scans = containerInstance sgt.scans
                    }
                }
                web = deploymentNode "Servidor web" "Sirve la aplicación web." "Linux" {
                    staticFiles = deploymentNode "Servidor de archivos estáticos" "Entrega los archivos de la aplicación web al navegador." "Nginx" {
                        webApp = containerInstance sgt.web
                    }
                }
            }
            device = deploymentNode "Dispositivo del agente de campo" "Teléfono con el que el agente trabaja en campo." "Android" {
                mobileApp = containerInstance sgt.movil
            }

            prod.onprem.app.proxy -> prod.onprem.app.sgtJvm.sgtApi "Reenvía las solicitudes a" "HTTP"
            prod.onprem.app.proxy -> prod.onprem.app.poiJvm.poiApi "Reenvía las solicitudes a" "HTTP"
            prod.onprem.app.proxy -> prod.onprem.app.staffJvm.staffApi "Reenvía las solicitudes a" "HTTP"
            prod.onprem.app.proxy -> prod.onprem.app.beneficiariosJvm.beneficiariosApi "Reenvía las solicitudes a" "HTTP"
            prod.onprem.app.sgtJvm.sgtApi -> prod.onprem.data.pooler "Abre conexiones a través de" "JDBC"
            prod.onprem.app.poiJvm.poiApi -> prod.onprem.data.pooler "Abre conexiones a través de" "JDBC"
            prod.onprem.app.staffJvm.staffApi -> prod.onprem.data.pooler "Abre conexiones a través de" "JDBC"
            prod.onprem.data.pooler -> prod.onprem.data.postgres "Multiplexa conexiones hacia" "PostgreSQL"
            prod.device.mobileApp -> prod.onprem.app.proxy "Llama a las API a través de" "HTTPS"
            prod.onprem.web.staticFiles.webApp -> prod.onprem.app.proxy "Llama a las API a través de" "HTTPS"
        }
    }

    views {
        systemLandscape "Landscape" "Panorama de los sistemas de la institución y sus usuarios." {
            include *
        }

        systemContext sgt "Contexto" "SGT, sus usuarios y los sistemas con los que se comunica." {
            include *
        }

        container sgt "Contenedores" "Contenedores de SGT y los sistemas que usan." {
            include *
        }

        component sgt.api "Componentes-Monitoring" "Componentes del módulo Monitoring de la API de SGT." {
            include "element.tag==Monitoring"
            include sgt.api.serviceTokens sgt.web sgt.movil sgt.db sgt.scans poi.api
        }

        component sgt.api "Componentes-Plots" "Componentes del módulo Plots de la API de SGT." {
            include "element.tag==Plots"
            include sgt.movil sgt.db
        }

        component sgt.api "Componentes-People" "Componentes del módulo People de la API de SGT." {
            include "element.tag==People"
            include sgt.api.serviceTokens beneficiarios.api staff.api
        }

        component poi.api "Componentes-Planning" "Componentes del contexto Planning de la API de POI." {
            include "element.tag==Planning"
            include sgt.web sgt.api poi.db
        }

        component staff.api "Componentes-Directory" "Componentes del módulo Directory de la API de Staff." {
            include "element.tag==Directory"
            include sgt.api staff.api.loginProvider staff.api.eligibility staff.api.tokenCustomizer staff.db
        }

        component staff.api "Componentes-IdentityProvider" "Componentes del módulo Identity Provider de la API de Staff." {
            include "element.tag==IdentityProvider"
            include sgt.web sgt.movil sgt.api poi.api beneficiarios.api staff.api.directoryApi staff.db
        }

        component beneficiarios.api "Componentes-Beneficiarios" "Componentes del módulo Registry de la API de Beneficiarios." {
            include "element.tag==Registry"
            include sgt.api beneficiarios.db staff.api
        }

        deployment * "Producción" "Despliegue" "Despliegue on-premise de la solución." {
            include *
        }

        styles {
            element "Element" {
                background #ffffff
                color #1f2937
                stroke #1f2937
            }
            element "Person" {
                shape Person
                background #1d4ed8
                color #ffffff
            }
            element "Software System" {
                background #2563eb
                color #ffffff
            }
            element "Container" {
                background #60a5fa
                color #0f172a
            }
            element "Component" {
                background #dbeafe
                color #0f172a
            }
            element "Database" {
                shape Cylinder
            }
            element "Storage" {
                shape Folder
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDevicePortrait
            }
            element "Planificado" {
                border Dashed
                opacity 60
            }
            relationship "Planificado" {
                dashed true
                opacity 60
            }
        }
    }
}
