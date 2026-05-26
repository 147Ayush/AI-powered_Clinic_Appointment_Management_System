-- ============================================================
-- AI Clinic Appointment Management System
-- Database: hospital_ai
-- ============================================================

CREATE DATABASE IF NOT EXISTS hospital_ai
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE hospital_ai;

-- ============================================================
-- TABLE: patients
-- (No dependencies — created first)
-- ============================================================
CREATE TABLE patients (
    patient_id    INT            NOT NULL AUTO_INCREMENT,
    full_name     VARCHAR(100)   NOT NULL,
    email         VARCHAR(150)   NOT NULL,
    phone         VARCHAR(20)    NULL,
    date_of_birth DATE           NULL,
    gender        ENUM('male','female','other') NULL,
    created_at    TIMESTAMP      NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (patient_id),
    UNIQUE KEY uq_patients_email (email),
    INDEX idx_patients_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: doctors
-- (No dependencies — created before appointments)
-- ============================================================
CREATE TABLE doctors (
    doctor_id               INT           NOT NULL AUTO_INCREMENT,
    doctor_name             VARCHAR(100)  NOT NULL,
    specialization          VARCHAR(100)  NULL,
    department              VARCHAR(100)  NULL,
    email                   VARCHAR(150)  NULL,
    phone                   VARCHAR(20)   NULL,
    consultation_duration   INT           NULL DEFAULT 30,
    available_from          TIME          NULL,
    available_to            TIME          NULL,
    max_patients_per_day    INT           NULL DEFAULT 20,
    is_active               TINYINT(1)    NULL DEFAULT 1,
    created_at              TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (doctor_id),
    INDEX idx_doctors_department     (department),
    INDEX idx_doctors_specialization (specialization),
    INDEX idx_doctors_is_active      (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: appointments
-- (Depends on: patients, doctors)
-- ============================================================
CREATE TABLE appointments (
    appointment_id      INT           NOT NULL AUTO_INCREMENT,
    patient_id          INT           NOT NULL,
    doctor_id           INT           NOT NULL,
    appointment_date    DATE          NOT NULL,
    appointment_start   DATETIME      NOT NULL,
    appointment_end     DATETIME      NOT NULL,
    appointment_type    VARCHAR(50)   NULL,
    reason              TEXT          NULL,
    triage_level        ENUM('routine','urgent','emergency') NULL DEFAULT 'routine',
    status              ENUM('scheduled','confirmed','checked_in','completed','cancelled','no_show') NULL DEFAULT 'scheduled',
    booking_source      VARCHAR(50)   NULL DEFAULT 'ai_chatbot',
    created_at          TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (appointment_id),
    UNIQUE KEY uq_appointments_doctor_slot  (doctor_id, appointment_start),
    INDEX idx_appointments_patient_id       (patient_id),
    INDEX idx_appointments_doctor_date      (doctor_id, appointment_date),
    INDEX idx_appointments_status           (status),

    CONSTRAINT fk_appointments_patient
        FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,

    CONSTRAINT fk_appointments_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: ai_conversations
-- (Depends on: patients)
-- ============================================================
CREATE TABLE ai_conversations (
    conversation_id INT           NOT NULL AUTO_INCREMENT,
    patient_id      INT           NULL,
    session_id      VARCHAR(255)  NULL,
    user_message    TEXT          NULL,
    ai_response     TEXT          NULL,
    created_at      TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (conversation_id),
    INDEX idx_ai_conversations_patient_id (patient_id),

    CONSTRAINT fk_ai_conversations_patient
        FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: appointment_otps
-- (No foreign key constraints defined)
-- ============================================================
CREATE TABLE appointment_otps (
    otp_id               INT           NOT NULL AUTO_INCREMENT,
    action_type          ENUM('booking','cancel_appointment','reschedule_appointment') NULL DEFAULT 'booking',
    session_id           VARCHAR(255)  NULL,
    email                VARCHAR(150)  NOT NULL,
    otp_code             VARCHAR(10)   NOT NULL,
    patient_id           INT           NULL,
    appointment_id       INT           NULL,
    doctor_id            INT           NULL,
    new_doctor_id        INT           NULL,
    appointment_date     DATE          NULL,
    new_appointment_date DATE          NULL,
    appointment_time     VARCHAR(10)   NULL,
    new_appointment_time VARCHAR(10)   NULL,
    reason               TEXT          NULL,
    expires_at           DATETIME      NOT NULL,
    is_verified          TINYINT(1)    NULL DEFAULT 0,
    created_at           TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP,
    patient_name         VARCHAR(100)  NULL,
    phone                VARCHAR(20)   NULL,
    department           VARCHAR(100)  NULL,
    doctor_name          VARCHAR(100)  NULL,
    new_doctor_name      VARCHAR(150)  NULL,

    PRIMARY KEY (otp_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: appointment_status_history
-- (Depends on: appointments)
-- ============================================================
CREATE TABLE appointment_status_history (
    history_id      INT          NOT NULL AUTO_INCREMENT,
    appointment_id  INT          NOT NULL,
    old_status      VARCHAR(50)  NULL,
    new_status      VARCHAR(50)  NULL,
    changed_by      VARCHAR(50)  NULL DEFAULT 'system',
    changed_at      TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (history_id),
    INDEX idx_status_history_appointment_id (appointment_id),

    CONSTRAINT fk_status_history_appointment
        FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: doctor_schedule
-- (Depends on: doctors)
-- ============================================================
CREATE TABLE doctor_schedule (
    schedule_id  INT          NOT NULL AUTO_INCREMENT,
    doctor_id    INT          NOT NULL,
    day_of_week  ENUM('monday','tuesday','wednesday','thursday','friday','saturday','sunday') NOT NULL,
    start_time   TIME         NOT NULL,
    end_time     TIME         NOT NULL,
    is_available TINYINT(1)   NULL DEFAULT 1,
    created_at   TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (schedule_id),
    INDEX idx_doctor_schedule_doctor_id (doctor_id),

    CONSTRAINT fk_doctor_schedule_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- TABLE: doctor_unavailability
-- (Depends on: doctors)
-- ============================================================
CREATE TABLE doctor_unavailability (
    unavailable_id   INT          NOT NULL AUTO_INCREMENT,
    doctor_id        INT          NOT NULL,
    unavailable_date DATE         NOT NULL,
    start_time       TIME         NOT NULL,
    end_time         TIME         NOT NULL,
    reason           VARCHAR(255) NULL,
    created_at       TIMESTAMP    NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (unavailable_id),
    INDEX idx_doctor_unavailability_doctor_id (doctor_id),

    CONSTRAINT fk_doctor_unavailability_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ============================================================
-- END OF SCHEMA
-- ============================================================
