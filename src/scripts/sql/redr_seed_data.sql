-- ============================================================
-- REDR PLATFORM - REALISTIC SEED DATA
-- MySQL 8+
-- Based strictly on the provided REDR schema.
-- All people/companies below are fictional test data.
-- Test password for all users: password
-- ============================================================

USE redr_db;

START TRANSACTION;

-- ============================================================
-- 1. USERS
-- ============================================================

INSERT INTO users
(id, first_name, last_name, email, password, password_updated_at,
 inscription_date, role, account_status, failed_login_attempts,
 lock_until, email_verified_at, created_at, updated_at, deleted_at, user_type)
VALUES
('u0000001-0000-0000-0000-000000000001', 'Youssef', 'Alaoui', 'youssef.alaoui@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-01-10 09:00:00', '2026-01-10 08:45:00', 'SUPER_ADMIN', 'ACTIVE', 0, NULL,
 '2026-01-10 08:50:00', '2026-01-10 08:45:00', '2026-01-10 08:45:00', '2026-06-01 10:00:00', NULL, 'ADMIN'),

('u0000002-0000-0000-0000-000000000002', 'Karim', 'Bennani', 'karim.bennani@atlasrent.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-01-15 10:00:00', '2026-01-15 09:40:00', 'AGENCY_MANAGER', 'ACTIVE', 0, NULL,
 '2026-01-15 09:50:00', '2026-01-15 09:40:00', '2026-06-15 11:00:00', NULL, NULL, 'AGENCY_MANAGER'),

('u0000003-0000-0000-0000-000000000003', 'Salma', 'El Idrissi', 'salma.elidrissi@casarent.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-02-01 11:00:00', '2026-02-01 10:30:00', 'AGENCY_MANAGER', 'ACTIVE', 0, NULL,
 '2026-02-01 10:45:00', '2026-02-01 10:30:00', '2026-06-20 12:00:00', NULL, NULL, 'AGENCY_MANAGER'),

('u0000004-0000-0000-0000-000000000004', 'Omar', 'Tazi', 'omar.tazi@mediterraneerent.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-02-10 14:00:00', '2026-02-10 13:30:00', 'AGENCY_MANAGER', 'ACTIVE', 0, NULL,
 '2026-02-10 13:45:00', '2026-02-10 13:30:00', '2026-07-01 09:00:00', NULL, NULL, 'AGENCY_MANAGER'),

('u0000005-0000-0000-0000-000000000005', 'Amine', 'Chraibi', 'amine.chraibi@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-03-05 09:00:00', '2026-03-05 08:30:00', 'CLIENT', 'ACTIVE', 0, NULL,
 '2026-03-05 08:45:00', '2026-03-05 08:30:00', '2026-06-10 09:00:00', NULL, NULL, 'CLIENT'),

('u0000006-0000-0000-0000-000000000006', 'Imane', 'Berrada', 'imane.berrada@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-03-12 10:00:00', '2026-03-12 09:30:00', 'CLIENT', 'ACTIVE', 0, NULL,
 '2026-03-12 09:45:00', '2026-03-12 09:30:00', '2026-06-11 10:00:00', NULL, NULL, 'CLIENT'),

('u0000007-0000-0000-0000-000000000007', 'Mehdi', 'Zerouali', 'mehdi.zerouali@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-04-01 12:00:00', '2026-04-01 11:30:00', 'CLIENT', 'ACTIVE', 0, NULL,
 '2026-04-01 11:45:00', '2026-04-01 11:30:00', '2026-06-12 10:00:00', NULL, NULL, 'CLIENT'),

('u0000008-0000-0000-0000-000000000008', 'Sara', 'Ait Lahcen', 'sara.aitlahcen@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-04-08 15:00:00', '2026-04-08 14:30:00', 'CLIENT', 'ACTIVE', 0, NULL,
 '2026-04-08 14:45:00', '2026-04-08 14:30:00', '2026-06-13 10:00:00', NULL, NULL, 'CLIENT'),

('u0000009-0000-0000-0000-000000000009', 'Nadia', 'Amrani', 'nadia.amrani@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-05-02 09:00:00', '2026-05-02 08:30:00', 'CLIENT', 'ACTIVE', 0, NULL,
 '2026-05-02 08:45:00', '2026-05-02 08:30:00', '2026-06-14 11:00:00', NULL, NULL, 'CLIENT'),

('u0000010-0000-0000-0000-000000000010', 'Rachid', 'Fassi', 'rachid.fassi@redr.test',
 '$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
 '2026-05-20 16:00:00', '2026-05-20 15:30:00', 'CLIENT', 'PENDING', 0, NULL,
 NULL, '2026-05-20 15:30:00', '2026-05-20 15:30:00', NULL, 'CLIENT');

-- ============================================================
-- 2. ADMINS
-- ============================================================

INSERT INTO admins (id, permissions, admin_level)
VALUES
('u0000001-0000-0000-0000-000000000001',
 'USER_MANAGEMENT,AGENCY_MANAGEMENT,SYSTEM_MAINTENANCE,REPORTS',
 3);

-- ============================================================
-- 3. AGENCIES
-- ============================================================

INSERT INTO agencies
(id, name, city, phone, email, status, approval_date, inscription_date,
 rating, logo_url, iban, description, address, suspension_reason)
