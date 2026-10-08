El agregado Person describe a una persona del directorio. Su cargo y su área dicen quién es dentro de la organización y no le otorgan ningún permiso en ninguna aplicación; los permisos se asignan a grupos en Identity Provider. Una persona sin hash de contraseña es una entrada del directorio que no puede iniciar sesión.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Person</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona del directorio de la organización.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: PersonId<br>- username: Username<br>- displayName: DisplayName<br>- jobTitle: JobTitle<br>- department: Department<br>- passwordHash: PasswordHash</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ reconstitute(id, username, displayName, jobTitle, department, passwordHash): Person</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">objectGUID de la cuenta de la persona.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Username</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Nombre de cuenta con el que la persona inicia sesión.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DisplayName</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Nombre de la persona tal como se muestra a otros.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">JobTitle</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cargo de la persona según el directorio.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Department</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Área de la organización donde trabaja la persona.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PasswordHash</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Hash BCrypt de la contraseña.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonProfile</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object (lenguaje publicado)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Descripción de una persona que el directorio entrega a otros módulos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID<br>+ username: String<br>+ displayName: String<br>+ jobTitle: String<br>+ department: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persiste y recupera agregados Person.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ save(person): Person<br>+ getById(id): Person<br>+ getAllByIds(ids): List&lt;Person&gt;<br>+ delete(person): void</td>
        </tr>
    </tbody>
</table>
</div>

Las reglas del módulo se protegen con las siguientes excepciones. PersonNotFoundException hereda de EntityNotFoundException; el resto hereda de BusinessRuleViolationException.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 35%;">Excepción</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 65%;">Regla de negocio que protege</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPersonIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda persona tiene identidad, también en una búsqueda por identidades.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingUsernameException, BlankUsernameException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda persona tiene nombre de cuenta.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingDisplayNameException, BlankDisplayNameException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda persona tiene un nombre visible.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingJobTitleException, BlankJobTitleException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda persona tiene cargo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingDepartmentException, BlankDepartmentException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda persona tiene área.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BlankPasswordHashException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un hash de contraseña, cuando existe, tiene valor.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TooManyPeopleRequestedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una búsqueda por identidades resuelve como máximo 100 personas.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonNotFoundException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las operaciones sobre una persona se refieren a una persona del directorio.</td>
        </tr>
    </tbody>
</table>
</div>
