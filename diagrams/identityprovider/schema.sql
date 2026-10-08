-- Tablas del contexto identityprovider, tomadas de las migraciones Flyway: staff/V5__identity_provider.sql

CREATE TABLE api_resources (
    id UUID PRIMARY KEY,
    identifier VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE api_roles (
    id UUID PRIMARY KEY,
    resource_id UUID NOT NULL REFERENCES api_resources (id) ON DELETE CASCADE,
    value VARCHAR(100) NOT NULL,
    description TEXT,
    UNIQUE (resource_id, value)
);

CREATE TABLE api_scopes (
    id UUID PRIMARY KEY,
    resource_id UUID NOT NULL REFERENCES api_resources (id) ON DELETE CASCADE,
    value VARCHAR(100) NOT NULL,
    description TEXT,
    UNIQUE (resource_id, value)
);

CREATE TABLE client_registrations (
    id UUID PRIMARY KEY,
    client_id VARCHAR(255) NOT NULL UNIQUE,
    kind VARCHAR(20) NOT NULL CHECK (kind IN ('PUBLIC', 'CONFIDENTIAL')),
    secret_hash VARCHAR(255),
    CHECK ((kind = 'CONFIDENTIAL') = (secret_hash IS NOT NULL))
);

CREATE TABLE client_redirect_uris (
    client_registration_id UUID NOT NULL REFERENCES client_registrations (id) ON DELETE CASCADE,
    uri VARCHAR(1000) NOT NULL,
    kind VARCHAR(20) NOT NULL CHECK (kind IN ('LOGIN', 'LOGOUT')),
    PRIMARY KEY (client_registration_id, uri, kind)
);

CREATE TABLE client_resources (
    client_registration_id UUID NOT NULL REFERENCES client_registrations (id) ON DELETE CASCADE,
    resource_id UUID NOT NULL REFERENCES api_resources (id) ON DELETE CASCADE,
    PRIMARY KEY (client_registration_id, resource_id)
);

CREATE TABLE role_assignments (
    role_id UUID NOT NULL REFERENCES api_roles (id) ON DELETE CASCADE,
    group_id UUID NOT NULL,
    PRIMARY KEY (role_id, group_id)
);

CREATE INDEX role_assignments_group ON role_assignments (group_id);

CREATE TABLE scope_grants (
    client_registration_id UUID NOT NULL REFERENCES client_registrations (id) ON DELETE CASCADE,
    scope_id UUID NOT NULL REFERENCES api_scopes (id) ON DELETE CASCADE,
    PRIMARY KEY (client_registration_id, scope_id)
);