VALUES
('a0000001-0000-0000-0000-000000000001',
 'Atlas Rent Cars', 'Marrakech', '+212524330101', 'contact@atlasrent.test',
 'APPROVED', '2026-01-16 10:00:00', '2026-01-15 09:30:00', 4.70,
 'https://cdn.redr.test/logos/atlas-rent.png',
 'MA640115190000012345678901234',
 'Agence de location de voitures orientee tourisme et affaires.',
 'Avenue Mohammed VI, Marrakech', NULL),

('a0000002-0000-0000-0000-000000000002',
 'Casa Mobility', 'Casablanca', '+212522440202', 'contact@casamobility.test',
 'APPROVED', '2026-02-02 09:30:00', '2026-02-01 10:20:00', 4.50,
 'https://cdn.redr.test/logos/casa-mobility.png',
 'MA640115190000023456789012345',
 'Agence urbaine proposant des vehicules economiques et premium.',
 'Boulevard Anfa, Casablanca', NULL),

('a0000003-0000-0000-0000-000000000003',
 'Mediterranee Auto', 'Tangier', '+212539550303', 'contact@medauto.test',
 'APPROVED', '2026-02-11 11:00:00', '2026-02-10 13:20:00', 4.30,
 'https://cdn.redr.test/logos/medauto.png',
 'MA640115190000034567890123456',
 'Agence specialisee dans les locations longue duree et aeroport.',
 'Route de Malabata, Tangier', NULL);

-- ============================================================
-- 4. AGENCY MANAGERS
-- ============================================================

INSERT INTO agency_managers
(id, phone, national_id, digital_signature, responsability_level,
 licence_number, approved_at, approved_by_admin_id, rejection_reason, agency_id)
VALUES
('u0000002-0000-0000-0000-000000000002',
 '+212661111111', 'AA123456', 'https://cdn.redr.test/signatures/karim.png', 3,
 'LIC-MA-ATLAS-001', '2026-01-16 10:00:00',
 'u0000001-0000-0000-0000-000000000001', NULL,
 'a0000001-0000-0000-0000-000000000001'),

('u0000003-0000-0000-0000-000000000003',
 '+212662222222', 'BB234567', 'https://cdn.redr.test/signatures/salma.png', 3,
 'LIC-MA-CASA-002', '2026-02-02 09:30:00',
 'u0000001-0000-0000-0000-000000000001', NULL,
 'a0000002-0000-0000-0000-000000000002'),

('u0000004-0000-0000-0000-000000000004',
 '+212663333333', 'CC345678', 'https://cdn.redr.test/signatures/omar.png', 2,
 'LIC-MA-MED-003', '2026-02-11 11:00:00',
 'u0000001-0000-0000-0000-000000000001', NULL,
 'a0000003-0000-0000-0000-000000000003');

-- ============================================================
-- 5. CLIENTS
-- ============================================================

INSERT INTO clients
(id, licence_number, licence_expiration_date, national_id, passport_number,
 phone, digital_signature)
VALUES
('u0000005-0000-0000-0000-000000000005',
 'DL-MA-100001', '2030-05-20', 'CD100001', NULL, '+212664100001',
 'https://cdn.redr.test/signatures/amine.png'),

('u0000006-0000-0000-0000-000000000006',
 'DL-MA-100002', '2029-11-15', 'CD100002', 'PA100002', '+212665100002',
 'https://cdn.redr.test/signatures/imane.png'),

('u0000007-0000-0000-0000-000000000007',
 'DL-MA-100003', '2031-02-10', 'CD100003', NULL, '+212666100003',
 'https://cdn.redr.test/signatures/mehdi.png'),

('u0000008-0000-0000-0000-000000000008',
 'DL-MA-100004', '2028-08-30', 'CD100004', 'PA100004', '+212667100004',
 'https://cdn.redr.test/signatures/sara.png'),

('u0000009-0000-0000-0000-000000000009',
 'DL-MA-100005', '2030-12-01', 'CD100005', NULL, '+212668100005',
 NULL),

('u0000010-0000-0000-0000-000000000010',
 'DL-MA-100006', '2031-04-18', 'CD100006', NULL, '+212669100006',
 NULL);

-- ============================================================
-- 6. CATEGORIES
-- ============================================================

INSERT INTO categories (id, name, description, created_at, updated_at, deleted_at)
VALUES
('cat00001-0000-0000-0000-000000000001', 'Economique',
 'Vehicules compacts et economiques pour les trajets urbains.',
 '2026-01-01 09:00:00', '2026-01-01 09:00:00', NULL),

('cat00002-0000-0000-0000-000000000002', 'Compacte',
 'Vehicules polyvalents adaptes aux trajets urbains et autoroutiers.',
 '2026-01-01 09:10:00', '2026-01-01 09:10:00', NULL),

('cat00003-0000-0000-0000-000000000003', 'SUV',
 'SUV confortables pour familles et longs trajets.',
 '2026-01-01 09:20:00', '2026-01-01 09:20:00', NULL),

('cat00004-0000-0000-0000-000000000004', 'Berline',
 'Berlines de gamme intermediaire et superieure.',
 '2026-01-01 09:30:00', '2026-01-01 09:30:00', NULL),

('cat00005-0000-0000-0000-000000000005', 'Luxe',
 'Vehicules premium pour une experience haut de gamme.',
 '2026-01-01 09:40:00', '2026-01-01 09:40:00', NULL);

-- ============================================================
-- 7. CARS
-- ============================================================

