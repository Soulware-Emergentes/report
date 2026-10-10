-- Tablas del contexto directory, tomadas de las migraciones Flyway: staff/V4__directory.sql

CREATE TABLE people (
    id UUID PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    display_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255)
);

CREATE INDEX people_job_title_display_name ON people (job_title, display_name);

CREATE TABLE groups (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE group_members (
    group_id UUID NOT NULL REFERENCES groups (id) ON DELETE CASCADE,
    person_id UUID NOT NULL REFERENCES people (id) ON DELETE CASCADE,
    PRIMARY KEY (group_id, person_id)
);

CREATE INDEX group_members_person ON group_members (person_id);
