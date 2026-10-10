-- Tablas del contexto planning, tomadas de las migraciones Flyway: poi/V4__planning.sql y V5__plan_completion.sql

CREATE TABLE plans (
    id UUID PRIMARY KEY,
    code VARCHAR(9) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE objectives (
    id UUID PRIMARY KEY,
    plan_id UUID NOT NULL REFERENCES plans (id),
    code VARCHAR(12) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE activities (
    id UUID PRIMARY KEY,
    objective_id UUID NOT NULL REFERENCES objectives (id),
    code VARCHAR(15) NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    measurement_unit TEXT NOT NULL,
    target BIGINT NOT NULL CHECK (target >= 1),
    has_tasks BOOLEAN NOT NULL DEFAULT FALSE,
    completed BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE activity_open_tasks (
    activity_id UUID NOT NULL REFERENCES activities (id) ON DELETE CASCADE,
    task_id UUID NOT NULL,
    PRIMARY KEY (activity_id, task_id)
);

CREATE TABLE tasks (
    id UUID PRIMARY KEY,
    activity_id UUID NOT NULL REFERENCES activities (id),
    code VARCHAR(20) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    kind VARCHAR(40) NOT NULL CHECK (kind IN ('BENEFICIARY_FOLLOW_UP')),
    status VARCHAR(20) NOT NULL CHECK (status IN ('PENDING', 'DELIVERED', 'COMPLETED')),
    submission_id UUID,
    execution_date DATE,
    beneficiary_id TEXT,
    CHECK ((submission_id IS NULL) = (execution_date IS NULL)),
    CHECK ((status = 'PENDING') = (submission_id IS NULL)),
    CHECK (kind <> 'BENEFICIARY_FOLLOW_UP' OR beneficiary_id IS NOT NULL)
);

CREATE INDEX tasks_activity_status_idx ON tasks (activity_id, status);
