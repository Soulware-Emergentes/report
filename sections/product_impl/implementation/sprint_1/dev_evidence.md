Durante el Sprint 1 el equipo avanzó en seis repositorios de la organización Soulware-Emergentes: la landing page, la aplicación web y los servicios web SGT, POI, Staff y Beneficiarios. El trabajo de cada producto se hizo en ramas feature y se integró en develop mediante pull requests, siguiendo el flujo descrito en Source Code Management.

En Staff quedó la base sobre la que se apoyan los demás servicios. El directorio guarda a las personas y sus grupos y verifica contraseñas, y el proveedor de identidad emite tokens tanto para personas como para servicios. Al final del sprint se sumaron la página de inicio de sesión propia con los tokens de diseño de SGT, en inglés y español, un hub con las aplicaciones a las que cada persona tiene acceso y el inicio de sesión silencioso entre aplicaciones.

SGT acepta solo tokens emitidos por Staff y consulta a Staff y Beneficiarios con tokens de servicio. Permite registrar un terreno por beneficiario dentro de un distrito y consultarlo por id, por región o por propietario. Las fichas de campo reciben un código FI-NNNN-YYYY al enviarse y se listan con paginación, filtros y orden. Al aprobar o rechazar una ficha, SGT completa o reabre la tarea correspondiente en POI.

POI modela el plan operativo con sus objetivos, actividades y tareas, y lo devuelve como un árbol. Las tareas reciben las entregas y revisiones que llegan desde SGT, y al completarse cierran en cascada la actividad, el objetivo y el plan. Beneficiarios carga el padrón de beneficiarios, permite buscarlos y paginarlos, y admite varios formatos de documento legal. Los cuatro servicios documentan su API con springdoc.

En el frontend, la landing page publicó su contenido con soporte de varios idiomas, con inglés por defecto, y la configuración para enlazar la URL de SGT en el despliegue. La aplicación web incorporó los tokens de diseño de SGT como tema de Tailwind y el inicio de sesión que redirige al SSO de Staff bajo el estándar OIDC.