INSERT INTO cars
(id, model, brand, manufacture_year, transmission_type, mileage, current_status,
 daily_price, weekly_price, monthly_price, promotion_active, promotion_rate,
 promotion_start_date, promotion_end_date, condition_status,
 license_expiry_date, insurance_expiry_date, registration_number,
 insurance_policy_number, average_rating, seat_capacity, technical_notes,
 description, agencies_notified, notification_sent_at, notification_days_before,
 agency_id, category_id)
VALUES
('car00001-0000-0000-0000-000000000001', 'Clio 5', 'Renault', 2023, 'MANUAL', 28500,
 'Available', 320.00, 1900.00, 6500.00, FALSE, NULL, NULL, NULL, 'GOOD',
 '2027-03-15', '2027-03-15', '12345-A-6', 'POL-AT-0001', 4.60, 5,
 'Entretien regulier effectue en juin 2026.',
 'Citadine compacte, faible consommation et ideale pour Marrakech.',
 TRUE, '2026-06-01 09:00:00', 30,
 'a0000001-0000-0000-0000-000000000001',
 'cat00001-0000-0000-0000-000000000001'),

('car00002-0000-0000-0000-000000000002', 'Dacia Logan', 'Dacia', 2022, 'MANUAL', 41200,
 'Rented', 280.00, 1650.00, 5600.00, TRUE, 10.00, '2026-08-01', '2026-09-15', 'GOOD',
 '2027-01-20', '2027-01-20', '23456-B-6', 'POL-AT-0002', 4.40, 5,
 'Pneus avant remplaces en juillet 2026.',
 'Berline pratique avec grand coffre.',
 TRUE, '2026-07-20 10:00:00', 30,
 'a0000001-0000-0000-0000-000000000001',
 'cat00002-0000-0000-0000-000000000002'),

('car00003-0000-0000-0000-000000000003', 'Duster', 'Dacia', 2024, 'MANUAL', 16700,
 'Available', 430.00, 2600.00, 8900.00, FALSE, NULL, NULL, NULL, 'EXCELLENT',
 '2027-06-10', '2027-06-10', '34567-C-6', 'POL-AT-0003', 4.80, 5,
 'Vehicule presque neuf.',
 'SUV polyvalent adapte aux excursions et routes montagneuses.',
 TRUE, '2026-07-10 09:00:00', 30,
 'a0000001-0000-0000-0000-000000000001',
 'cat00003-0000-0000-0000-000000000003'),

('car00004-0000-0000-0000-000000000004', '208', 'Peugeot', 2023, 'AUTOMATIC', 22100,
 'Reserved', 350.00, 2100.00, 7200.00, FALSE, NULL, NULL, NULL, 'GOOD',
 '2027-04-05', '2027-04-05', '45678-D-6', 'POL-CM-0001', 4.70, 5,
 'Boite automatique, entretien programme apres la prochaine location.',
 'Compacte automatique confortable pour la ville.',
 TRUE, '2026-08-01 08:30:00', 30,
 'a0000002-0000-0000-0000-000000000002',
 'cat00002-0000-0000-0000-000000000002'),

('car00005-0000-0000-0000-000000000005', 'Corolla', 'Toyota', 2022, 'AUTOMATIC', 35500,
 'Available', 390.00, 2350.00, 7900.00, FALSE, NULL, NULL, NULL, 'GOOD',
 '2027-02-28', '2027-02-28', '56789-E-6', 'POL-CM-0002', 4.50, 5,
 'Revision complete en juillet 2026.',
 'Berline fiable et confortable pour les longs trajets.',
 TRUE, '2026-07-28 11:00:00', 30,
 'a0000002-0000-0000-0000-000000000002',
 'cat00004-0000-0000-0000-000000000004'),

('car00006-0000-0000-0000-000000000006', 'Tucson', 'Hyundai', 2024, 'AUTOMATIC', 12800,
 'AvailableSoon', 520.00, 3150.00, 10800.00, TRUE, 8.00, '2026-08-15', '2026-09-30', 'EXCELLENT',
 '2027-08-01', '2027-08-01', '67890-F-6', 'POL-CM-0003', 4.90, 5,
 'Controle technique effectue.',
 'SUV familial avec boite automatique et grand coffre.',
 TRUE, '2026-08-01 09:00:00', 30,
 'a0000002-0000-0000-0000-000000000002',
 'cat00003-0000-0000-0000-000000000003'),

('car00007-0000-0000-0000-000000000007', 'Megane E-Tech', 'Renault', 2024, 'AUTOMATIC', 9800,
 'Available', 650.00, 3900.00, 13200.00, FALSE, NULL, NULL, NULL, 'EXCELLENT',
 '2027-09-12', '2027-09-12', '78901-G-6', 'POL-MD-0001', 4.90, 5,
 'Recharge rapide disponible en agence.',
 'Vehicule electrique premium pour usage urbain et periurbain.',
 TRUE, '2026-08-05 10:00:00', 30,
 'a0000003-0000-0000-0000-000000000003',
 'cat00004-0000-0000-0000-000000000004'),

('car00008-0000-0000-0000-000000000008', 'C-Class', 'Mercedes-Benz', 2023, 'AUTOMATIC', 19800,
 'Available', 950.00, 5700.00, 19500.00, FALSE, NULL, NULL, NULL, 'EXCELLENT',
 '2027-10-10', '2027-10-10', '89012-H-6', 'POL-MD-0002', 4.95, 5,
 'Interieur cuir et aide au stationnement.',
 'Berline premium destinee aux clients affaires et tourisme haut de gamme.',
 TRUE, '2026-08-10 10:00:00', 30,
 'a0000003-0000-0000-0000-000000000003',
 'cat00005-0000-0000-0000-000000000005'),

