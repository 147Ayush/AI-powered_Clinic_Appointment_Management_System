-- ============================================================
-- AI Clinic Appointment Management System
-- Sample Data: hospital_ai
-- ============================================================

USE hospital_ai;

-- ============================================================
-- PATIENTS (10 records)
-- ============================================================
INSERT INTO patients (full_name, email, phone, date_of_birth, gender) VALUES
('Aarav Sharma',     'aarav.sharma@gmail.com',     '9876543210', '1990-04-15', 'male'),
('Priya Mehta',      'priya.mehta@gmail.com',      '9823456781', '1985-08-22', 'female'),
('Rohan Verma',      'rohan.verma@gmail.com',       '9712345678', '1995-11-03', 'male'),
('Sneha Patel',      'sneha.patel@gmail.com',       '9634567890', '2000-02-17', 'female'),
('Vikram Nair',      'vikram.nair@gmail.com',       '9545678901', '1978-06-30', 'male'),
('Ananya Iyer',      'ananya.iyer@gmail.com',       '9456789012', '1992-09-12', 'female'),
('Karan Gupta',      'karan.gupta@gmail.com',       '9367890123', '1988-12-05', 'male'),
('Divya Reddy',      'divya.reddy@gmail.com',       '9278901234', '1997-03-28', 'female'),
('Arjun Singh',      'arjun.singh@gmail.com',       '9189012345', '1975-07-19', 'male'),
('Meera Joshi',      'meera.joshi@gmail.com',       '9090123456', '2002-01-08', 'female');


-- ============================================================
-- DOCTORS (10 records)
-- ============================================================
INSERT INTO doctors (doctor_name, specialization, department, email, phone, consultation_duration, available_from, available_to, max_patients_per_day, is_active) VALUES
('Dr. Rajesh Kumar',    'Cardiologist',         'Cardiology',        'rajesh.kumar@clinic.com',    '9011223344', 30, '09:00:00', '17:00:00', 20, 1),
('Dr. Sunita Sharma',   'Dermatologist',        'Dermatology',       'sunita.sharma@clinic.com',   '9022334455', 20, '10:00:00', '18:00:00', 24, 1),
('Dr. Anil Mehta',      'Orthopedic Surgeon',   'Orthopedics',       'anil.mehta@clinic.com',      '9033445566', 45, '08:00:00', '16:00:00', 16, 1),
('Dr. Kavitha Nair',    'Neurologist',          'Neurology',         'kavitha.nair@clinic.com',     '9044556677', 30, '09:00:00', '17:00:00', 20, 1),
('Dr. Pradeep Iyer',    'Pediatrician',         'Pediatrics',        'pradeep.iyer@clinic.com',     '9055667788', 20, '10:00:00', '16:00:00', 18, 1),
('Dr. Lakshmi Reddy',   'Gynecologist',         'Gynecology',        'lakshmi.reddy@clinic.com',    '9066778899', 30, '09:00:00', '15:00:00', 16, 1),
('Dr. Suresh Gupta',    'General Physician',    'General Medicine',  'suresh.gupta@clinic.com',     '9077889900', 15, '08:00:00', '20:00:00', 40, 1),
('Dr. Neha Verma',      'Ophthalmologist',      'Ophthalmology',     'neha.verma@clinic.com',       '9088990011', 20, '10:00:00', '18:00:00', 24, 1),
('Dr. Ramesh Patil',    'ENT Specialist',       'ENT',               'ramesh.patil@clinic.com',     '9099001122', 20, '09:00:00', '17:00:00', 24, 1),
('Dr. Anita Joshi',     'Psychiatrist',         'Psychiatry',        'anita.joshi@clinic.com',      '9010112233', 45, '10:00:00', '16:00:00', 10, 1);


-- ============================================================
-- DOCTOR SCHEDULE (weekly schedule for each doctor)
-- ============================================================
INSERT INTO doctor_schedule (doctor_id, day_of_week, start_time, end_time, is_available) VALUES
-- Dr. Rajesh Kumar (Cardiology) - Mon to Fri
(1, 'monday',    '09:00:00', '17:00:00', 1),
(1, 'tuesday',   '09:00:00', '17:00:00', 1),
(1, 'wednesday', '09:00:00', '17:00:00', 1),
(1, 'thursday',  '09:00:00', '17:00:00', 1),
(1, 'friday',    '09:00:00', '17:00:00', 1),
(1, 'saturday',  '09:00:00', '13:00:00', 1),