La siguiente tabla reúne los commits de implementación de cada repositorio, con la rama en la que se hicieron.

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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/landing</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">605b5a6</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(landing): add landing page content</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/landing</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">0174c84</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ci(sgt-integration): add config for sgt url setup on deploy</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/landing</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">e1e1f99</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">docs: add README.md</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/landing</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">cbaa0ce</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(i18n): add i18n feature</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The app now defaults to 'en' as requested by NFR</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1076b33</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat: add SGT design tokens as Tailwind theme and self-hosted Roboto</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/web-application</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">95dc580</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">style(login): space the callback error alert with a flex gap</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The message and the retry button were separated only by the whitespace between them; the alert is now a wrapping flex row.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/web-application</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">develop</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">7976ed2</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Merge pull request #1 from Soulware-Emergentes/feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Feature/login</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/domain</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">b22cfe4</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: passthrough</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Co-Authored-By: Claude Opus 5.5 &lt;noreply@anthropic.com&gt;</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">01/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">d7ed34a</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">build(deps): add the OAuth2 resource server and client starters</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt accepts staff-issued tokens on its own API and gets tokens from staff for the APIs it calls.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1e03632</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): admit only staff-issued person tokens</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Every request carries a token staff issued to a person for sgt, checked against staff's signing keys, issuer and audience. Controllers receive the caller it names through Caller, and an operation refuses a caller not acting in the role it needs. sgt gets its own tokens for the APIs it calls with the client credentials grant, through ServiceTokens.<br><br>The README explains the token and the roles.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">f3fd8b4</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">refactor(people): resolve staff and beneficiaries with service tokens</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Field agents and general management assistants are both staff, so they are resolved through the directory's v3 lookup by GUID as staff members, and each gets a profile in the published language. Beneficiaries are resolved through the registry's v1 lookup. Both clients send a token staff issues to sgt for that API instead of an API key.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">1a133b1</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">refactor(monitoring): complete and reopen poi tasks with a service token</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">An approved field sheet completes its poi task and a rejected one reopens it, through poi's v1 completion and reopening endpoints. The commands, handlers and TaskLedger methods are named after that outcome. The client sends a token staff issues to sgt for poi instead of an API key.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">acec2ae</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">refactor(monitoring): drop the poi task pass-through</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">sgt served poi's pending tasks and task lookup under its own API by calling poi. Clients read tasks from poi itself, so the endpoints, their query results and the HTTP projection behind them are gone.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a3232be</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(monitoring): take actors from the token and answer writes with the field sheet</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The field agent submitting and the assistant reviewing are the caller the token names, refused when not acting in the role the operation records, so neither travels in the request body any more. A field sheet cannot be reviewed by the person who submitted it.<br><br>Submitting answers 201 with the field sheet it created, and approving, rejecting and relinking answer 200 with the field sheet as it stands.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a615281</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(plots): register each plot to one beneficiary, in a district</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">A plot names the beneficiary it is registered to by legal document, the district it lies in by ubigeo, and when it was registered. A beneficiary holds a single plot: registering a second one is refused, and the table's unique owner backs the rule up.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">2f573ba</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(plots): read plots by id, by region and by owner</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">A region is any level of the ubigeo, matched as a prefix: two digits for a department, four for a province, six for a district. A beneficiary's plot is read by their legal document, and one who holds none is not found. The boundary is read back through the same mapping the repository stores it with.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3dc8e9a</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(plots): expose plots over REST</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">POST /api/v1/plots registers a plot and answers 201 with it. GET reads one by id, the plots of a region, or the plot of an owner. A field agent or an admin may call every endpoint.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">b60f097</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(monitoring): number field sheets FI-NNNN-YYYY</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">A field sheet gets a code when it is submitted: its four-digit number among the field sheets of its submission year, and that year. Numbering restarts at 0001 each year, and a year past 9999 takes no more field sheets. Submission is serializable so two field sheets never take the same number, and the table's unique code backs that up. Every field sheet read answers with its code.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">7281aca</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(monitoring): page, filter and sort the field sheet list</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">GET /api/v1/field-sheets answers one page for a table, in the same envelope staff's people page uses. Every filter is optional: status, text in the code or the task code, and a submission range by day. It sorts by code, task code, submission date or status, newest submission first by default, and pages hold from 1 to 100 field sheets. The page and sort refusals live in the shared kernel, for the other tables to reuse.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">ccc504f</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">style(shared): name the identity in the bulk load's key mapping</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The lambda maps aggregate identities to storage keys, so its parameter is named after what it receives.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">66de5e8</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: ignore only the root docs folder</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The docs/ pattern matched every directory named docs, so the API docs packages under shared were never tracked.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">4bd4b83</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): document the API with springdoc</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">The OpenAPI document and the Swagger UI are served without a token, and only where API_DOCS_ENABLED is on. The UI takes a staff-issued bearer token to send with every call. Endpoints are grouped by the aggregate their controller serves, read from the value its root declares in @PackagedAs, and each one carries a summary of what it does.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">c12ab0b</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">build(deps): add the OAuth2 resource server starter</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5a926fd</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): admit only tokens staff issued for poi, to people by role and to services by scope</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">d87d379</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: ignore only the root docs folder</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a619e11</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): document the API with springdoc</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">34f2d50</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(planning): model the operational plan, its objectives, activities and tasks</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">bbc8223</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(planning): define plans, objectives and activities, and read them back as a tree</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">5f653eb</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(planning): define tasks and take their deliveries and reviews from sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">96edcde</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(planning): page, filter and sort the task list</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a58b2d6</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(planning): complete activities, objectives and plans as their tasks complete</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/poi</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">bc3eb32</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">style(shared): name the identity in the bulk load's key mapping</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">7952d02</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">build(deps): add the OAuth2 authorization server starter</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">a0b1c2c</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(directory): hold people and groups, check passwords and page through people</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">facb515</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(identityprovider): issue person and service tokens over the directory</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">e2dcade</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(identityprovider): register the beneficiarios API and grant it to sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">e5976f0</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">style(shared): name the identity in the bulk load's key mapping</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">fda959e</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: ignore only the root docs folder</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">34526e5</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): document the API with springdoc</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">develop</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">bd73ce6</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Merge pull request #1 from Soulware-Emergentes/feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">11/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">e7a60ff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(identityprovider): serve the login, a hub and silent sign-in</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Staff now renders its own pages instead of Spring's defaults, knows which application and environment a login is for, and lets a browser that already logged in reach any of its applications without typing credentials again. (...)</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">c26e484</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">perf(ui): add ease in and ease out effects via css</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">develop</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">799b09f</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Merge pull request #2 from Soulware-Emergentes/feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Feature/login</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">12/11/2026</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/legal-document</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">33c7387</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(legal-document): add mutli-format legal document type support</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">01/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">04e772c</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">build(deps): add the OAuth2 resource server starter</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">f36a83d</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): admit only service tokens staff issued for beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">18d1948</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(registry): seed the beneficiary registry, look beneficiaries up and page through them</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">28aa1dd</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">style(shared): name the identity in the bulk load's key mapping</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">3d64c00</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: ignore only the root docs folder</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">Soulware-Emergentes/beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feature/core</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">69c72e9</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">feat(shared): document the API with springdoc</td>
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
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">main</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">152ea0e</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">chore: initial commit</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">-</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top; text-align: left;">08/10/2026</td>
            </tr>
        </tbody>
    </table>
</div>
