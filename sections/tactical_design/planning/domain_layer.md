El contexto tiene dos agregados. Plan contiene sus objetivos y las actividades de cada objetivo, y numera a ambos en el orden en que se definen, de modo que ningún código se elige a mano. Las tareas forman un agregado aparte, Task, porque cada actividad tiene miles de ellas y cada una cambia por su cuenta a medida que llegan las entregas; una tarea referencia a su actividad por identidad.

Task es una clase abstracta: cada tipo de tarea es una subclase que indica para qué se define, y todas reciben su entrega de la misma forma. BeneficiaryFollowUpTask es la visita de seguimiento a un beneficiario. El ciclo de vida de una tarea va de PENDING a DELIVERED al registrarse una entrega, y de DELIVERED a COMPLETED si la revisión la confirma o de vuelta a PENDING si la rechaza. Cada paso nombra la entrega a la que se refiere, de modo que un paso anunciado otra vez no cambia nada.

El plan sigue el avance de sus tareas sin contenerlas. Cada tarea anuncia con TaskDefined que se definió y con TaskCompleted que se completó, y el plan guarda en cada actividad las tareas que siguen abiertas. Una actividad está completa cuando tiene tareas y todas están completadas, un objetivo cuando tiene actividades y todas están completas, y el plan cuando tiene objetivos y todos están completos. Una tarea definida después reabre su actividad, y con ella el objetivo y el plan.

