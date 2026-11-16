-- Tablas del contexto identityprovider, tomadas de las migraciones Flyway: staff/V5__identity_provider.sql

CREATE TABLE applications (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    icon BYTEA,
    icon_media_type VARCHAR(100),
    CHECK ((icon IS NULL) = (icon_media_type IS NULL))
);

CREATE TABLE environments (
    code VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE api_resources (
    id UUID PRIMARY KEY,
    identifier VARCHAR(255) NOT NULL UNIQUE,
    application_id UUID NOT NULL REFERENCES applications (id),
    environment VARCHAR(20) NOT NULL REFERENCES environments (code),
    UNIQUE (application_id, environment)
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
    application_id UUID NOT NULL REFERENCES applications (id),
    environment VARCHAR(20) NOT NULL REFERENCES environments (code),
    kind VARCHAR(20) NOT NULL CHECK (kind IN ('PUBLIC', 'CONFIDENTIAL')),
    secret_hash VARCHAR(255),
    home_uri VARCHAR(1000),
    CHECK ((kind = 'CONFIDENTIAL') = (secret_hash IS NOT NULL))
);

CREATE TABLE client_grant_types (
    client_registration_id UUID NOT NULL REFERENCES client_registrations (id) ON DELETE CASCADE,
    grant_type VARCHAR(30) NOT NULL CHECK (grant_type IN ('AUTHORIZATION_CODE', 'REFRESH_TOKEN', 'CLIENT_CREDENTIALS')),
    PRIMARY KEY (client_registration_id, grant_type)
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
