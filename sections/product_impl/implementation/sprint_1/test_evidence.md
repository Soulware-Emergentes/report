En el Sprint 1 las pruebas automatizadas se concentraron en los servicios web SGT, POI, Staff y Beneficiarios. SGT reúne el registro de terrenos y fichas, y los otros tres forman la base de planificación, identidad y padrón sobre la que trabaja. Cada servicio separa sus pruebas en dos grupos. Las pruebas unitarias se ejecutan con JUnit 5 y no necesitan base de datos. Las pruebas de integración levantan la aplicación completa con Spring Boot Test, llaman a la API con MockMvc y usan una base PostgreSQL real que Testcontainers crea en un contenedor para cada ejecución.

Maven ejecuta las unitarias con Surefire (mvnw test) y las de integración con Failsafe (mvnw verify). El workflow de GitHub Actions de cada servicio corre las unitarias en cada push y la suite completa en los pull requests y en las ramas develop y main, así que ningún cambio se integra sin que la suite pase. En la aplicación web, Angular ejecuta sus pruebas con Vitest mediante ng test.

En total el sprint cerró con 144 pruebas unitarias y 158 pruebas de integración, repartidas así:
- SGT: 53 unitarias y 56 de integración.
- POI: 60 unitarias y 38 de integración.
- Staff: 13 unitarias y 45 de integración.
- Beneficiarios: 17 unitarias y 19 de integración.
- Aplicación web: 1 prueba unitaria del componente raíz.

La siguiente tabla relaciona las pruebas unitarias con las clases que prueban y los comportamientos que verifican.

<div style="width: 100%; margin: 0 auto; font-family: Arial, sans-serif; font-size: 12px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Repositorio</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Clase de prueba</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Clases probadas</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Comportamientos verificados</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Casos</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheet</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Una ficha se envía para una tarea con un código de tarea en el formato de POI y queda sin evaluación. Al enviarse recibe el número siguiente al último del año, la primera del año es la 0001 y un año que agotó sus números no acepta más. Aprobar y rechazar anuncian la ficha revisada, y aprobar guarda lo que el revisor confirmó, incluido el beneficiario. Una ficha se revisa una sola vez y solo después de que POI acepta su entrega, y si POI la rechaza el envío se anula. Nadie revisa su propio envío. Una ficha entregada puede reasignarse a otra tarea mientras sigue en revisión.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">19</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetCodeTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetCode</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El código se escribe con su número de cuatro dígitos y su año, y se lee de vuelta igual. El siguiente código conserva el año, un año se detiene en su último número, el código exige año y cualquier otro formato se rechaza.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlotTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Plot</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Un terreno se registra si no tiene vecinos superpuestos. Se rechaza un terreno sin propietario, uno que no cae en ningún distrito y un segundo terreno para el mismo beneficiario. Un vecino que comparte exactamente la tolerancia se acepta, y el rechazo nombra solo a los vecinos que comparten más que la tolerancia.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">UbigeoTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Ubigeo</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Seis dígitos identifican un distrito, cualquier otra cantidad se rechaza y el ubigeo exige un código.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">JtsPlotGeometryTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">JtsPlotGeometry</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Mide el área que comparten dos linderos, incluso si se levantaron en zonas UTM distintas, y no mide nada cuando solo comparten un borde.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">HttpPersonProjectionTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">HttpPersonProjection</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Busca a las personas por GUID en el directorio de Staff con un token para esa API, envía un lote grande en partes del tamaño que admite el directorio y trata una falla del directorio como falla de infraestructura.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanningAggregatesTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Plan, Objective, Activity, Task</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Un plan exige nombre y descripción, y su código pertenece a un solo plan. Objetivos, actividades y tareas se numeran en el orden en que se definen, y una tarea nueva queda pendiente. Una tarea recibe una entrega a la vez: confirmarla completa la tarea y rechazarla la devuelve a pendiente. Una entrega puede reasignarse a otra tarea pendiente o intercambiarse con la de una tarea entregada. Los eventos repetidos no cambian nada. Al completarse la última tarea abierta se completan en cascada la actividad, el objetivo y el plan, y una tarea definida después los vuelve a abrir.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">34</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanningCodesTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanCode, ObjectiveCode, ActivityCode, TaskCode</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Cada código se escribe como el código de su padre más su número con ceros a la izquierda y se lee de vuelta igual. El código de plan son dos años de cuatro dígitos y un plan no puede terminar antes de empezar. El código de tarea exige sus cuatro dígitos y cada código nombra a su padre.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">8</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanningValueObjectsTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Description, BeneficiaryId, Target</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Una descripción o un id de beneficiario en blanco se rechaza. Una meta pide al menos una unidad. Dos BeneficiaryId que nombran al mismo beneficiario son iguales.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">LegalDocumentTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">LegalDocument</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Cada tipo de documento acepta el formato de número que le corresponde y rechaza un número que no lo cumple. Un documento exige tipo, y el tipo debe nombrarse exactamente.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">4</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">JpaRepositoryToDomainRepositoryAdapterTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">JpaRepositoryToDomainRepositoryAdapter</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El adaptador publica todos los eventos que registró el agregado y lo hace después de la escritura. Si la escritura falla no publica nada. Vacía los eventos del agregado para que un segundo guardado no los anuncie otra vez.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5 por repositorio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">RequestIdFilterTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">RequestIdFilter</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Cada petición recibe un identificador propio de 32 caracteres hexadecimales, que se publica en el MDC de los logs y en la respuesta. Se reutiliza si la misma petición se despacha otra vez, se ignora el que envía el cliente y el MDC se limpia al terminar.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6 por repositorio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">MessageBundleTest</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Jerarquía de DomainException y archivos messages*.properties</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Cada excepción de dominio tiene su traducción y todos los idiomas definen las mismas claves.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">2 por repositorio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">web-application</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">app.spec.ts</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">App</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El componente raíz de la aplicación se crea correctamente.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1</td>
            </tr>
        </tbody>
    </table>
