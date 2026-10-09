-- Tablas del contexto plots, tomadas de las migraciones Flyway: sgt/V4__plots.sql

CREATE TABLE plots (
    id UUID PRIMARY KEY,
    owner_document_type VARCHAR(20) NOT NULL,
    owner_document_number VARCHAR(12) NOT NULL,
    boundary geometry(Polygon) NOT NULL CHECK (ST_IsValid(boundary)),
    footprint geography(Polygon, 4326) GENERATED ALWAYS AS (ST_Transform(boundary, 4326)::geography) STORED,
    ubigeo VARCHAR(6) NOT NULL CHECK (ubigeo ~ '^[0-9]{6}$'),
    registration_date TIMESTAMP NOT NULL,
    CONSTRAINT plots_owner_key UNIQUE (owner_document_type, owner_document_number)
);

CREATE INDEX plots_footprint_idx ON plots USING GIST (footprint);
CREATE INDEX plots_ubigeo_idx ON plots (ubigeo text_pattern_ops);