-- Dr. Sunita Sharma (Dermatology) - Mon to Sat
(2, 'monday',    '10:00:00', '18:00:00', 1),
(2, 'tuesday',   '10:00:00', '18:00:00', 1),
(2, 'wednesday', '10:00:00', '18:00:00', 1),
(2, 'thursday',  '10:00:00', '18:00:00', 1),
(2, 'friday',    '10:00:00', '18:00:00', 1),
(2, 'saturday',  '10:00:00', '14:00:00', 1),

-- Dr. Anil Mehta (Orthopedics) - Mon to Fri
(3, 'monday',    '08:00:00', '16:00:00', 1),
(3, 'tuesday',   '08:00:00', '16:00:00', 1),
(3, 'wednesday', '08:00:00', '16:00:00', 1),
(3, 'thursday',  '08:00:00', '16:00:00', 1),
(3, 'friday',    '08:00:00', '16:00:00', 1),

-- Dr. Kavitha Nair (Neurology) - Mon to Fri
(4, 'monday',    '09:00:00', '17:00:00', 1),
(4, 'tuesday',   '09:00:00', '17:00:00', 1),
(4, 'wednesday', '09:00:00', '17:00:00', 1),
(4, 'thursday',  '09:00:00', '17:00:00', 1),
(4, 'friday',    '09:00:00', '17:00:00', 1),

-- Dr. Pradeep Iyer (Pediatrics) - Mon to Sat
(5, 'monday',    '10:00:00', '16:00:00', 1),
(5, 'tuesday',   '10:00:00', '16:00:00', 1),
(5, 'wednesday', '10:00:00', '16:00:00', 1),
(5, 'thursday',  '10:00:00', '16:00:00', 1),
(5, 'friday',    '10:00:00', '16:00:00', 1),
(5, 'saturday',  '10:00:00', '13:00:00', 1),

-- Dr. Lakshmi Reddy (Gynecology) - Mon to Fri
(6, 'monday',    '09:00:00', '15:00:00', 1),
(6, 'tuesday',   '09:00:00', '15:00:00', 1),
(6, 'wednesday', '09:00:00', '15:00:00', 1),
(6, 'thursday',  '09:00:00', '15:00:00', 1),
(6, 'friday',    '09:00:00', '15:00:00', 1),

-- Dr. Suresh Gupta (General Medicine) - Mon to Sun
(7, 'monday',    '08:00:00', '20:00:00', 1),
(7, 'tuesday',   '08:00:00', '20:00:00', 1),
(7, 'wednesday', '08:00:00', '20:00:00', 1),
(7, 'thursday',  '08:00:00', '20:00:00', 1),
(7, 'friday',    '08:00:00', '20:00:00', 1),
(7, 'saturday',  '08:00:00', '20:00:00', 1),
(7, 'sunday',    '10:00:00', '16:00:00', 1),

-- Dr. Neha Verma (Ophthalmology) - Tue to Sat
(8, 'tuesday',   '10:00:00', '18:00:00', 1),
(8, 'wednesday', '10:00:00', '18:00:00', 1),
(8, 'thursday',  '10:00:00', '18:00:00', 1),
(8, 'friday',    '10:00:00', '18:00:00', 1),
(8, 'saturday',  '10:00:00', '14:00:00', 1),

-- Dr. Ramesh Patil (ENT) - Mon to Fri
(9, 'monday',    '09:00:00', '17:00:00', 1),
(9, 'tuesday',   '09:00:00', '17:00:00', 1),
(9, 'wednesday', '09:00:00', '17:00:00', 1),
(9, 'thursday',  '09:00:00', '17:00:00', 1),
(9, 'friday',    '09:00:00', '17:00:00', 1),

-- Dr. Anita Joshi (Psychiatry) - Mon, Wed, Fri
(10, 'monday',    '10:00:00', '16:00:00', 1),
(10, 'wednesday', '10:00:00', '16:00:00', 1),
(10, 'friday',    '10:00:00', '16:00:00', 1);