</div>

Las pruebas de integración recorren cada API como lo haría un cliente, con tokens emitidos por Staff y datos guardados en PostgreSQL. La siguiente tabla las relaciona con las historias de usuario del sprint que respaldan.

<div style="width: 100%; margin: 0 auto; font-family: Arial, sans-serif; font-size: 12px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Repositorio</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Clase de prueba</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Comportamientos verificados</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">User Story</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Casos</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlotControllerIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Un terreno registrado se devuelve y se lee por id, por región y por propietario. Un administrador puede registrar y leer, y un revisor no puede registrar, leer ni consultar el mapa. Se rechaza un segundo terreno para el mismo beneficiario, uno que se superpone con otro ya registrado, al que nombra, y uno fuera de todo distrito. Un terreno inexistente o un beneficiario sin terreno responden no encontrado. La vista del mapa responde en GeoJSON con los terrenos que tocan el área y rechaza un área mal formada.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-2</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlotRegistrationIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Encuentra los terrenos superpuestos o colindantes y ningún otro. Un terreno guardado se carga de vuelta en su zona, con su propietario, su distrito y su fecha de registro, y queda asignado al distrito en el que se ubica. Con aislamiento serializable, de dos registros concurrentes que se superponen solo uno pasa. La tabla admite un solo terreno por beneficiario.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-2</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">8</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlotQueriesIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Un departamento devuelve todos los terrenos de sus provincias ordenados por distrito, y una provincia o un distrito acotan la búsqueda. Se rechaza una región que no es un nivel del ubigeo. El terreno de un beneficiario se lee tal como se levantó, y uno sin terreno responde no encontrado.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-2</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetControllerIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Se firma un enlace de subida para una clave nueva, y una ficha enviada se lee de vuelta con su escaneo. Cada envío recibe el número siguiente al último del año, y se rechaza una ficha cuyo escaneo no se subió. Se rechaza una llamada sin token o con un token que Staff no emitió para SGT. Un agente de campo no puede revisar, un revisor no puede enviar y nadie puede enviar sin actuar con un rol válido.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-3</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetDeliveryFlowIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Un envío que POI rechaza queda anulado. Aprobar una ficha completa la tarea en POI y rechazarla la devuelve. Una reasignación sobre una tarea pendiente mueve la ficha, sobre una tarea ya entregada intercambia ambas fichas, y si POI la rechaza la ficha se queda donde estaba.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-3</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FieldSheetsPageIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">La lista de fichas muestra primero el envío más reciente, ordena los códigos por año y número, aplica los filtros, incluye ambos días del rango de envío, cuenta la selección completa en cada página y rechaza una página que no puede existir.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-4</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">IdentityProviderIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El documento de discovery publica el emisor y sus llaves. El formulario de inicio de sesión valida la contraseña contra el directorio y continúa la autorización de la aplicación que lo pidió. Una persona recibe un token para la API actuando con uno de sus roles, puede cambiar de rol sin volver a ingresar y se le rechaza un rol que no tiene. Un servicio recibe solo los permisos que se le concedieron. El hub lista las aplicaciones que la persona puede abrir y cerrar sesión desde el hub termina la sesión. El inicio de sesión silencioso devuelve un código si hay sesión y pide iniciar sesión si no la hay. El frontend de SGT obtiene en silencio un segundo token para el padrón de beneficiarios cuando la persona es agente de campo, y no lo obtiene si no tiene rol en el padrón.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-10, SGT-11</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">29</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PersonApiIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">La API del directorio pagina a las personas, filtra por cargo y nombre y ordena por cualquier columna en ambos sentidos. La búsqueda por lote resuelve a cada persona e informa las que no encontró. Se rechaza una llamada sin token de servicio o con un token emitido para otra API.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-10</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">8</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">BeneficiaryApiIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El padrón se carga una sola vez y se pagina por nombre, con filtros y orden por columna. La búsqueda por documento legal resuelve los beneficiarios que encuentra e informa los que faltan, y rechaza una consulta vacía o demasiado grande. Solo un token de servicio con el permiso de lectura puede listar el padrón. Un agente de campo puede buscar a los beneficiarios cuyos documentos tiene, una persona sin ese rol no puede, y el frontend puede hacer la búsqueda desde el navegador.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-7</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">TaskControllerIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Las tareas pendientes se listan por código. Una entrega saca a la tarea de la lista de pendientes, una segunda entrega para la misma tarea se rechaza y la misma entrega enviada otra vez se acepta. Rechazar la entrega devuelve la tarea a pendientes y confirmarla la completa. Una entrega puede reasignarse a otra tarea, salvo a una ya completada. Se valida que solo los servicios y roles autorizados llamen a cada endpoint.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-3, SGT-8</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">18</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">TasksPageIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">La lista de tareas muestra primero la ejecución más reciente y deja al final las pendientes, ordena los códigos en el orden del plan, aplica los filtros, cuenta la selección completa en cada página y rechaza una página que no puede existir.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-8</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanningTreeIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Cada definición de plan, objetivo, actividad y tarea responde con lo que creó, y cada nivel se numera según el nivel superior. Se rechaza un nivel bajo un padre que no existe, un código de plan ya tomado y que un servicio defina tareas.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-9</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">PlanCompletionIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El plan se completa cuando SGT confirma la entrega de su última tarea, y una tarea definida después lo vuelve a abrir.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">SGT-9</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">2</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">FlywayMigrationIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Todas las migraciones se aplican, crean el registro de publicación de eventos e Hibernate valida las entidades contra el esquema resultante.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Transversal</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3 por repositorio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">DatabaseRoleSeparationIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">La aplicación se conecta con el rol de menor privilegio, que lee y escribe las tablas pero no puede cambiar el esquema ni borrar tablas.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Transversal</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">4 por repositorio</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt, poi, staff, beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ApplicationLaunchIT</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">El contexto de la aplicación arranca contra una base PostgreSQL real.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Transversal</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1 por repositorio</td>
            </tr>
        </tbody>
    </table>