('car00009-0000-0000-0000-000000000009', 'Sandero', 'Dacia', 2021, 'MANUAL', 60400,
 'Maintenance', 250.00, 1450.00, 4900.00, FALSE, NULL, NULL, NULL, 'NEEDS_REPAIR',
 '2026-12-20', '2026-12-20', '90123-I-6', 'POL-MD-0003', 4.10, 5,
 'Revision freinage en cours. Vehicule indisponible temporairement.',
 'Citadine economique en cours de maintenance.',
 TRUE, '2026-08-20 08:00:00', 15,
 'a0000003-0000-0000-0000-000000000003',
 'cat00001-0000-0000-0000-000000000001'),

('car00010-0000-0000-0000-000000000010', 'C3', 'Citroen', 2022, 'MANUAL', 33100,
 'Available', 300.00, 1800.00, 6100.00, FALSE, NULL, NULL, NULL, 'GOOD',
 '2027-05-18', '2027-05-18', '11223-J-6', 'POL-CM-0004', 4.30, 5,
 'Entretien courant realise.',
 'Citadine confortable et economique.',
 TRUE, '2026-07-18 09:00:00', 30,
 'a0000002-0000-0000-0000-000000000002',
 'cat00001-0000-0000-0000-000000000001');

-- ============================================================
-- 8. CAR FUEL TYPES
-- ============================================================

INSERT INTO car_fuel_types (car_id, fuel_type) VALUES
('car00001-0000-0000-0000-000000000001', 'GASOLINE'),
('car00002-0000-0000-0000-000000000002', 'DIESEL'),
('car00003-0000-0000-0000-000000000003', 'DIESEL'),
('car00004-0000-0000-0000-000000000004', 'GASOLINE'),
('car00005-0000-0000-0000-000000000005', 'HYBRID'),
('car00006-0000-0000-0000-000000000006', 'GASOLINE'),
('car00007-0000-0000-0000-000000000007', 'ELECTRIC'),
('car00008-0000-0000-0000-000000000008', 'GASOLINE'),
('car00009-0000-0000-0000-000000000009', 'GASOLINE'),
('car00010-0000-0000-0000-000000000010', 'GASOLINE');

-- ============================================================
-- 9. RESERVATIONS
-- ============================================================

INSERT INTO reservations
(id, start_date, end_date, creation_date, completed_at, total_amount, status,
 deposit_amount, pickup_location, return_location, late_return_fee,
 cancellation_reason, actual_return_time, client_id, car_id)
VALUES
('res00001-0000-0000-0000-000000000001',
 '2026-06-10', '2026-06-14', '2026-06-02 10:15:00', '2026-06-14 17:20:00',
 1280.00, 'COMPLETED', 400.00, 'Agence Atlas - Marrakech', 'Agence Atlas - Marrakech',
 0.00, NULL, '2026-06-14 17:20:00',
 'u0000005-0000-0000-0000-000000000005',
 'car00001-0000-0000-0000-000000000001'),

('res00002-0000-0000-0000-000000000002',
 '2026-07-05', '2026-07-10', '2026-06-28 14:30:00', '2026-07-10 11:00:00',
 1400.00, 'COMPLETED', 500.00, 'Agence Atlas - Marrakech', 'Aeroport Marrakech Menara',
 0.00, NULL, '2026-07-10 11:00:00',
 'u0000006-0000-0000-0000-000000000006',
 'car00002-0000-0000-0000-000000000002'),

('res00003-0000-0000-0000-000000000003',
 '2026-08-20', '2026-08-25', '2026-08-05 09:10:00', NULL,
 1950.00, 'CONFIRMED', 600.00, 'Agence Atlas - Marrakech', 'Agence Atlas - Marrakech',
 0.00, NULL, NULL,
 'u0000007-0000-0000-0000-000000000007',
 'car00003-0000-0000-0000-000000000003'),

('res00004-0000-0000-0000-000000000004',
 '2026-08-29', '2026-09-02', '2026-08-20 16:45:00', NULL,
 1400.00, 'CONFIRMED', 500.00, 'Agence Casa Mobility - Casablanca', 'Aeroport Mohammed V',
 0.00, NULL, NULL,
 'u0000008-0000-0000-0000-000000000008',
 'car00004-0000-0000-0000-000000000004'),

('res00005-0000-0000-0000-000000000005',
 '2026-07-15', '2026-07-20', '2026-07-01 12:00:00', NULL,
 1950.00, 'CANCELLED', 0.00, 'Agence Casa Mobility - Casablanca', 'Agence Casa Mobility - Casablanca',
 0.00, 'Client indisponible pour le voyage.',
 NULL,
 'u0000009-0000-0000-0000-000000000009',
 'car00005-0000-0000-0000-000000000005'),

('res00006-0000-0000-0000-000000000006',
 '2026-08-30', '2026-09-03', '2026-08-22 13:00:00', NULL,
 2392.00, 'CONFIRMED', 700.00, 'Agence Casa Mobility - Casablanca', 'Agence Casa Mobility - Casablanca',
 0.00, NULL, NULL,
 'u0000005-0000-0000-0000-000000000005',
 'car00006-0000-0000-0000-000000000006'),

('res00007-0000-0000-0000-000000000007',
 '2026-08-12', '2026-08-16', '2026-08-01 09:30:00', '2026-08-16 18:00:00',
 2600.00, 'COMPLETED', 800.00, 'Tangier Airport', 'Tangier Airport',
 100.00, NULL, '2026-08-16 18:00:00',
 'u0000006-0000-0000-0000-000000000006',
 'car00008-0000-0000-0000-000000000008'),

