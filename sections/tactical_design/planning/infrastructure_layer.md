La capa de infraestructura guarda los planes y las tareas en la base de datos PostgreSQL de poi. Cada agregado tiene su adaptador de repositorio sobre JPA, y las consultas se responden con SQL directo sobre las mismas tablas.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JpaPlanRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PlanRepository con JPA, guardando el plan con sus objetivos y actividades, y publica los eventos del agregado.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- delegate: PlanJpaRepository<br>- publisher: ApplicationEventPublisher</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(plan): Plan<br>+ getById(id): Plan<br>+ findByCode(code): Optional&lt;Plan&gt;<br>+ findByActivity(activityId): Optional&lt;Plan&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlanEntity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla plans con sus objetivos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, code, name, description, completed<br>objectives: Set&lt;ObjectiveRow&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ObjectiveRow</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla objectives con sus actividades.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, code, name, description, completed<br>activities: Set&lt;ActivityRow&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ActivityRow</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla activities, con sus tareas abiertas en activity_open_tasks.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, code, name, description<br>measurementUnit, target<br>hasTasks, completed<br>openTasks: Set&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlanJpaRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Acceso JPA a plans.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findByCode(code): Optional&lt;PlanEntity&gt;<br>+ findByActivityId(activityId): Optional&lt;PlanEntity&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JpaTaskRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa TaskRepository con JPA y reconstruye la subclase de tarea según su tipo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- delegate: TaskJpaRepository<br>- publisher: ApplicationEventPublisher</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(task): Task<br>+ getById(id): Task<br>+ findByCode(code): Optional&lt;Task&gt;<br>+ findLastUnder(activityId): Optional&lt;Task&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskEntity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla tasks; la columna kind indica el tipo de tarea.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, activityId, code, description<br>kind, status<br>submissionId, executionDate<br>beneficiaryId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskJpaRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Acceso JPA a tasks.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos derivados de JpaRepository</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcPlanProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PlanProjection con SQL sobre plans, objectives y activities.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findAll(AllPlans): List&lt;PlanResult&gt;<br>+ findById(PlanById): Optional&lt;PlanResult&gt;<br>+ findObjective(ObjectiveById): Optional&lt;ObjectiveResult&gt;<br>+ findActivity(ActivityById): Optional&lt;ActivityResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcTaskProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa TaskProjection con SQL sobre tasks, y pagina uniendo tasks con activities.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findByCode(TaskByCode): Optional&lt;TaskResult&gt;<br>+ findById(TaskById): Optional&lt;TaskResult&gt;<br>+ findPage(TasksPage): TasksPageResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcPendingTaskProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PendingTaskProjection uniendo tasks con activities.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findPending(PendingTasks): List&lt;PendingTaskResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

La tabla tasks guarda todos los tipos de tarea con una columna kind, y sus restricciones CHECK repiten las reglas del ciclo de vida: una tarea pendiente no tiene entrega, una entrega siempre trae su fecha de ejecución y una tarea de seguimiento siempre indica a su beneficiario.

El adaptador de planes guarda en cada fila de plans, objectives y activities si está completa, de modo que las consultas leen el avance sin recalcularlo. PlanJpaRepository.findByActivityId carga el plan con un bloqueo PESSIMISTIC_WRITE hasta que termina la transacción. La tabla activity_open_tasks no tiene clave foránea hacia tasks, porque las tareas son otro agregado y el plan solo guarda su identidad.
