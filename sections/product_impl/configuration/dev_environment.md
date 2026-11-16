Los productos de software que el equipo usa a lo largo del ciclo de vida de la solución se agrupan por el tipo de actividad que soportan. Los productos SaaS se indican con su ruta de referencia, y los que se ejecutan en el computador de cada integrante, con su ruta de descarga.

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Actividad</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Producto</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Propósito</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Ruta</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Project Management</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">GitHub</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Aloja los repositorios de la organización, las pull requests y su revisión.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://github.com/Soulware-Emergentes</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Requirements Management</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Miro</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Soporta las sesiones colaborativas de As-Is Scenario Mapping.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://miro.com</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Product Design</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Figma</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Concentra las guías de estilo, los wireframes y los wireflows de la Landing Page y las aplicaciones.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://www.figma.com</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Product Design</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Structurizr</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Mantiene el workspace C4 de la solución, del que salen los diagramas de contexto, contenedores, componentes y despliegue.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://structurizr.com</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Product Design</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">LucidChart</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Elabora los diagramas de clases y de base de datos de cada bounded context.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://www.lucidchart.com</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Product Design</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Archi</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Modela la solución en ArchiMate.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://www.archimatetool.com/download</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Eclipse Temurin JDK 25</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Compila y ejecuta los servicios, escritos en Java 25.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://adoptium.net/temurin/releases</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Spring Boot 4.1 y Spring Modulith 2.1</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Sirven de base a cada servicio como monolito modular, con un módulo por bounded context.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://spring.io/projects/spring-boot</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Maven Wrapper</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Resuelve las dependencias y construye cada servicio con la versión de Maven fijada en su repositorio.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Incluido en cada repositorio como mvnw</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Visual Studio Code</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Edita y ejecuta los servicios con la configuración de lanzamiento y las extensiones que recomienda cada repositorio.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://code.visualstudio.com/download</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">PostgreSQL con PostGIS</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Almacena los datos de cada servicio y las geometrías de los terrenos.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://www.postgresql.org/download</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Development</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Git</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Controla las versiones del código y del informe.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://git-scm.com/downloads</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Testing</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">JUnit 5 y ArchUnit</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Ejecutan las pruebas unitarias y verifican las reglas de arquitectura de cada capa.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Dependencias Maven de cada servicio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Testing</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Docker y Testcontainers</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Levantan un PostgreSQL desechable para las pruebas de integración.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://docs.docker.com/get-docker</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Deployment</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">GitHub Actions</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Ejecuta las pruebas de cada servicio y reconstruye el informe en cada push.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://github.com/features/actions</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Documentation</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">mdm</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Genera el informe a partir de las secciones en Markdown versionadas.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://github.com/overGDev/mdm</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Documentation</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">springdoc-openapi</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Publica el documento OpenAPI y la interfaz Swagger UI de cada API.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Dependencia Maven de cada servicio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Software Documentation</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Microsoft Stream</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Aloja los videos de exposiciones y de entrevistas.</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">https://www.microsoft.com/microsoft-365/microsoft-stream</td>
            </tr>
        </tbody>
    </table>
</div>