('res00008-0000-0000-0000-000000000008',
 '2026-09-05', '2026-09-08', '2026-08-18 15:00:00', NULL,
 2850.00, 'PENDING', 900.00, 'Tangier Airport', 'Tangier Airport',
 0.00, NULL, NULL,
 'u0000007-0000-0000-0000-000000000007',
 'car00008-0000-0000-0000-000000000008');

-- ============================================================
-- 10. CONTRACTS
-- ============================================================

INSERT INTO contracts
(id, contract_number, creation_date, start_date, end_date, status,
 total_amount, deposit_amount, payment_status, file_url, terms,
 signed_by_client, signed_by_agency, cancellation_reason, reservation_id)
VALUES
('con00001-0000-0000-0000-000000000001', 'CTR-2026-000001',
 '2026-06-10 08:30:00', '2026-06-10', '2026-06-14', 'EXPIRED',
 1280.00, 400.00, 'PAID', 'https://cdn.redr.test/contracts/CTR-2026-000001.pdf',
 'Le vehicule doit etre restitue dans le meme etat general et avec un niveau de carburant equivalent.',
 TRUE, TRUE, NULL,
 'res00001-0000-0000-0000-000000000001'),

('con00002-0000-0000-0000-000000000002', 'CTR-2026-000002',
 '2026-07-05 08:00:00', '2026-07-05', '2026-07-10', 'EXPIRED',
 1400.00, 500.00, 'PAID', 'https://cdn.redr.test/contracts/CTR-2026-000002.pdf',
 'Restitution a l heure prevue. Les frais supplementaires sont applicables en cas de retard.',
 TRUE, TRUE, NULL,
 'res00002-0000-0000-0000-000000000002'),

('con00003-0000-0000-0000-000000000003', 'CTR-2026-000003',
 '2026-08-20 08:45:00', '2026-08-20', '2026-08-25', 'ACTIVE',
 1950.00, 600.00, 'PARTIALLY_PAID', 'https://cdn.redr.test/contracts/CTR-2026-000003.pdf',
 'Kilometrage inclus selon la formule choisie. Tout kilometrage supplementaire est facture.',
 TRUE, TRUE, NULL,
 'res00003-0000-0000-0000-000000000003'),

('con00004-0000-0000-0000-000000000004', 'CTR-2026-000004',
 '2026-08-29 09:00:00', '2026-08-29', '2026-09-02', 'ACTIVE',
 1400.00, 500.00, 'PAID', 'https://cdn.redr.test/contracts/CTR-2026-000004.pdf',
 'Le vehicule doit etre restitue avec les accessoires fournis par agence.',
 TRUE, TRUE, NULL,
 'res00004-0000-0000-0000-000000000004'),

('con00005-0000-0000-0000-000000000005', 'CTR-2026-000005',
 '2026-07-15 09:00:00', '2026-07-15', '2026-07-20', 'CANCELLED',
 1950.00, 0.00, 'REFUNDED', 'https://cdn.redr.test/contracts/CTR-2026-000005.pdf',
 'Contrat annule avant le debut de la location.',
 FALSE, TRUE, 'Reservation annulee par le client.',
 'res00005-0000-0000-0000-000000000005'),

('con00006-0000-0000-0000-000000000006', 'CTR-2026-000006',
 '2026-08-30 09:00:00', '2026-08-30', '2026-09-03', 'ACTIVE',
 2392.00, 700.00, 'PARTIALLY_PAID', 'https://cdn.redr.test/contracts/CTR-2026-000006.pdf',
 'Le depot de garantie est restitue apres verification du vehicule.',
 TRUE, TRUE, NULL,
 'res00006-0000-0000-0000-000000000006'),

('con00007-0000-0000-0000-000000000007', 'CTR-2026-000007',
 '2026-08-12 08:30:00', '2026-08-12', '2026-08-16', 'EXPIRED',
 2600.00, 800.00, 'PAID', 'https://cdn.redr.test/contracts/CTR-2026-000007.pdf',
 'Les frais de retard sont calcules sur la base du tarif journalier.',
 TRUE, TRUE, NULL,
 'res00007-0000-0000-0000-000000000007');

-- ============================================================
-- 11. EXECUTIONS
-- ============================================================

INSERT INTO executions
(id, actual_return_time, actual_pickup_date, delay_in_days, status, reservation_id)
VALUES
(1, '2026-06-14 17:20:00', '2026-06-10 09:00:00', 0, 'CLOSED',
 'res00001-0000-0000-0000-000000000001'),

(2, '2026-07-10 11:00:00', '2026-07-05 10:00:00', 0, 'CLOSED',
 'res00002-0000-0000-0000-000000000002'),

(3, NULL, '2026-08-20 09:30:00', NULL, 'ONGOING',
 'res00003-0000-0000-0000-000000000003'),

(4, NULL, NULL, NULL, 'ONGOING',
 'res00004-0000-0000-0000-000000000004'),

(5, '2026-08-16 18:00:00', '2026-08-12 09:00:00', 0, 'CLOSED',
 'res00007-0000-0000-0000-000000000007');

-- ============================================================
-- 12. CONDITION REPORTS
-- ============================================================

INSERT INTO condition_reports
(id, report_number, date_environ, completed_at, comment, type,
 is_signed_by_customer, vehicle_status_before, vehicle_status_after,
 fuel_level_before, fuel_level_after, signature_url, reservation_id, car_id)