</div>

Las pruebas viven en la carpeta src/test de cada repositorio:
- [https://github.com/Soulware-Emergentes/poi](https://github.com/Soulware-Emergentes/poi)
- [https://github.com/Soulware-Emergentes/staff](https://github.com/Soulware-Emergentes/staff)
- [https://github.com/Soulware-Emergentes/beneficiarios](https://github.com/Soulware-Emergentes/beneficiarios)
- [https://github.com/Soulware-Emergentes/sgt](https://github.com/Soulware-Emergentes/sgt)
- [https://github.com/Soulware-Emergentes/web-application](https://github.com/Soulware-Emergentes/web-application)

La siguiente tabla reúne los commits de cada repositorio que agregaron o modificaron pruebas durante el sprint.

<div style="width: 100%; margin: 0 auto; font-family: Arial, sans-serif; font-size: 12px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Repository</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Branch</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Commit Id</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Commit Message</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Commit Message Body</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Committed on (Date)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/web-application</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a83071a</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/web-application</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">4b6f2b3</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(login): add login feature</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Includes:<br>- Welcome page to redirect into the staff microservice SSO under OIDC standard.<br>- i18n translation, compatible with the SSO login page language feature to preserve good UX.<br>- AUthGuard that restores the session if the user already logged in and they try to go into /login.<br>- Fake spiner interaction when moving out of the web page.<br>- Test of the fade in interaction to ease the visual of jumping across views and websites.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">72da98f</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">01/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">dce0a61</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ci: track the test support and the CI workflow</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ApplicationLaunchIT, the one test the repository tracks, extends PostgresIntegrationTest, which was ignored along with the other tests, so a clone could not compile its tests. The support package is tracked now, and the CI workflow with it, so the build passes on a clean checkout.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">6b5d9bf</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">test: track every test except the architecture rules</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a27fc46</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">refactor(monitoring): hold every field sheet date as a value object</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1b0d7dc</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">refactor(plots): hold the registration date as a value object</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/plots</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3a71427</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(plots): serve plots in view and file plots under their district</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Includes:<br>- GET /plots/within answers the plots whose footprint touches a bounding box, as GeoJSON, at most 1000 and saying when it held more.<br>- The INEI 2025 district boundaries in PostGIS, seeded by migration.<br>- A registered plot is filed under the district it shares the most ground with, so the request no longer carries a ubigeo; a plot in no district is refused.<br>- The frontend origin the browser calls come from is now port 4200.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">14/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/plots</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">389f59b</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): tell domain failures apart and name the plots an overlap hits</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Includes:<br>- Every domain error response carries its message key as code, so a client tells failures apart without reading the message.<br>- A failure that has details beyond its message implements DomainException.Detailed; its response carries them as details.<br>- An overlap refusal names the registered plots it overlaps, under details.overlappingPlots.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">14/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">fc0c063</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">03/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">cfb8dfe</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ci: track every test except the architecture rules, and the CI workflow</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">c56ea41</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">cc3be48</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ci: track every test except the architecture rules, and the CI workflow</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">e7a60ff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(identityprovider): serve the login, a hub and silent sign-in</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Staff now renders its own pages instead of Spring's defaults, knows which application and environment a login is for, and lets a browser that already logged in reach any of its applications without typing credentials again. (...)<br><br>Tests<br>- IdentityProviderIT covers the continued and abandoned logins, the hub and its cards, sign-out, silent sign-in with and without a session, and the environment naming on the login page.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/plots</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">088bca6</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(identityprovider): give sgt's frontend a beneficiary registry token</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Includes:<br>- Dev seed: a field-agent role on the beneficiary registry for sgt's field agents and developers, and sgt-web-dev allowed to ask for it.<br>- Tests that a field agent gets the second token silently and that a person with no role on the registry is denied it.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">14/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/legal-document</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1d7f165</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">first commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">30/09/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">152ea0e</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">7e1f116</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ci: track every test except the architecture rules, and the CI workflow</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/plots</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1cd0367</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): let field agents look beneficiaries up from sgt's frontend</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Includes:<br>- Person tokens for the registry are accepted, with their roles as authorities; service tokens keep their scopes.<br>- POST /beneficiaries/lookup is open to the field-agent role as well as to the read scope; the rest of the API stays service-only.<br>- CORS for the lookup, from BENEFICIARIOS_WEB_ORIGIN only.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">14/11/2026</td>
            </tr>
        </tbody>
    </table>
</div>
