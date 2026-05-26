import os
import pandas as pd
import streamlit as st
import mysql.connector
import plotly.express as px
from dotenv import load_dotenv

load_dotenv()

st.set_page_config(
    page_title="ABC Hospital Admin Dashboard",
    page_icon="🏥",
    layout="wide"
)

def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

@st.cache_data(ttl=30)
def run_query(query):
    conn = get_connection()
    df = pd.read_sql(query, conn)
    conn.close()
    return df

st.title("🏥 ABC Hospital Admin Dashboard")
st.caption("Appointment, patient, doctor, and OTP monitoring dashboard")

appointments_query = """
SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    p.email,
    p.phone,
    d.doctor_name,
    d.department,
    a.appointment_date,
    TIME_FORMAT(a.appointment_start, '%H:%i') AS appointment_time,
    TIME_FORMAT(a.appointment_end, '%H:%i') AS appointment_end_time,
    a.reason,
    a.status,
    a.created_at
FROM appointments a
JOIN patients p ON p.patient_id = a.patient_id
JOIN doctors d ON d.doctor_id = a.doctor_id
ORDER BY a.appointment_date DESC, a.appointment_start DESC;
"""

patients_query = """
SELECT
    patient_id,
    full_name,
    email,
    phone,
    created_at
FROM patients
ORDER BY created_at DESC;
"""

doctors_query = """
SELECT
    doctor_id,
    doctor_name,
    department,
    specialization,
    consultation_duration,
    available_from,
    available_to,
    is_active
FROM doctors
ORDER BY department, doctor_name;
"""

otp_query = """
SELECT
    otp_id,
    action_type,
    email,
    patient_name,
    doctor_name,
    appointment_date,
    appointment_time,
    is_verified,
    expires_at,
    created_at
FROM appointment_otps
ORDER BY created_at DESC
LIMIT 100;
"""

appointments = run_query(appointments_query)
patients = run_query(patients_query)
doctors = run_query(doctors_query)
otps = run_query(otp_query)

col1, col2, col3, col4 = st.columns(4)

col1.metric("Total Appointments", len(appointments))
col2.metric("Confirmed", len(appointments[appointments["status"] == "confirmed"]))
col3.metric("Cancelled", len(appointments[appointments["status"] == "cancelled"]))
col4.metric("Total Patients", len(patients))

st.divider()

st.subheader("📅 Appointment Filters")

filter_col1, filter_col2, filter_col3 = st.columns(3)

departments = ["All"] + sorted(appointments["department"].dropna().unique().tolist())
statuses = ["All"] + sorted(appointments["status"].dropna().unique().tolist())

selected_department = filter_col1.selectbox("Department", departments)
selected_status = filter_col2.selectbox("Status", statuses)
selected_date = filter_col3.date_input("Appointment Date", value=None)

filtered = appointments.copy()

if selected_department != "All":
    filtered = filtered[filtered["department"] == selected_department]

if selected_status != "All":
    filtered = filtered[filtered["status"] == selected_status]

if selected_date:
    filtered = filtered[filtered["appointment_date"].astype(str) == str(selected_date)]

st.subheader("📋 Appointments")
st.dataframe(filtered, use_container_width=True)

st.divider()

chart_col1, chart_col2 = st.columns(2)

with chart_col1:
    st.subheader("Appointments by Department")
    dept_chart = appointments.groupby("department").size().reset_index(name="count")
    fig = px.bar(dept_chart, x="department", y="count", text="count")
    st.plotly_chart(fig, use_container_width=True)

with chart_col2:
    st.subheader("Appointments by Status")
    status_chart = appointments.groupby("status").size().reset_index(name="count")
    fig = px.pie(status_chart, names="status", values="count")
    st.plotly_chart(fig, use_container_width=True)

st.divider()

tab1, tab2, tab3 = st.tabs(["👨‍⚕️ Doctors", "🧑 Patients", "🔐 OTP Logs"])

with tab1:
    st.subheader("Doctors")
    st.dataframe(doctors, use_container_width=True)

with tab2:
    st.subheader("Patients")
    st.dataframe(patients, use_container_width=True)

with tab3:
    st.subheader("Recent OTP Logs")
    st.dataframe(otps, use_container_width=True)