VALUES
(1, 'CR-2026-000001', '2026-06-10 08:50:00', '2026-06-10 09:05:00',
 'Etat general bon. Petite rayure deja presente sur la portiere arriere droite.',
 'PICKUP', TRUE, 'Available', 'Rented', 'FULL', 'FULL',
 'https://cdn.redr.test/signatures/reports/CR-2026-000001.png',
 'res00001-0000-0000-0000-000000000001',
 'car00001-0000-0000-0000-000000000001'),

(2, 'CR-2026-000002', '2026-06-14 17:00:00', '2026-06-14 17:25:00',
 'Vehicule restitue en bon etat. Niveau de carburant conforme.',
 'RETURN', TRUE, 'Rented', 'Available', 'FULL', 'THREE_QUARTERS',
 'https://cdn.redr.test/signatures/reports/CR-2026-000002.png',
 'res00001-0000-0000-0000-000000000001',
 'car00001-0000-0000-0000-000000000001'),

(3, 'CR-2026-000003', '2026-07-05 09:45:00', '2026-07-05 10:10:00',
 'Aucun dommage constate au depart.',
 'PICKUP', TRUE, 'Available', 'Rented', 'FULL', 'FULL',
 'https://cdn.redr.test/signatures/reports/CR-2026-000003.png',
 'res00002-0000-0000-0000-000000000002',
 'car00002-0000-0000-0000-000000000002'),

(4, 'CR-2026-000004', '2026-07-10 10:45:00', '2026-07-10 11:15:00',
 'Pare-chocs avant avec legere trace supplementaire. Verification effectuee.',
 'RETURN', TRUE, 'Rented', 'Available', 'FULL', 'HALF',
 'https://cdn.redr.test/signatures/reports/CR-2026-000004.png',
 'res00002-0000-0000-0000-000000000002',
 'car00002-0000-0000-0000-000000000002'),

(5, 'CR-2026-000005', '2026-08-20 09:20:00', '2026-08-20 09:35:00',
 'Vehicule neuf, aucun dommage visible au depart.',
 'PICKUP', TRUE, 'Available', 'Rented', 'FULL', 'FULL',
 'https://cdn.redr.test/signatures/reports/CR-2026-000005.png',
 'res00003-0000-0000-0000-000000000003',
 'car00003-0000-0000-0000-000000000003'),

(6, 'CR-2026-000006', '2026-08-12 08:45:00', '2026-08-12 09:15:00',
 'Etat excellent au depart.',
 'PICKUP', TRUE, 'Available', 'Rented', 'FULL', 'FULL',
 'https://cdn.redr.test/signatures/reports/CR-2026-000006.png',
 'res00007-0000-0000-0000-000000000007',
 'car00008-0000-0000-0000-000000000008'),

(7, 'CR-2026-000007', '2026-08-16 17:30:00', '2026-08-16 18:15:00',
 'Retard de restitution et niveau de carburant a moitie. Aucun dommage majeur.',
 'RETURN', TRUE, 'Rented', 'Available', 'FULL', 'HALF',
 'https://cdn.redr.test/signatures/reports/CR-2026-000007.png',
 'res00007-0000-0000-0000-000000000007',
 'car00008-0000-0000-0000-000000000008');

-- ============================================================
-- 13. PHOTOS
-- ============================================================

INSERT INTO photos
(id, url, secure_url, public_id, description, created_at, updated_at, deleted_at,
 car_id, condition_report_id)
VALUES
('pho00001-0000-0000-0000-000000000001',
 'http://cdn.redr.test/cars/car00001/front.jpg',
 'https://cdn.redr.test/cars/car00001/front.jpg',
 'cars/car00001/front', 'Vue avant du vehicule',
 '2026-06-01 09:00:00', '2026-06-01 09:00:00', NULL,
 'car00001-0000-0000-0000-000000000001', NULL),

('pho00002-0000-0000-0000-000000000002',
 'http://cdn.redr.test/cars/car00001/rear.jpg',
 'https://cdn.redr.test/cars/car00001/rear.jpg',
 'cars/car00001/rear', 'Vue arriere du vehicule',
 '2026-06-01 09:05:00', '2026-06-01 09:05:00', NULL,
 'car00001-0000-0000-0000-000000000001', NULL),

('pho00003-0000-0000-0000-000000000003',
 'http://cdn.redr.test/reports/CR-2026-000001/front-left.jpg',
 'https://cdn.redr.test/reports/CR-2026-000001/front-left.jpg',
 'reports/CR-2026-000001/front-left', 'Rayure presente avant location',
 '2026-06-10 09:05:00', '2026-06-10 09:05:00', NULL,
 'car00001-0000-0000-0000-000000000001', 1),

('pho00004-0000-0000-0000-000000000004',
 'http://cdn.redr.test/cars/car00003/front.jpg',
 'https://cdn.redr.test/cars/car00003/front.jpg',
 'cars/car00003/front', 'Vue avant du Duster',
 '2026-07-10 09:00:00', '2026-07-10 09:00:00', NULL,
 'car00003-0000-0000-0000-000000000003', NULL),

('pho00005-0000-0000-0000-000000000005',
 'http://cdn.redr.test/cars/car00008/interior.jpg',
 'https://cdn.redr.test/cars/car00008/interior.jpg',
 'cars/car00008/interior', 'Interieur cuir',
 '2026-08-10 10:15:00', '2026-08-10 10:15:00', NULL,
 'car00008-0000-0000-0000-000000000008', NULL),

