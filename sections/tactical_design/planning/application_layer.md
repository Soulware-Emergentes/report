La capa de aplicación tiene un servicio de comandos y uno de consultas por agregado. Los handlers que asignan números (objetivos, actividades y tareas) se ejecutan con aislamiento SERIALIZABLE: el número sale de lo que el padre ya tiene, y si dos definiciones concurrentes leen el mismo último número, la base de datos rechaza una de ellas al confirmar. TrackTaskHandler y RecordTaskCompletionHandler cargan el plan con un bloqueo de escritura, de modo que dos tareas del mismo plan que se definen o completan a la vez se aplican una después de la otra.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanCommandService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de escritura de planes, objetivos y actividades, y de las tareas abiertas de cada actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- definePlanHandler<br>- defineObjectiveHandler<br>- defineActivityHandler<br>- trackTaskHandler<br>- recordTaskCompletionHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ define(DefinePlan): PlanId<br>+ defineObjective(DefineObjective): void<br>+ defineActivity(DefineActivity): void<br>+ trackTask(TrackTask): void<br>+ recordTaskCompletion(RecordTaskCompletion): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefinePlan</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define un plan operativo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ code: PlanCode<br>+ name: Name<br>+ description: Description</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineObjective</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define un objetivo bajo un plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ planId: PlanId<br>+ objectiveId: ObjectiveId<br>+ name: Name<br>+ description: Description</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineActivity</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define una actividad bajo un objetivo del plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ planId: PlanId<br>+ objectiveId: ObjectiveId<br>+ activityId: ActivityId<br>+ name, description<br>+ measurementUnit: MeasurementUnit<br>+ target: Target</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TrackTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cuenta como abierta una tarea definida bajo una actividad del plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ activityId: ActivityId<br>+ taskId: TaskId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RecordTaskCompletion</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Deja de contar como abierta una tarea completada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ activityId: ActivityId<br>+ taskId: TaskId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefinePlanHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define el plan si ningún otro tiene su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planRepository: PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(DefinePlan): PlanId</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineObjectiveHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define el objetivo con el siguiente número del plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planRepository: PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(DefineObjective): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineActivityHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define la actividad con el siguiente número del objetivo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planRepository: PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(DefineActivity): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TrackTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Carga con bloqueo el plan que contiene la actividad y le registra la tarea abierta.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planRepository: PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(TrackTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RecordTaskCompletionHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Carga con bloqueo el plan que contiene la actividad y le registra la tarea completada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planRepository: PlanRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(RecordTaskCompletion): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskCommandService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de escritura de tareas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- defineBeneficiaryFollowUpTaskHandler<br>- registerTaskDeliveryHandler<br>- completeTaskHandler<br>- reopenTaskHandler<br>- relinkTaskDeliveryHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ defineBeneficiaryFollowUp(DefineBeneficiaryFollowUpTask): TaskId<br>+ registerDelivery(RegisterTaskDelivery): void<br>+ complete(CompleteTask): void<br>+ reopen(ReopenTask): void<br>+ relinkDelivery(RelinkTaskDelivery): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineBeneficiaryFollowUpTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define una visita de seguimiento a un beneficiario bajo una actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ activityId: ActivityId<br>+ activityCode: ActivityCode<br>+ description: Description<br>+ beneficiaryId: BeneficiaryId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RegisterTaskDelivery</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra la entrega de una tarea pendiente.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskCode: TaskCode<br>+ submissionId: SubmissionId<br>+ executionDate: ExecutionDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">CompleteTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Completa una tarea cuya entrega confirmó la revisión.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskCode: TaskCode<br>+ submissionId: SubmissionId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReopenTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve a pendientes una tarea cuya entrega se rechazó.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskCode: TaskCode<br>+ submissionId: SubmissionId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RelinkTaskDelivery</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reasigna una entrega a la tarea a la que corresponde su evidencia.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskCode: TaskCode<br>+ fromTaskCode: TaskCode<br>+ submissionId: SubmissionId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefineBeneficiaryFollowUpTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define la tarea con el número siguiente a la última tarea de la actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- taskRepository: TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(DefineBeneficiaryFollowUpTask): TaskId</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RegisterTaskDeliveryHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra la entrega en la tarea indicada por su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- taskRepository: TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(RegisterTaskDelivery): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">CompleteTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Completa la tarea indicada por su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- taskRepository: TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(CompleteTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReopenTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reabre la tarea indicada por su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- taskRepository: TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(ReopenTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RelinkTaskDeliveryHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Mueve o intercambia la entrega entre dos tareas y guarda ambas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- taskRepository: TaskRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(RelinkTaskDelivery): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de lectura de planes, objetivos y actividades.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- planProjection: PlanProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ all(AllPlans): PlansResult<br>+ plan(PlanById): PlanResult<br>+ objective(ObjectiveById): ObjectiveResult<br>+ activity(ActivityById): ActivityResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">AllPlans, PlanById, ObjectiveById, ActivityById</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todos los planes, o un plan, objetivo o actividad por su identidad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ planId, objectiveId o activityId: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanResult, ObjectiveResult, ActivityResult, PlansResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Plan con sus objetivos y actividades, ordenados por código, y si cada uno está completo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id, code, name, description<br>+ completed: boolean<br>+ objectives / activities<br>+ measurementUnit, target (actividad)</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlanProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de los planes almacenados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findAll(AllPlans): List&lt;PlanResult&gt;<br>+ findById(PlanById): Optional&lt;PlanResult&gt;<br>+ findObjective(ObjectiveById): Optional&lt;ObjectiveResult&gt;<br>+ findActivity(ActivityById): Optional&lt;ActivityResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de lectura de tareas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- pendingTaskProjection: PendingTaskProjection<br>- taskProjection: TaskProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ pending(PendingTasks): PendingTasksResult<br>+ page(TasksPage): TasksPageResult<br>+ byId(TaskById): TaskResult<br>+ task(TaskByCode): TaskResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PendingTasks</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Tareas que esperan una entrega, opcionalmente de una sola actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ activityCode: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TasksPage</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de tareas filtrada por estado, código o actividad y ordenada por código, estado o fecha de ejecución.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ status, code, activityCode: String<br>+ sort, direction: String<br>+ page, size: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskById, TaskByCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una tarea por su identidad o su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskId: UUID o code: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PendingTaskResult, PendingTasksResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Tarea pendiente con los datos de su actividad, ordenadas por código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ code, description<br>+ activityCode, activityDescription<br>+ measurementUnit</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Tarea tal como el revisor contrasta la evidencia con ella.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ code, description, status<br>+ submissionId: UUID<br>+ executionDate: LocalDate<br>+ beneficiaryId: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TasksPageResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de tareas con el tamaño de la selección completa.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ content: List&lt;TaskResult&gt;<br>+ totalPages: int<br>+ totalElements: long<br>+ actualPage, pageSize: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PendingTaskProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de las tareas pendientes.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findPending(PendingTasks): List&lt;PendingTaskResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">TaskProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de tareas, una a una o por páginas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findByCode(TaskByCode): Optional&lt;TaskResult&gt;<br>+ findById(TaskById): Optional&lt;TaskResult&gt;<br>+ findPage(TasksPage): TasksPageResult</td>
        </tr>
    </tbody>
</table>
</div>

Las capacidades del contexto atienden las siguientes historias de usuario:

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 50%;">Capacidad</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 50%;">Historia de usuario</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PendingTasks, TasksPage y TaskByCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SGT-8: buscar y filtrar las tareas registradas</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RegisterTaskDelivery, CompleteTask, ReopenTask y RelinkTaskDelivery</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EP-03: validación y aprobación de fichas</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DefinePlan, DefineObjective, DefineActivity, DefineBeneficiaryFollowUpTask, TrackTask y RecordTaskCompletion</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EP-04: seguimiento de objetivos estratégicos institucionales</td>
        </tr>
    </tbody>
</table>
</div>
