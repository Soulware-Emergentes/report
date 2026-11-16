Al cierre del Sprint 1 las cuatro APIs de la solución (Staff, Beneficiarios, POI y SGT) se desplegaron en Render como entorno de pruebas (dev). Cada API corre como un web service en el plan gratuito, construido a partir del Dockerfile de su repositorio, y las cuatro comparten una misma instancia de PostgreSQL en la región Oregon, donde cada una tiene su propia base de datos.

La instancia de PostgreSQL se creó desde el panel de Render con el nombre sgt-postgres, dentro del proyecto SGT y en la región Oregon. Los campos Database y User se dejaron vacíos, por lo que Render generó la base de datos inicial y el usuario administrador de la instancia.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/01-render-postgres-creacion.png" alt="Creación de la instancia PostgreSQL sgt-postgres en la región Oregon." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Para el entorno de pruebas se eligió el plan gratuito, con 0.1 CPU y 256 MB de RAM. Render advierte que las bases de datos gratuitas expiran a los 30 días y están pensadas para pruebas y prototipos.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/02-render-postgres-plan.png" alt="Selección del plan gratuito de cómputo para la instancia PostgreSQL." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Con la instancia creada, el equipo se conectó a ella con psql a través de su host externo, usando el usuario administrador generado por Render.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/03-psql-conexion.png" alt="Conexión a la instancia con psql mediante su host externo." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Desde esa sesión se ejecutó el script que prepara las bases de datos de los cuatro servicios, con la misma separación de roles que define el script scripts/db/setup-roles.sql de cada repositorio:
- Crea, por servicio, el rol migrator, que usa Flyway, y el rol app, que usa la aplicación en ejecución, y asigna sus contraseñas.
- Hace al rol migrator dueño de la base de datos de su servicio, para que pueda crear y modificar el esquema.
- Otorga al rol app permiso de conexión y de uso del esquema public, y define privilegios por defecto para que reciba permisos de lectura y escritura sobre cada tabla y secuencia que el rol migrator cree.
- Crea la extensión PostGIS en la base de datos de SGT, que guarda las geometrías de los terrenos.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/04-psql-roles-bases.png" alt="Script de roles, propietarios y privilegios de las bases de datos de los cuatro servicios." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Cada repositorio de API incluye un archivo render.yaml, el Blueprint de Render, que declara su web service: el runtime Docker, el plan, la región y las variables de entorno. Las variables con valor fijo, como la audiencia con la que la API está registrada en Staff, quedan en el archivo; las credenciales de base de datos y las URLs de los otros servicios se declaran sin valor, para que Render las solicite al crear el servicio y no queden en el repositorio. Cada Blueprint se crea desde el panel de Render conectando el repositorio de la organización Soulware-Emergentes.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/05-render-blueprint-repositorio.png" alt="Creación de un Blueprint en Render a partir de los repositorios de la organización." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Los servicios se desplegaron en el orden de sus dependencias. Staff fue el primero, porque emite los tokens que las demás APIs validan. Su Blueprint solicita solo las credenciales de base de datos de sus dos roles: su emisor de tokens se toma de la URL pública que Render asigna al servicio, y el par de claves RSA con el que firma los tokens se carga como Secret Files del servicio.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/06-staff-blueprint-variables.png" alt="Variables solicitadas por el Blueprint de Staff para el servicio staff-dev." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

El despliegue de staff-dev terminó con éxito en 2 minutos y 38 segundos. Al arrancar, Flyway aplicó las migraciones y la semilla del entorno dev, y el servicio quedó disponible en https://staff-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/07-staff-despliegue.png" alt="Despliegue exitoso de staff-dev y su URL pública." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Beneficiarios se desplegó después. Además de las credenciales de sus dos roles, su Blueprint solicita STAFF_ISSUER, la URL pública de Staff, contra la que valida los tokens que recibe.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/08-beneficiarios-blueprint-variables.png" alt="Variables solicitadas por el Blueprint de Beneficiarios." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