-- ============================================================
-- DOCTOR UNAVAILABILITY (planned leaves / blocks)
-- ============================================================
INSERT INTO doctor_unavailability (doctor_id, unavailable_date, start_time, end_time, reason) VALUES
(1,  '2025-06-10', '09:00:00', '17:00:00', 'Medical Conference'),
(2,  '2025-06-12', '10:00:00', '14:00:00', 'Personal Leave'),
(3,  '2025-06-15', '08:00:00', '16:00:00', 'Surgery Scheduled'),
(4,  '2025-06-18', '09:00:00', '13:00:00', 'Training Workshop'),
(5,  '2025-06-20', '10:00:00', '16:00:00', 'Annual Leave'),
(6,  '2025-06-22', '09:00:00', '15:00:00', 'Family Emergency'),
(7,  '2025-06-25', '08:00:00', '12:00:00', 'CME Program'),
(8,  '2025-06-28', '10:00:00', '18:00:00', 'Sick Leave'),
(9,  '2025-07-01', '09:00:00', '17:00:00', 'National Holiday'),
(10, '2025-07-03', '10:00:00', '16:00:00', 'Personal Leave');


-- ============================================================
-- APPOINTMENTS (15 records with various statuses)
-- ============================================================
INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_start, appointment_end, appointment_type, reason, triage_level, status, booking_source) VALUES
(1,  1,  '2025-06-01', '2025-06-01 09:00:00', '2025-06-01 09:30:00', 'Consultation',   'Chest pain and shortness of breath',    'urgent',   'confirmed',   'ai_chatbot'),
(2,  2,  '2025-06-02', '2025-06-02 10:00:00', '2025-06-02 10:20:00', 'Follow-up',      'Skin rash follow-up',                   'routine',  'completed',   'ai_chatbot'),
(3,  3,  '2025-06-03', '2025-06-03 08:00:00', '2025-06-03 08:45:00', 'Consultation',   'Knee pain after sports injury',         'urgent',   'completed',   'ai_chatbot'),
(4,  5,  '2025-06-04', '2025-06-04 10:00:00', '2025-06-04 10:20:00', 'Routine Checkup','General health checkup for child',      'routine',  'confirmed',   'ai_chatbot'),
(5,  1,  '2025-06-05', '2025-06-05 11:00:00', '2025-06-05 11:30:00', 'Follow-up',      'Post-surgery cardiac follow-up',        'routine',  'scheduled',   'ai_chatbot'),
(6,  6,  '2025-06-06', '2025-06-06 09:30:00', '2025-06-06 10:00:00', 'Consultation',   'Irregular menstrual cycle',             'routine',  'confirmed',   'ai_chatbot'),
(7,  7,  '2025-06-07', '2025-06-07 08:15:00', '2025-06-07 08:30:00', 'Routine Checkup','Fever and body ache',                   'routine',  'completed',   'ai_chatbot'),
(8,  9,  '2025-06-08', '2025-06-08 09:00:00', '2025-06-08 09:20:00', 'Consultation',   'Hearing difficulty in left ear',        'routine',  'scheduled',   'ai_chatbot'),
(9,  4,  '2025-06-09', '2025-06-09 10:00:00', '2025-06-09 10:30:00', 'Consultation',   'Frequent migraines and dizziness',      'urgent',   'confirmed',   'ai_chatbot'),
(10, 10, '2025-06-11', '2025-06-11 10:00:00', '2025-06-11 10:45:00', 'Consultation',   'Anxiety and sleep disorder',            'routine',  'scheduled',   'ai_chatbot'),
(1,  7,  '2025-06-12', '2025-06-12 09:00:00', '2025-06-12 09:15:00', 'Routine Checkup','General wellness checkup',              'routine',  'cancelled',   'ai_chatbot'),
(2,  8,  '2025-06-13', '2025-06-13 11:00:00', '2025-06-13 11:20:00', 'Consultation',   'Blurry vision and eye strain',          'routine',  'scheduled',   'ai_chatbot'),
(3,  1,  '2025-06-14', '2025-06-14 14:00:00', '2025-06-14 14:30:00', 'Consultation',   'Blood pressure monitoring',             'routine',  'confirmed',   'ai_chatbot'),
(4,  6,  '2025-06-16', '2025-06-16 10:00:00', '2025-06-16 10:30:00', 'Follow-up',      'Pregnancy follow-up checkup',           'routine',  'scheduled',   'ai_chatbot'),
(5,  3,  '2025-06-17', '2025-06-17 08:00:00', '2025-06-17 08:45:00', 'Consultation',   'Lower back pain',                       'urgent',   'no_show',     'ai_chatbot');