('pho00006-0000-0000-0000-000000000006',
 'http://cdn.redr.test/reports/CR-2026-000007/fuel.jpg',
 'https://cdn.redr.test/reports/CR-2026-000007/fuel.jpg',
 'reports/CR-2026-000007/fuel', 'Niveau de carburant au retour',
 '2026-08-16 18:10:00', '2026-08-16 18:10:00', NULL,
 'car00008-0000-0000-0000-000000000008', 7);

-- ============================================================
-- 14. PAYMENTS
-- ============================================================

INSERT INTO payments
(id, type, status, date_envoi, amount, reservation_id, client_id,
 created_at, updated_at, deleted_at)
VALUES
('pay00001-0000-0000-0000-000000000001', 'CARD', 'SUCCESS',
 '2026-06-02 10:20:00', 400.00,
 'res00001-0000-0000-0000-000000000001',
 'u0000005-0000-0000-0000-000000000005',
 '2026-06-02 10:20:00', '2026-06-02 10:20:00', NULL),

('pay00002-0000-0000-0000-000000000002', 'CARD', 'SUCCESS',
 '2026-06-10 08:00:00', 880.00,
 'res00001-0000-0000-0000-000000000001',
 'u0000005-0000-0000-0000-000000000005',
 '2026-06-10 08:00:00', '2026-06-10 08:00:00', NULL),

('pay00003-0000-0000-0000-000000000003', 'CARD', 'SUCCESS',
 '2026-06-28 14:35:00', 500.00,
 'res00002-0000-0000-0000-000000000002',
 'u0000006-0000-0000-0000-000000000006',
 '2026-06-28 14:35:00', '2026-06-28 14:35:00', NULL),

('pay00004-0000-0000-0000-000000000004', 'CASH', 'SUCCESS',
 '2026-07-05 09:50:00', 900.00,
 'res00002-0000-0000-0000-000000000002',
 'u0000006-0000-0000-0000-000000000006',
 '2026-07-05 09:50:00', '2026-07-05 09:50:00', NULL),

('pay00005-0000-0000-0000-000000000005', 'CARD', 'SUCCESS',
 '2026-08-05 09:15:00', 600.00,
 'res00003-0000-0000-0000-000000000003',
 'u0000007-0000-0000-0000-000000000007',
 '2026-08-05 09:15:00', '2026-08-05 09:15:00', NULL),

('pay00006-0000-0000-0000-000000000006', 'CARD', 'SUCCESS',
 '2026-08-20 09:00:00', 500.00,
 'res00004-0000-0000-0000-000000000004',
 'u0000008-0000-0000-0000-000000000008',
 '2026-08-20 09:00:00', '2026-08-20 09:00:00', NULL),

('pay00007-0000-0000-0000-000000000007', 'CARD', 'REFUNDED',
 '2026-07-01 12:05:00', 500.00,
 'res00005-0000-0000-0000-000000000005',
 'u0000009-0000-0000-0000-000000000009',
 '2026-07-01 12:05:00', '2026-07-12 10:00:00', NULL),

('pay00008-0000-0000-0000-000000000008', 'CARD', 'SUCCESS',
 '2026-08-22 13:05:00', 700.00,
 'res00006-0000-0000-0000-000000000006',
 'u0000005-0000-0000-0000-000000000005',
 '2026-08-22 13:05:00', '2026-08-22 13:05:00', NULL),

('pay00009-0000-0000-0000-000000000009', 'CARD', 'SUCCESS',
 '2026-08-01 09:35:00', 800.00,
 'res00007-0000-0000-0000-000000000007',
 'u0000006-0000-0000-0000-000000000006',
 '2026-08-01 09:35:00', '2026-08-01 09:35:00', NULL),

('pay00010-0000-0000-0000-000000000010', 'CARD', 'SUCCESS',
 '2026-08-12 08:35:00', 1800.00,
 'res00007-0000-0000-0000-000000000007',
 'u0000006-0000-0000-0000-000000000006',
 '2026-08-12 08:35:00', '2026-08-12 08:35:00', NULL);

-- ============================================================
-- 15. NOTIFICATIONS
-- ============================================================

INSERT INTO notifications
(id, type, contenu, date_envoi, statut, user_id, created_at, updated_at, deleted_at)
VALUES
('not00001-0000-0000-0000-000000000001', 'RESERVATION_CONFIRMED',
 'Votre reservation RES-000003 a ete confirmee.',
 '2026-08-05 09:20:00', 'DELIVERED',
 'u0000007-0000-0000-0000-000000000007',
 '2026-08-05 09:20:00', '2026-08-05 09:25:00', NULL),

('not00002-0000-0000-0000-000000000002', 'PAYMENT_RECEIVED',
 'Votre paiement de 600.00 MAD a ete confirme.',
 '2026-08-05 09:16:00', 'DELIVERED',
 'u0000007-0000-0000-0000-000000000007',
 '2026-08-05 09:16:00', '2026-08-05 09:20:00', NULL),

('not00003-0000-0000-0000-000000000003', 'RETURN_REMINDER',
 'Rappel: votre vehicule doit etre restitue le 25/08/2026.',
 '2026-08-24 09:00:00', 'SENT',
 'u0000007-0000-0000-0000-000000000007',
 '2026-08-24 09:00:00', '2026-08-24 09:00:00', NULL),

