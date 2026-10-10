-- Tablas del contexto monitoring, tomadas de las migraciones Flyway: sgt/V5__field_sheets.sql

CREATE TABLE field_sheets (
    id UUID PRIMARY KEY,
    code VARCHAR(12) NOT NULL UNIQUE CHECK (code ~ '^FI-[0-9]{4}-[0-9]{4}$'),
    task_code VARCHAR(20) NOT NULL,
    beneficiary_document_type VARCHAR(20),
    beneficiary_document_number VARCHAR(12),
    evaluation_date TIMESTAMP,
    securement_date TIMESTAMP,
    scan_key TEXT NOT NULL,
    scan_size BIGINT NOT NULL CHECK (scan_size > 0),
    submitted_by UUID NOT NULL,
    submission_date TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('SUBMITTED', 'DELIVERED', 'APPROVED', 'REJECTED', 'VOIDED')),
    reviewed_by UUID,
    review_date TIMESTAMP,
    CHECK ((reviewed_by IS NULL) = (review_date IS NULL)),
    CHECK ((beneficiary_document_type IS NULL) = (beneficiary_document_number IS NULL)),
    CHECK (status <> 'APPROVED' OR (beneficiary_document_type IS NOT NULL AND evaluation_date IS NOT NULL))
);

CREATE TABLE field_sheet_supplies (
    field_sheet_id UUID NOT NULL REFERENCES field_sheets (id) ON DELETE CASCADE,
    position INTEGER NOT NULL,
    name TEXT NOT NULL,
    amount NUMERIC NOT NULL CHECK (amount >= 0),
    unit VARCHAR(20) NOT NULL,
    PRIMARY KEY (field_sheet_id, position)
);