-- ============================================================
-- APPOINTMENT STATUS HISTORY
-- ============================================================
INSERT INTO appointment_status_history (appointment_id, old_status, new_status, changed_by) VALUES
(1,  'scheduled',  'confirmed',  'ai_chatbot'),
(2,  'scheduled',  'confirmed',  'ai_chatbot'),
(2,  'confirmed',  'completed',  'system'),
(3,  'scheduled',  'confirmed',  'ai_chatbot'),
(3,  'confirmed',  'completed',  'system'),
(4,  'scheduled',  'confirmed',  'ai_chatbot'),
(7,  'scheduled',  'confirmed',  'system'),
(7,  'confirmed',  'completed',  'system'),
(9,  'scheduled',  'confirmed',  'ai_chatbot'),
(11, 'scheduled',  'cancelled',  'ai_chatbot'),
(13, 'scheduled',  'confirmed',  'ai_chatbot'),
(15, 'scheduled',  'confirmed',  'ai_chatbot'),
(15, 'confirmed',  'no_show',    'system');


-- ============================================================
-- APPOINTMENT OTPs
-- ============================================================
INSERT INTO appointment_otps (
    action_type, session_id, email, otp_code,
    patient_id, appointment_id, doctor_id, new_doctor_id,
    appointment_date, new_appointment_date,
    appointment_time, new_appointment_time,
    reason, expires_at, is_verified,
    patient_name, phone, department, doctor_name, new_doctor_name
) VALUES
('booking',                 'sess_001', 'aarav.sharma@gmail.com',  '482910', 1,  1,  1,  NULL, '2025-06-01', NULL,        '09:00',  NULL,    'Chest pain',              '2025-06-01 09:15:00', 1, 'Aarav Sharma',  '9876543210', 'Cardiology',       'Dr. Rajesh Kumar',   NULL),
('booking',                 'sess_002', 'priya.mehta@gmail.com',   '371820', 2,  2,  2,  NULL, '2025-06-02', NULL,        '10:00',  NULL,    'Skin rash follow-up',     '2025-06-02 10:15:00', 1, 'Priya Mehta',   '9823456781', 'Dermatology',      'Dr. Sunita Sharma',  NULL),
('booking',                 'sess_003', 'rohan.verma@gmail.com',   '593741', 3,  3,  3,  NULL, '2025-06-03', NULL,        '08:00',  NULL,    'Knee pain',               '2025-06-03 08:15:00', 1, 'Rohan Verma',   '9712345678', 'Orthopedics',      'Dr. Anil Mehta',     NULL),
('cancel_appointment',      'sess_004', 'aarav.sharma@gmail.com',  '204857', 1,  11, 7,  NULL, '2025-06-12', NULL,        '09:00',  NULL,    'Personal emergency',      '2025-06-12 09:15:00', 1, 'Aarav Sharma',  '9876543210', 'General Medicine', 'Dr. Suresh Gupta',   NULL),
('reschedule_appointment',  'sess_005', 'vikram.nair@gmail.com',   '716392', 5,  5,  1,  NULL, '2025-06-05', NULL,        '11:00',  NULL,    'Time conflict',           '2025-06-05 11:15:00', 1, 'Vikram Nair',   '9545678901', 'Cardiology',       'Dr. Rajesh Kumar',   NULL),
('booking',                 'sess_006', 'ananya.iyer@gmail.com',   '839274', 6,  6,  6,  NULL, '2025-06-06', NULL,        '09:30',  NULL,    'Irregular cycle',         '2025-06-06 09:45:00', 1, 'Ananya Iyer',   '9456789012', 'Gynecology',       'Dr. Lakshmi Reddy',  NULL),
('booking',                 'sess_007', 'karan.gupta@gmail.com',   '102938', 7,  7,  7,  NULL, '2025-06-07', NULL,        '08:15',  NULL,    'Fever and body ache',     '2025-06-07 08:30:00', 1, 'Karan Gupta',   '9367890123', 'General Medicine', 'Dr. Suresh Gupta',   NULL),
('booking',                 'sess_008', 'divya.reddy@gmail.com',   '564738', 8,  8,  9,  NULL, '2025-06-08', NULL,        '09:00',  NULL,    'Hearing difficulty',      '2025-06-08 09:15:00', 0, 'Divya Reddy',   '9278901234', 'ENT',              'Dr. Ramesh Patil',   NULL),
('reschedule_appointment',  'sess_009', 'arjun.singh@gmail.com',   '928374', 9,  9,  4,  NULL, '2025-06-09', '2025-06-16','10:00',  '14:00', 'Rescheduling appointment','2025-06-09 10:15:00', 1, 'Arjun Singh',   '9189012345', 'Neurology',        'Dr. Kavitha Nair',   NULL),
('booking',                 'sess_010', 'meera.joshi@gmail.com',   '473829', 10, 10, 10, NULL, '2025-06-11', NULL,        '10:00',  NULL,    'Anxiety issues',          '2025-06-11 10:15:00', 0, 'Meera Joshi',   '9090123456', 'Psychiatry',       'Dr. Anita Joshi',    NULL);