En el arranque, Beneficiarios cargó el padrón de muestra desde beneficiaries.sql y quedó disponible en https://beneficiarios-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/09-beneficiarios-despliegue.png" alt="Despliegue de beneficiarios-dev, con la carga del padrón de muestra y su URL pública." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

POI solicita las mismas variables que Beneficiarios: las credenciales de sus dos roles y la URL pública de Staff.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/10-poi-blueprint-variables.png" alt="Variables solicitadas por el Blueprint de POI." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

El servicio poi-dev quedó disponible en https://poi-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/11-poi-despliegue.png" alt="Despliegue de poi-dev y su URL pública." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

SGT se desplegó al final, porque consume a las otras tres APIs. Su Blueprint solicita, además de las credenciales de sus dos roles, las URLs públicas de Beneficiarios, del directorio de Staff y de POI, y la de Staff como emisor de tokens. Las variables del almacén de objetos de las fichas de campo (SCANS_*) tienen valores de relleno en este entorno, porque sus endpoints todavía no se usan.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/12-sgt-blueprint-variables.png" alt="Variables solicitadas por el Blueprint de SGT." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

El despliegue de sgt-dev terminó con éxito en 4 minutos y 28 segundos, y el servicio quedó disponible en https://sgt-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/13-sgt-despliegue.png" alt="Despliegue exitoso de sgt-dev y su URL pública." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

La aplicación web SGT se despliega junto con su BFF (backend for frontend), que sirve la aplicación Angular, inicia sesión en Staff a nombre del usuario y llama a las APIs de SGT y Beneficiarios desde el servidor. Su imagen Docker construye la aplicación web a partir de su repositorio y la incluye como archivos estáticos. El Blueprint del repositorio backend-for-frontend solicita la URL pública del propio BFF, la de Staff como emisor de tokens y las URLs de las APIs de SGT y Beneficiarios.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/14-bff-blueprint-variables.png" alt="Variables solicitadas por el Blueprint del BFF de SGT." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Staff solo redirige el navegador a las direcciones registradas para cada cliente, y la semilla del entorno dev registra las del BFF sobre localhost. Por eso, en la base de datos de Staff y con el rol staff_migrator, dueño de sus tablas, se actualizaron las URIs de redirección de inicio y cierre de sesión del cliente sgt-bff-dev y su URI de inicio a la URL pública del BFF en Render.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/15-staff-redirect-uris-bff.png" alt="Actualización de las URIs de redirección del cliente sgt-bff-dev en la base de datos de Staff." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Para que los usuarios accedan a la aplicación con un dominio propio, se agregó app.sgt.soulware.lat como dominio personalizado del servicio sgt-bff-dev.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/16-bff-dominio-personalizado.png" alt="Registro del dominio app.sgt.soulware.lat en el servicio sgt-bff-dev." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

En el proveedor DNS del dominio se crearon dos registros CNAME, app.sgt y www.app.sgt, que apuntan a sgt-bff-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/17-dns-registros-cname.png" alt="Registros CNAME de app.sgt y www.app.sgt hacia el servicio en Render." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Render verificó el dominio y emitió su certificado TLS, por lo que la aplicación responde por HTTPS en app.sgt.soulware.lat. El subdominio de Render sigue habilitado, así que el servicio también es accesible en https://sgt-bff-dev.onrender.com.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/18-bff-dominio-verificado.png" alt="Dominio app.sgt.soulware.lat verificado y con certificado emitido." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>

Con el dominio verificado, el BFF se volvió a desplegar manualmente desde el panel, con la caché de construcción limpia para que la imagen reconstruya la aplicación web. Al arrancar, el BFF reporta que atiende como https://app.sgt.soulware.lat, y Render publica el servicio con ese dominio como su URL principal.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/deployment/19-bff-despliegue.png" alt="Despliegue de sgt-bff-dev disponible en app.sgt.soulware.lat." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
</div>