Los códigos son jerárquicos y forman la identidad de negocio: el plan se identifica por sus años (2025-2030), el objetivo agrega su número (2025-2030-01), la actividad el suyo (2025-2030-01-03) y la tarea un número de cuatro dígitos (2025-2030-01-03-0032).

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Plan</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Plan operativo institucional con sus objetivos y actividades.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: PlanId<br>- code: PlanCode<br>- name: Name<br>- description: Description<br>- objectives: List&lt;Objective&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ define(id, code, name, description, sameCode): Plan<br>+ reconstitute(id, code, name, description, objectives): Plan<br>+ defineObjective(id, name, description): void<br>+ defineActivity(objectiveId, id, name, description, measurementUnit, target): void<br>+ trackTask(activityId, taskId): void<br>+ recordTaskCompletion(activityId, taskId): void<br>+ isComplete(): boolean<br>- activity(activityId): Activity</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Objective</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lo que el plan se propone lograr; su avance es el de sus actividades.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: ObjectiveId<br>- code: ObjectiveCode<br>- name: Name<br>- description: Description<br>- activities: List&lt;Activity&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ define(id, code, name, description): Objective<br>+ reconstitute(...): Objective<br>+ defineActivity(id, name, description, measurementUnit, target): void<br>+ activity(activityId): Optional&lt;Activity&gt;<br>+ isComplete(): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Activity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Trabajo con el que se avanza en un objetivo, medido en una unidad y con una meta. Cada tarea completada aporta una unidad, y guarda las tareas que siguen abiertas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: ActivityId<br>- code: ActivityCode<br>- name: Name<br>- description: Description<br>- measurementUnit: MeasurementUnit<br>- target: Target<br>- openTasks: Set&lt;TaskId&gt;<br>- hasTasks: boolean</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ define(...): Activity<br>+ reconstitute(...): Activity<br>+ trackTask(taskId): void<br>+ recordTaskCompletion(taskId): void<br>+ isComplete(): boolean</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Task</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Root (abstracta)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Trabajo planificado bajo una actividad y la entrega que lo reporta. Al completarse emite TaskCompleted.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- id: TaskId<br>- activityId: ActivityId<br>- code: TaskCode<br>- description: Description<br>- status: TaskStatus<br>- submissionId: SubmissionId<br>- executionDate: ExecutionDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ registerDelivery(submissionId, executionDate): void<br>+ complete(submissionId): void<br>+ reopen(submissionId): void<br>+ relinkDeliveryFrom(source, submissionId): void<br>- holdsDeliveryOf(submissionId): boolean<br>- release(): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryFollowUpTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Visita de seguimiento a un beneficiario. Al definirse emite TaskDefined.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- beneficiaryId: BeneficiaryId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ define(id, activityId, activityCode, lastTask, description, beneficiaryId): BeneficiaryFollowUpTask<br>+ reconstitute(...): BeneficiaryFollowUpTask</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanId, ObjectiveId, ActivityId, TaskId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aggregate Id / Entity Id</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identidades técnicas de planes, objetivos, actividades y tareas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identidad de negocio del plan: los años que abarca.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ startYear: int<br>+ endYear: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ parse(text): PlanCode<br>+ value(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ObjectiveCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Código del plan seguido del número del objetivo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ plan: PlanCode<br>+ number: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ parse(text): ObjectiveCode<br>+ next(): ObjectiveCode<br>+ value(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ActivityCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Código del objetivo seguido del número de la actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ objective: ObjectiveCode<br>+ number: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ parse(text): ActivityCode<br>+ next(): ActivityCode<br>+ value(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Código de la actividad seguido del número de la tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ activity: ActivityCode<br>+ number: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ parse(text): TaskCode<br>+ next(): TaskCode<br>+ value(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskStatus</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Etapa de la tarea entre su planificación y su confirmación.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PENDING<br>DELIVERED<br>COMPLETED</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SubmissionId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identidad de la entrega según el sistema que la envía; en sgt, el identificador de la ficha.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ExecutionDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Día en que se realizó el trabajo que reporta la entrega.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: LocalDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identidad del beneficiario que una tarea de seguimiento debe visitar.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Name</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Nombre de un plan, objetivo o actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Description</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Descripción de un plan, objetivo, actividad o tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MeasurementUnit</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Unidad que una actividad cuenta hacia su meta.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Target</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cantidad de unidades que la actividad se propone entregar.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ units: long</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskDefined</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Domain Event</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Anuncia que se definió una tarea bajo una actividad, que queda abierta hasta que la tarea se complete.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskId: TaskId<br>+ activityId: ActivityId<br>+ occurredOn: Instant</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskCompleted</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Domain Event</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Anuncia que se completó una tarea porque la revisión confirmó su entrega.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskId: TaskId<br>+ activityId: ActivityId<br>+ occurredOn: Instant</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persiste y recupera agregados Plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ save(aggregate)<br>+ getById(id)<br>+ getAllByIds(ids)<br>+ delete(aggregate)<br>+ findByCode(code): Optional&lt;Plan&gt;<br>+ findByActivity(activityId): Optional&lt;Plan&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persiste y recupera agregados Task.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ save(aggregate)<br>+ getById(id)<br>+ getAllByIds(ids)<br>+ delete(aggregate)<br>+ findByCode(code): Optional&lt;Task&gt;<br>+ findLastUnder(activityId): Optional&lt;Task&gt;</td>
        </tr>
    </tbody>
</table>
</div>

Las reglas de negocio del contexto se protegen con las siguientes excepciones. Las de entidad no encontrada (PlanNotFoundException, ObjectiveNotFoundException, ActivityNotFoundException, TaskNotFoundException y UnknownTaskCodeException) heredan de EntityNotFoundException; el resto hereda de BusinessRuleViolationException.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlanIdException, MissingObjectiveIdException, MissingActivityIdException, MissingTaskIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo plan, objetivo, actividad y tarea tiene identidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingPlanCodeException, MissingObjectiveCodeException, MissingActivityCodeException, MissingTaskCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo plan, objetivo, actividad y tarea tiene código.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidPlanCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El código de plan son dos años de cuatro dígitos y el final no precede al inicial.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidObjectiveCodeException, InvalidActivityCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Objetivos y actividades se numeran de 01 a 99 dentro de su padre.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidTaskCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las tareas se numeran de 0001 a 9999 dentro de su actividad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanCodeTakenException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Dos planes no comparten código.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingNameException, BlankNameException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo plan, objetivo y actividad tiene nombre.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingDescriptionException, BlankDescriptionException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo plan, objetivo, actividad y tarea tiene descripción.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingMeasurementUnitException, BlankMeasurementUnitException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda actividad indica su unidad de medida.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingTargetException, NonPositiveTargetException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda actividad tiene una meta de al menos una unidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskWithoutActivityException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda tarea pertenece a una actividad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingTaskStatusException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda tarea tiene un estado.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingBeneficiaryIdException, BlankBeneficiaryIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda tarea de seguimiento indica al beneficiario que se visita.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingSubmissionIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda entrega identifica a quien la hizo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingExecutionDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda entrega indica el día en que se realizó el trabajo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskNotPendingException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Solo una tarea pendiente recibe una entrega, y una tarea completada no recibe una reasignación.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskNotDeliveredException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Solo se completa, reabre o reasigna la entrega que la tarea tiene en revisión.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">UnknownTaskStatusException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las tareas solo se filtran por un estado en el que una tarea puede estar.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanNotFoundException, ObjectiveNotFoundException, ActivityNotFoundException, TaskNotFoundException, UnknownTaskCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las operaciones se refieren a planes, objetivos, actividades y tareas registrados.</td>
        </tr>
    </tbody>
</table>
</div>