-- ============================================================
-- AI CONVERSATIONS
-- ============================================================
INSERT INTO ai_conversations (patient_id, session_id, user_message, ai_response) VALUES
(1,  'sess_001', 'Hi, I need to book an appointment',                                          'Hello! I am your AI receptionist. I can help you book an appointment. Could you please share your name and email address?'),
(1,  'sess_001', 'My name is Aarav Sharma, email is aarav.sharma@gmail.com',                   'Thank you Aarav! What department or doctor would you like to visit?'),
(1,  'sess_001', 'I want to see a cardiologist for chest pain',                                 'I understand. Dr. Rajesh Kumar is available in Cardiology. Would you like to book an appointment on June 1st at 9:00 AM?'),
(1,  'sess_001', 'Yes, that works for me',                                                      'Great! I have sent an OTP to aarav.sharma@gmail.com. Please enter the OTP to confirm your appointment.'),
(1,  'sess_001', '482910',                                                                       'Your appointment has been confirmed with Dr. Rajesh Kumar on June 1st at 9:00 AM. A confirmation email has been sent to you.'),
(2,  'sess_002', 'I want to book a follow-up with the dermatologist',                           'Sure! Dr. Sunita Sharma is available. Could you share your email address to proceed?'),
(2,  'sess_002', 'priya.mehta@gmail.com',                                                       'Thank you Priya! Dr. Sunita Sharma is available on June 2nd at 10:00 AM. Would you like to confirm?'),
(2,  'sess_002', 'Yes please',                                                                   'An OTP has been sent to priya.mehta@gmail.com. Please enter it to confirm.'),
(3,  'sess_003', 'Can I book an orthopedic appointment for knee pain?',                         'Of course! Dr. Anil Mehta specializes in Orthopedics. He is available on June 3rd at 8:00 AM. Would that work?'),
(3,  'sess_003', 'That works, my email is rohan.verma@gmail.com',                              'Perfect! OTP sent to rohan.verma@gmail.com. Please verify to complete the booking.'),
(NULL, 'sess_011', 'What are your clinic working hours?',                                       'Our clinic operates Monday to Saturday. Most departments are available from 8:00 AM to 6:00 PM. Some specialists have specific hours. Would you like me to check a specific doctor\'s availability?'),
(NULL, 'sess_012', 'Which doctors are available in the neurology department?',                  'In Neurology, Dr. Kavitha Nair is available Monday to Friday from 9:00 AM to 5:00 PM. Would you like to book an appointment with her?'),
(7,  'sess_007', 'I have a fever and body ache, need to see a doctor today',                    'I can help with that. Dr. Suresh Gupta from General Medicine is available today. Would you like to book an appointment?'),
(7,  'sess_007', 'Yes, my email is karan.gupta@gmail.com',                                     'OTP sent to karan.gupta@gmail.com. Please verify to confirm your appointment at 8:15 AM today.'),
(1,  'sess_004', 'I need to cancel my appointment on June 12th',                               'I can help you cancel that appointment. Could you confirm your email address for verification?'),
(1,  'sess_004', 'aarav.sharma@gmail.com',                                                      'An OTP has been sent to aarav.sharma@gmail.com. Please enter it to confirm the cancellation.'),
(1,  'sess_004', '204857',                                                                       'Your appointment with Dr. Suresh Gupta on June 12th has been successfully cancelled. A confirmation email has been sent.');


-- ============================================================
-- END OF SAMPLE DATA
-- ============================================================