('not00004-0000-0000-0000-000000000004', 'MAINTENANCE_ALERT',
 'Le vehicule Sandero est actuellement en maintenance.',
 '2026-08-20 08:15:00', 'DELIVERED',
 'u0000004-0000-0000-0000-000000000004',
 '2026-08-20 08:15:00', '2026-08-20 08:20:00', NULL),

('not00005-0000-0000-0000-000000000005', 'SYSTEM_MAINTENANCE',
 'Une maintenance systeme est planifiee le 30/08/2026.',
 '2026-08-27 09:00:00', 'SENT',
 'u0000001-0000-0000-0000-000000000001',
 '2026-08-27 09:00:00', '2026-08-27 09:00:00', NULL),

('not00006-0000-0000-0000-000000000006', 'ACCOUNT_VERIFICATION',
 'Veuillez verifier votre adresse email pour activer votre compte.',
 '2026-05-20 15:31:00', 'PENDING',
 'u0000010-0000-0000-0000-000000000010',
 '2026-05-20 15:31:00', '2026-05-20 15:31:00', NULL);

-- ============================================================
-- 16. SYSTEM MAINTENANCE
-- ============================================================

INSERT INTO system_maintenance
(id, start_date_time, end_date_time, status, type, description, reason,
 agencies_notified, notification_sent_at, notification_days_before)
VALUES
(1, '2026-08-30 02:00:00', '2026-08-30 03:00:00', 'PLANNED',
 'DATABASE_UPDATE', 'Mise a jour du schema et optimisation des index.',
 'Amelioration des performances de la base de donnees.',
 TRUE, '2026-08-27 09:00:00', 3),

(2, '2026-07-12 01:00:00', '2026-07-12 01:30:00', 'COMPLETED',
 'BACKUP', 'Sauvegarde complete de la base REDr.',
 'Procedure de sauvegarde hebdomadaire.',
 TRUE, '2026-07-09 09:00:00', 3),

(3, '2026-09-05 02:00:00', '2026-09-05 02:30:00', 'PLANNED',
 'SECURITY_PATCH', 'Application dun correctif de securite.',
 'Mise a jour preventive des composants serveur.',
 FALSE, NULL, 3);

-- ============================================================
-- 17. EMAIL VERIFICATION TOKENS
-- ============================================================

INSERT INTO email_verification_token
(id, token, email, expires_at, used_at, created_at)
VALUES
('tok00001-0000-0000-0000-000000000001',
 '8b9f4d0e2a1c4f5e9b7d6a3c1e8f2041',
 'amine.chraibi@redr.test',
 '2026-03-05 10:45:00', '2026-03-05 08:45:00', '2026-03-05 08:45:00'),

('tok00002-0000-0000-0000-000000000002',
 '1c7a9e4b6d2f8a0e3b5c9d1f7a2e6b40',
 'imane.berrada@redr.test',
 '2026-03-12 11:45:00', '2026-03-12 09:45:00', '2026-03-12 09:45:00'),

('tok00003-0000-0000-0000-000000000003',
 '7e2a5c9f1b4d8e6a3c0f2b7d9e1a5c84',
 'mehdi.zerouali@redr.test',
 '2026-04-01 13:45:00', '2026-04-01 11:45:00', '2026-04-01 11:45:00'),

('tok00004-0000-0000-0000-000000000004',
 '4f8a2c6e1d9b3a7f5c0e2d8b6a1f9c35',
 'sara.aitlahcen@redr.test',
 '2026-04-08 16:45:00', '2026-04-08 14:45:00', '2026-04-08 14:45:00'),

('tok00005-0000-0000-0000-000000000005',
 '9a3e7c1f5b8d2e6a4c0f9b7d1e5a3c82',
 'nadia.amrani@redr.test',
 '2026-05-02 10:45:00', '2026-05-02 08:45:00', '2026-05-02 08:45:00'),

('tok00006-0000-0000-0000-000000000006',
 '2d6f9a4c8b1e5a7d3c0f6b2e9a4d8c17',
 'rachid.fassi@redr.test',
 '2026-05-21 15:30:00', NULL, '2026-05-20 15:30:00');

COMMIT;

-- ============================================================
-- QUICK VERIFICATION
-- ============================================================

SELECT 'users' AS table_name, COUNT(*) AS row_count FROM users
UNION ALL SELECT 'admins', COUNT(*) FROM admins
UNION ALL SELECT 'agencies', COUNT(*) FROM agencies
UNION ALL SELECT 'agency_managers', COUNT(*) FROM agency_managers
UNION ALL SELECT 'clients', COUNT(*) FROM clients
UNION ALL SELECT 'categories', COUNT(*) FROM categories
UNION ALL SELECT 'cars', COUNT(*) FROM cars
UNION ALL SELECT 'car_fuel_types', COUNT(*) FROM car_fuel_types
UNION ALL SELECT 'reservations', COUNT(*) FROM reservations
UNION ALL SELECT 'contracts', COUNT(*) FROM contracts
UNION ALL SELECT 'executions', COUNT(*) FROM executions
UNION ALL SELECT 'condition_reports', COUNT(*) FROM condition_reports
UNION ALL SELECT 'photos', COUNT(*) FROM photos
UNION ALL SELECT 'payments', COUNT(*) FROM payments
UNION ALL SELECT 'notifications', COUNT(*) FROM notifications
UNION ALL SELECT 'system_maintenance', COUNT(*) FROM system_maintenance
UNION ALL SELECT 'email_verification_token', COUNT(*) FROM email_verification_token;
