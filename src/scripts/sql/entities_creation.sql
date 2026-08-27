-- ============================================================
-- REDR PLATFORM - DATABASE SCRIPT
-- MySQL 8+
-- ============================================================

CREATE DATABASE IF NOT EXISTS redr_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE redr_db;


-- ============================================================
-- 1. USERS
-- AppUser.java
-- Parent table for Client, AgencyManager and Admin
-- ============================================================

CREATE TABLE users (
    id VARCHAR(36) NOT NULL,

    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    password_updated_at DATETIME NULL,

    inscription_date DATETIME NULL,

    role ENUM(
        'CLIENT',
        'AGENCY_MANAGER',
        'SUPER_ADMIN'
    ) NOT NULL,

    account_status ENUM(
        'ACTIVE',
        'PENDING',
        'SUSPENDED',
        'LOCKED',
        'DELETED'
    ) NOT NULL DEFAULT 'PENDING',

    failed_login_attempts INT NOT NULL DEFAULT 0,
    lock_until DATETIME NULL,
    email_verified_at DATETIME NULL,

    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,

    user_type VARCHAR(31) NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


-- ============================================================
-- 2. ADMINS
-- Admin.java
-- JOINED inheritance
-- ============================================================

CREATE TABLE admins (
    id VARCHAR(36) NOT NULL,

    permissions VARCHAR(255) NULL,
    admin_level INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_admin_user
        FOREIGN KEY (id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 3. AGENCIES
-- Agency.java
-- ============================================================

CREATE TABLE agencies (
    id VARCHAR(36) NOT NULL,

    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NULL,

    phone VARCHAR(255) UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,

    status ENUM(
        'PENDING',
        'APPROVED',
        'SUSPENDED',
        'REJECTED',
        'CLOSED'
    ) NOT NULL DEFAULT 'PENDING',


    approval_date DATETIME NULL,
    inscription_date DATETIME NULL,

    rating FLOAT NULL,

    logo_url VARCHAR(255) NULL,
    iban VARCHAR(255) NULL,

    description VARCHAR(255) NULL,
    address VARCHAR(255) NULL,

    suspension_reason VARCHAR(255) NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


-- ============================================================
-- 4. AGENCY MANAGERS
-- AgencyManager.java
-- ============================================================

CREATE TABLE agency_managers (
    id VARCHAR(36) NOT NULL,

    phone VARCHAR(255) NULL UNIQUE,
    national_id VARCHAR(255) NULL UNIQUE,
    digital_signature VARCHAR(255) NULL,

    responsability_level INT NOT NULL,

    licence_number VARCHAR(255) NULL UNIQUE,

    approved_at DATETIME NULL,
    approved_by_admin_id VARCHAR(36) NULL,

    rejection_reason VARCHAR(255) NULL,

    agency_id VARCHAR(36) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_manager_user
        FOREIGN KEY (id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_manager_agency
        FOREIGN KEY (agency_id)
        REFERENCES agencies(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 5. CLIENTS
-- Client.java
-- ============================================================

CREATE TABLE clients (
    id VARCHAR(36) NOT NULL,

    licence_number VARCHAR(255) NULL UNIQUE,

    licence_expiration_date DATE NULL,

    national_id VARCHAR(255) NULL UNIQUE,
    passport_number VARCHAR(255) NULL UNIQUE,

    phone VARCHAR(255) NULL UNIQUE,
    digital_signature VARCHAR(255) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_client_user
        FOREIGN KEY (id)
        REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 6. CATEGORIES
-- Category.java
-- ============================================================

CREATE TABLE categories (
    id VARCHAR(36) NOT NULL,

    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,

    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


-- ============================================================
-- 7. CARS
-- Car.java
-- ============================================================

CREATE TABLE cars (
    id VARCHAR(36) NOT NULL,

    model VARCHAR(255) NULL,
    brand VARCHAR(255) NULL,

    manufacture_year INT NULL,

    transmission_type ENUM(
        'MANUAL',
        'AUTOMATIC'
    ) NULL,

    mileage INT NULL,

    current_status ENUM(
        'Available',
        'AvailableSoon',
        'Reserved',
        'Rented',
        'Maintenance',
        'OutOfService',
        'Expired'
    ) NOT NULL DEFAULT 'Available',

    daily_price DECIMAL(19,2) NULL,
    weekly_price DECIMAL(19,2) NULL,
    monthly_price DECIMAL(19,2) NULL,

    promotion_active BOOLEAN NULL,
    promotion_rate DECIMAL(5,2) NULL,

    promotion_start_date DATE NULL,
    promotion_end_date DATE NULL,

    condition_status ENUM(
        'EXCELLENT',
        'GOOD',
        'FAIR',
        'NEEDS_REPAIR',
        'DAMAGED'
    ) NULL,

    license_expiry_date DATE NULL,
    insurance_expiry_date DATE NULL,

    registration_number VARCHAR(255) NULL,
    insurance_policy_number VARCHAR(255) NULL,

    average_rating DECIMAL(3,2) NULL,

    seat_capacity INT NULL,

    technical_notes VARCHAR(4000) NULL,
    description VARCHAR(4000) NULL,

    agencies_notified BOOLEAN NULL,
    notification_sent_at DATETIME NULL,
    notification_days_before INT NULL,

    agency_id VARCHAR(36) NULL,
    category_id VARCHAR(36) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_car_agency
        FOREIGN KEY (agency_id)
        REFERENCES agencies(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_car_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 8. CAR FUEL TYPES
-- @ElementCollection from Car.java
-- ============================================================

CREATE TABLE car_fuel_types (
    car_id VARCHAR(36) NOT NULL,

    fuel_type ENUM(
        'GASOLINE',
        'DIESEL',
        'ELECTRIC',
        'HYBRID'
    ) NOT NULL,

    PRIMARY KEY (car_id, fuel_type),

    CONSTRAINT fk_fuel_car
        FOREIGN KEY (car_id)
        REFERENCES cars(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 9. RESERVATIONS
-- Reservation.java
-- ============================================================

CREATE TABLE reservations (
    id VARCHAR(36) NOT NULL,

    start_date DATE NULL,
    end_date DATE NULL,

    creation_date DATETIME NULL,
    completed_at DATETIME NULL,

    total_amount DECIMAL(19,2) NULL,

    status ENUM(
        'PENDING',
        'CONFIRMED',
        'CANCELLED',
        'COMPLETED'
    ) NOT NULL DEFAULT 'PENDING',

    deposit_amount DECIMAL(19,2) NULL,

    pickup_location VARCHAR(255) NULL,
    return_location VARCHAR(255) NULL,

    late_return_fee DECIMAL(19,2) NULL,

    cancellation_reason VARCHAR(255) NULL,

    actual_return_time DATETIME NULL,

    client_id VARCHAR(36) NULL,
    car_id VARCHAR(36) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_reservation_client
        FOREIGN KEY (client_id)
        REFERENCES clients(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_reservation_car
        FOREIGN KEY (car_id)
        REFERENCES cars(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 10. CONTRACTS
-- Contract.java
-- ============================================================

CREATE TABLE contracts (
    id VARCHAR(36) NOT NULL,

    contract_number VARCHAR(255) NULL UNIQUE,

    creation_date DATETIME NULL,

    start_date DATE NULL,
    end_date DATE NULL, 

    status ENUM(
        'ACTIVE',
        'CANCELLED',
        'EXPIRED'
    ) NOT NULL DEFAULT 'ACTIVE',

    total_amount DECIMAL(19,2) NULL,
    deposit_amount DECIMAL(19,2) NULL,

    payment_status VARCHAR(255) NULL,

    file_url VARCHAR(255) NULL,

    terms VARCHAR(4000) NULL,

    signed_by_client BOOLEAN NULL,
    signed_by_agency BOOLEAN NULL,

    cancellation_reason VARCHAR(255) NULL,

    reservation_id VARCHAR(36) NULL UNIQUE,

    PRIMARY KEY (id),

    CONSTRAINT fk_contract_reservation
        FOREIGN KEY (reservation_id)
        REFERENCES reservations(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 11. EXECUTIONS
-- Execution.java
-- ============================================================

CREATE TABLE executions (
    id BIGINT NOT NULL AUTO_INCREMENT,

    actual_return_time DATETIME NULL,
    actual_pickup_date DATETIME NULL,

    delay_in_days INT NULL,

    status ENUM(
        'ONGOING',
        'COMPLETED',
        'DISPUTED',
        'CLOSED'
    ) NOT NULL DEFAULT 'ONGOING',

    reservation_id VARCHAR(36) NULL UNIQUE,

    PRIMARY KEY (id),

    CONSTRAINT fk_execution_reservation
        FOREIGN KEY (reservation_id)
        REFERENCES reservations(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 12. CONDITION REPORTS
-- ConditionReport.java
-- ============================================================

CREATE TABLE condition_reports (
    id INT NOT NULL AUTO_INCREMENT,

    report_number VARCHAR(255) NULL,

    date_environ DATETIME NULL,
    completed_at DATETIME NULL,

    comment VARCHAR(4000) NULL,

    type ENUM(
        'PICKUP',
        'RETURN',
        'INTERNAL',
        'ACCIDENT'
    ) NULL,

    is_signed_by_customer BOOLEAN NULL,

    vehicle_status_before ENUM(
        'Available',
        'AvailableSoon',
        'Reserved',
        'Rented',
        'Maintenance',
        'OutOfService',
        'Expired'
    ) NULL,

    vehicle_status_after ENUM(
        'Available',
        'AvailableSoon',
        'Reserved',
        'Rented',
        'Maintenance',
        'OutOfService',
        'Expired'
    ) NULL,

    fuel_level_before ENUM(
        'FULL',
        'THREE_QUARTERS',
        'HALF',
        'QUARTER',
        'EMPTY'
    ) NULL,

    fuel_level_after ENUM(
        'FULL',
        'THREE_QUARTERS',
        'HALF',
        'QUARTER',
        'EMPTY'
    ) NULL,

    signature_url VARCHAR(255) NULL,

    reservation_id VARCHAR(36) NULL,
    car_id VARCHAR(36) NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_report_reservation
        FOREIGN KEY (reservation_id)
        REFERENCES reservations(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_report_car
        FOREIGN KEY (car_id)
        REFERENCES cars(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 13. PHOTOS
-- Photo.java
-- ============================================================

CREATE TABLE photos (
    id VARCHAR(36) NOT NULL,

    url VARCHAR(255) NULL,
    secure_url VARCHAR(255) NULL,
    public_id VARCHAR(255) NULL,
    description VARCHAR(255) NULL,

    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,

    car_id VARCHAR(36) NULL,
    condition_report_id INT NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_photo_car
        FOREIGN KEY (car_id)
        REFERENCES cars(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_photo_condition_report
        FOREIGN KEY (condition_report_id)
        REFERENCES condition_reports(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 14. PAYMENTS
-- Payment.java
-- ============================================================

CREATE TABLE payments (
    id VARCHAR(36) NOT NULL,

    type VARCHAR(255) NULL,

    status ENUM(
        'PENDING',
        'SUCCESS',
        'FAILED',
        'CANCELLED',
        'REFUNDED'
    ) NULL DEFAULT 'PENDING',

    date_envoi DATETIME NULL,

    amount DECIMAL(19,2) NULL,

    reservation_id VARCHAR(36) NULL,
    client_id VARCHAR(36) NULL,

    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_payment_reservation
        FOREIGN KEY (reservation_id)
        REFERENCES reservations(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_payment_client
        FOREIGN KEY (client_id)
        REFERENCES clients(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 15. NOTIFICATIONS
-- Notification.java
-- ============================================================

CREATE TABLE notifications (
    id VARCHAR(36) NOT NULL,

    type VARCHAR(255) NULL,

    contenu VARCHAR(4000) NULL,

    date_envoi DATETIME NULL,

    statut ENUM(
        'PENDING',
        'SENT',
        'DELIVERED',
        'FAILED'
    ) NULL DEFAULT 'PENDING',

    user_id VARCHAR(36) NULL,

    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,

    PRIMARY KEY (id),

    CONSTRAINT fk_notification_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ============================================================
-- 16. SYSTEM MAINTENANCE
-- SystemMaintenance.java
-- ============================================================

CREATE TABLE system_maintenance (
    id BIGINT NOT NULL AUTO_INCREMENT,

    start_date_time DATETIME NULL,
    end_date_time DATETIME NULL,

    status ENUM(
        'PLANNED',
        'IN_PROGRESS',
        'COMPLETED',
        'CANCELLED'
    ) NOT NULL DEFAULT 'PLANNED',

    type ENUM(
        'DATABASE_UPDATE',
        'SERVER_RESTART',
        'SECURITY_PATCH',
        'BACKUP',
        'CERTIFICATE_RENEW',
        'DEPLOYMENT'
    ) NULL,

    description VARCHAR(255) NULL,
    reason VARCHAR(255) NULL,

    agencies_notified BOOLEAN NULL,
    notification_sent_at DATETIME NULL,
    notification_days_before INT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


-- ============================================================
-- 17. EMAIL VERIFICATION TOKENS
-- EmailVerificationToken.java
-- ============================================================

CREATE TABLE email_verification_token (
    id CHAR(36) NOT NULL,

    token VARCHAR(255) NOT NULL UNIQUE,

    email VARCHAR(255) NOT NULL,

    expires_at DATETIME NOT NULL,

    used_at DATETIME NULL,

    created_at DATETIME NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;


-- ============================================================
-- INDEXES
-- ============================================================

CREATE INDEX idx_cars_agency
    ON cars(agency_id);

CREATE INDEX idx_cars_category
    ON cars(category_id);

CREATE INDEX idx_cars_status
    ON cars(current_status);

CREATE INDEX idx_reservations_client
    ON reservations(client_id);

CREATE INDEX idx_reservations_car
    ON reservations(car_id);

CREATE INDEX idx_reservations_dates
    ON reservations(start_date, end_date);

CREATE INDEX idx_payments_client
    ON payments(client_id);

CREATE INDEX idx_payments_reservation
    ON payments(reservation_id);

CREATE INDEX idx_notifications_user
    ON notifications(user_id);

CREATE INDEX idx_condition_reports_car
    ON condition_reports(car_id);

CREATE INDEX idx_condition_reports_reservation
    ON condition_reports(reservation_id);

CREATE INDEX idx_photos_car
    ON photos(car_id);

CREATE INDEX idx_photos_condition_report
    ON photos(condition_report_id);

CREATE INDEX idx_managers_agency
    ON agency_managers(agency_id);

CREATE INDEX idx_email_verification_email
    ON email_verification_token(email);

CREATE INDEX idx_email_verification_expires
    ON email_verification_token(expires_at);