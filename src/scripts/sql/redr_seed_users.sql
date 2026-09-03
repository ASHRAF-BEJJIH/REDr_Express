-- ============================================================
-- SEED DATA
-- ============================================================
USE redr_db;)
START TRANSACTION;

-- ============================================================
-- 1. AGENCIES
-- On crée d'abord les agences car les managers vont les référencer
-- ============================================================

INSERT INTO agencies (
    id,
    name,
    city,
    phone,
    email,
    status,
    approval_date,
    inscription_date,
    rating,
    logo_url,
    iban,
    description,
    address,
    suspension_reason
)
VALUES
(
    'agency-001',
    'Atlas Rent Car',
    'Rabat',
    '+212600000001',
    'contact@atlasrent.ma',
    'APPROVED',
    '2026-01-10 10:00:00',
    '2026-01-05 09:00:00',
    4.7,
    'https://example.com/logos/atlas.png',
    'MA6401151900000123456789012',
    'Agence spécialisée dans la location de voitures à Rabat.',
    'Hay Riad, Rabat',
    NULL
),
(
    'agency-002',
    'Casa Drive',
    'Casablanca',
    '+212600000002',
    'contact@casadrive.ma',
    'APPROVED',
    '2026-02-15 14:00:00',
    '2026-02-10 08:30:00',
    4.4,
    'https://example.com/logos/casa-drive.png',
    'MA6401151900000123456789013',
    'Location de véhicules à Casablanca.',
    'Maarif, Casablanca',
    NULL
),
(
    'agency-003',
    'Marrakech Cars',
    'Marrakech',
    '+212600000003',
    'contact@marrakechcars.ma',
    'PENDING',
    NULL,
    '2026-08-20 11:00:00',
    NULL,
    NULL,
    'MA6401151900000123456789014',
    'Agence de location de véhicules à Marrakech.',
    'Gueliz, Marrakech',
    NULL
);


-- ============================================================
-- 2. SUPER ADMIN
-- users -> admins
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'admin-001',
    'Mohamed',
    'Admin',
    'admin@redr.ma',

    -- Exemple seulement.
    -- Dans ton application réelle, stocke un hash bcrypt/argon2.
    '$2b$10$exampleHashedPasswordAdmin',

    '2026-01-01 10:00:00',
    '2026-01-01 10:00:00',

    'SUPER_ADMIN',
    'ACTIVE',

    0,
    NULL,

    '2026-01-01 10:05:00',

    '2026-01-01 10:00:00',
    '2026-01-01 10:00:00',

    NULL,

    'ADMIN'
);

INSERT INTO admins (
    id,
    permissions,
    admin_level
)
VALUES (
    'admin-001',
    'AGENCY_APPROVE,AGENCY_SUSPEND,USER_MANAGE,PLATFORM_MANAGE',
    10
);


-- ============================================================
-- 3. AGENCY MANAGER #1
-- users -> agency_managers
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'manager-001',
    'Yassine',
    'Alaoui',
    'yassine@atlasrent.ma',
    '$2b$10$exampleHashedPasswordManager1',

    '2026-01-05 09:00:00',
    '2026-01-05 09:00:00',

    'AGENCY_MANAGER',
    'ACTIVE',

    0,
    NULL,

    '2026-01-05 09:10:00',

    '2026-01-05 09:00:00',
    '2026-01-10 10:00:00',

    NULL,

    'AGENCY_MANAGER'
);

INSERT INTO agency_managers (
    id,
    phone,
    national_id,
    digital_signature,
    responsability_level,
    licence_number,
    approved_at,
    approved_by_admin_id,
    rejection_reason,
    agency_id
)
VALUES (
    'manager-001',
    '+212611111111',
    'AB123456',
    'signatures/manager-001.png',
    5,
    'MANAGER-LIC-001',
    '2026-01-10 10:00:00',
    'admin-001',
    NULL,
    'agency-001'
);


-- ============================================================
-- 4. AGENCY MANAGER #2
-- users -> agency_managers
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'manager-002',
    'Salma',
    'Bennani',
    'salma@casadrive.ma',
    '$2b$10$exampleHashedPasswordManager2',

    '2026-02-10 08:30:00',
    '2026-02-10 08:30:00',

    'AGENCY_MANAGER',
    'ACTIVE',

    0,
    NULL,

    '2026-02-10 08:40:00',

    '2026-02-10 08:30:00',
    '2026-02-15 14:00:00',

    NULL,

    'AGENCY_MANAGER'
);

