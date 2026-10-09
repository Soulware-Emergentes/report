La capa de interfaz de Planning tiene dos controladores REST y dos consumidores de eventos. PlanController atiende a las personas que administran el plan desde la aplicación web; TaskController atiende tanto a personas como a sgt, que registra y revisa las entregas de las tareas con un token de servicio. Los consumidores reciben los eventos de las tareas y actualizan el avance del plan.

La autorización depende del tipo de token. Los recursos de planes y la colección /api/v1/tasks exigen el token de una persona. Las rutas bajo /api/v1/tasks/ exigen un token de servicio con el scope tasks.read para las lecturas y tasks.write para las escrituras, que es el que staff otorga a sgt.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Método y ruta</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Operación</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 20%;">Token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plans</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista los planes con sus objetivos y actividades.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/plans</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define un plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/plans/{planId}/objectives</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define un objetivo del plan.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/plans/{planId}/objectives/{objectiveId}/activities</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define una actividad del objetivo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/tasks</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve una página de tareas, filtrada por estado, código o actividad y ordenada por código, estado o fecha de ejecución.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Define una tarea de seguimiento a un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/tasks/pending</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista las tareas pendientes, opcionalmente de una actividad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.read</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/tasks/{taskCode}</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve una tarea por su código.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.read</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/delivery</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra la entrega de la tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.write</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/delivery/relink</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reasigna una entrega a la tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.write</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/completion</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Completa la tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.write</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/reopening</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reabre la tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">tasks.write</td>
        </tr>
    </tbody>
</table>
</div>

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 12px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 21%;">Clase</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 13%;">Categoría</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 16%;">Propósito</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Atributos</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Métodos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlanController</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Expone planes, objetivos y actividades como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- planCommandService: PlanCommandService<br>- planQueryService: PlanQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ all(): PlansResponse<br>+ define(request): PlanResponse<br>+ defineObjective(planId, request): ObjectiveResponse<br>+ defineActivity(planId, objectiveId, request): ActivityResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskController</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Expone las tareas y sus entregas como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- taskCommandService: TaskCommandService<br>- taskQueryService: TaskQueryService<br>- planQueryService: PlanQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ page(status, code, activityCode, sort, direction, page, size): TasksPageResponse<br>+ defineBeneficiaryFollowUp(request): TaskResponse<br>+ pending(activityCode): PendingTasksResponse<br>+ task(taskCode): TaskResponse<br>+ registerDelivery(taskCode, request): TaskResponse<br>+ relinkDelivery(taskCode, request): TaskResponse<br>+ complete(taskCode, request): TaskResponse<br>+ reopen(taskCode, request): TaskResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlanWireMapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Traduce solicitudes de planes en comandos y resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos estáticos to*</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskWireMapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Traduce solicitudes de tareas en comandos y criterios, y resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos estáticos to*</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DefinePlanRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la definición de un plan.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ code, name, description: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DefineObjectiveRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la definición de un objetivo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ name, description: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DefineActivityRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la definición de una actividad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ name, description, measurementUnit: String<br>+ target: long</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DefineBeneficiaryFollowUpTaskRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la definición de una tarea de seguimiento.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ activityId: UUID<br>+ description, beneficiaryId: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RegisterDeliveryRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo del registro de una entrega.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ submissionId: UUID<br>+ executionDate: LocalDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RelinkDeliveryRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la reasignación de una entrega.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ submissionId: UUID<br>+ fromTaskCode: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ReviewedDeliveryRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la confirmación o el rechazo de una entrega.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ submissionId: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlanResponse, ObjectiveResponse, ActivityResponse, PlansResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Plan con sus objetivos y actividades, y si cada uno está completo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id, code, name, description<br>+ completed: boolean<br>+ objectives / activities<br>+ measurementUnit, target (actividad)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Tarea con su estado y entrega.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ code, description, status<br>+ submissionId: UUID<br>+ executionDate: LocalDate<br>+ beneficiaryId: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TasksPageResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Página de tareas con el tamaño de la selección completa.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ content: List&lt;TaskResponse&gt;<br>+ totalPages: int<br>+ totalElements: long<br>+ actualPage, pageSize: int</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PendingTaskResponse, PendingTasksResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Tarea pendiente con los datos de su actividad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ code, description<br>+ activityCode, activityDescription<br>+ measurementUnit</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskDefinedHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Event Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Al definirse una tarea, la cuenta como abierta en el plan que contiene su actividad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- planCommandService: PlanCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ on(TaskDefined): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskCompletedHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Event Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Al completarse una tarea, deja de contarla como abierta en el plan.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- planCommandService: PlanCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ on(TaskCompleted): void</td>
        </tr>
    </tbody>
</table>
</div>

Las respuestas de TaskController a sgt distinguen una negativa de una falla: una tarea que no existe o que no admite la operación responde con un error de negocio, que sgt registra como REFUSED, y una operación ya realizada para la misma entrega responde igual que la primera vez.

Los consumidores de eventos se registran con @ApplicationModuleListener de Spring Modulith. El evento se guarda en la tabla de publicación de eventos dentro de la misma transacción que cambió la tarea, y el consumidor actualiza el plan después de confirmarla; si falla, la publicación queda pendiente y se vuelve a intentar.