INSERT INTO agency_managers (
    id,
    phone,
    national_id,
    digital_signature,
    responsability_level,
    licence_number,
    approved_at,
    approved_by_admin_id,
    rejection_reason,
    agency_id
)
VALUES (
    'manager-002',
    '+212622222222',
    'CD654321',
    'signatures/manager-002.png',
    5,
    'MANAGER-LIC-002',
    '2026-02-15 14:00:00',
    'admin-001',
    NULL,
    'agency-002'
);


-- ============================================================
-- 5. PENDING AGENCY MANAGER
-- Exemple d'un manager pas encore approuvé
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'manager-003',
    'Omar',
    'Mansouri',
    'omar@marrakechcars.ma',
    '$2b$10$exampleHashedPasswordManager3',

    NULL,
    '2026-08-20 11:00:00',

    'AGENCY_MANAGER',
    'PENDING',

    0,
    NULL,

    '2026-08-20 11:10:00',

    '2026-08-20 11:00:00',
    '2026-08-20 11:00:00',

    NULL,

    'AGENCY_MANAGER'
);

INSERT INTO agency_managers (
    id,
    phone,
    national_id,
    digital_signature,
    responsability_level,
    licence_number,
    approved_at,
    approved_by_admin_id,
    rejection_reason,
    agency_id
)
VALUES (
    'manager-003',
    '+212633333333',
    'EF987654',
    NULL,
    1,
    'MANAGER-LIC-003',
    NULL,
    NULL,
    NULL,
    'agency-003'
);


-- ============================================================
-- 6. CLIENT #1
-- users -> clients
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'client-001',
    'Ahmed',
    'El Amrani',
    'ahmed@gmail.com',
    '$2b$10$exampleHashedPasswordClient1',

    NULL,
    '2026-03-01 12:00:00',

    'CLIENT',
    'ACTIVE',

    0,
    NULL,

    '2026-03-01 12:10:00',

    '2026-03-01 12:00:00',
    '2026-03-01 12:00:00',

    NULL,

    'CLIENT'
);

INSERT INTO clients (
    id,
    licence_number,
    licence_expiration_date,
    national_id,
    passport_number,
    phone,
    digital_signature
)
VALUES (
    'client-001',
    'LIC-MA-001',
    '2030-05-15',
    'GH123456',
    NULL,
    '+212644444444',
    'signatures/client-001.png'
);


-- ============================================================
-- 7. CLIENT #2
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'client-002',
    'Sara',
    'Idrissi',
    'sara@gmail.com',
    '$2b$10$exampleHashedPasswordClient2',

    NULL,
    '2026-04-12 15:30:00',

    'CLIENT',
    'ACTIVE',

    0,
    NULL,

    '2026-04-12 15:40:00',

    '2026-04-12 15:30:00',
    '2026-04-12 15:30:00',

    NULL,

    'CLIENT'
);

INSERT INTO clients (
    id,
    licence_number,
    licence_expiration_date,
    national_id,
    passport_number,
    phone,
    digital_signature
)
VALUES (
    'client-002',
    'LIC-MA-002',
    '2029-09-20',
    'IJ987654',
    NULL,
    '+212655555555',
    NULL
);


-- ============================================================
-- 8. CLIENT AVEC PASSEPORT
-- ============================================================

INSERT INTO users (
    id,
    first_name,
    last_name,
    email,
    password,
    password_updated_at,
    inscription_date,
    role,
    account_status,
    failed_login_attempts,
    lock_until,
    email_verified_at,
    created_at,
    updated_at,
    deleted_at,
    user_type
)
VALUES (
    'client-003',
    'John',
    'Smith',
    'john.smith@example.com',
    '$2b$10$exampleHashedPasswordClient3',

    NULL,
    '2026-06-01 10:00:00',

    'CLIENT',
    'ACTIVE',

    0,
    NULL,

    '2026-06-01 10:10:00',

    '2026-06-01 10:00:00',
    '2026-06-01 10:00:00',

    NULL,

    'CLIENT'
);

INSERT INTO clients (
    id,
    licence_number,
    licence_expiration_date,
    national_id,
    passport_number,
    phone,
    digital_signature
)
VALUES (
    'client-003',
    'LIC-US-001',
    '2031-02-10',
    NULL,
    'US123456789',
    '+212666666666',
    NULL
);


COMMIT;