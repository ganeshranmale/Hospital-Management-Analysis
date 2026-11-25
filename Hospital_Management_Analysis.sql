CREATE DATABASE hospital;
use hospital;


# 1. How many patients are there?

SELECT COUNT(*) AS total_patients
FROM patients;

# 2. How many doctors are there?

SELECT COUNT(*) AS total_doctors
FROM doctors;

# 3. How many appointments are there?

SELECT COUNT(*) AS total_appointments
FROM appointments;

# 4. How many appointments are in each status?

SELECT status, COUNT(*) AS total
FROM appointments
GROUP BY status;

# 5. How many treatments are there for each type?

SELECT treatment_type, COUNT(*) AS total
FROM treatments
GROUP BY treatment_type;

# 6. What is the average cost for each treatment type?

SELECT treatment_type, AVG(cost) AS average_cost
FROM treatments
GROUP BY treatment_type;

# 7. How many bills are in each payment status?

SELECT payment_status, COUNT(*) AS total
FROM billing
GROUP BY payment_status;

# 8. How many bills were paid using each payment method?

SELECT payment_method, COUNT(*) AS total
FROM billing
GROUP BY payment_method;

# 9. How many appointments were made on each date?

SELECT appointment_date, COUNT(*) AS total
FROM appointments
GROUP BY appointment_date;

# 10. How many doctors work in each specialization?
SELECT specialization, COUNT(*) AS total
FROM doctors
GROUP BY specialization;

# 11. How many appointments does each doctor have?

SELECT d.doctor_id, d.first_name, d.last_name,
	   COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

# 12. How many appointments were made each month?

SELECT MONTH(appointment_date) AS month_number,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month_number;

# 13. What is the total cost for each treatment type?

SELECT treatment_type, SUM(cost) AS total_cost
FROM treatments
GROUP BY treatment_type;

# 14. What is the total bill amount for each payment status?

SELECT payment_status, SUM(amount) AS total_amount
FROM billing
GROUP BY payment_status;

# 15. What is the total treatment cost for each appointment?

SELECT appointment_id, SUM(cost) AS total_cost
FROM treatments
GROUP BY appointment_id;

# 16. Which patients have more than one appointment?

SELECT patient_id, COUNT(*) AS total_appointments
FROM appointments
GROUP BY patient_id
HAVING COUNT(*) > 1;

# 17. Which doctors have no appointments?

SELECT d.doctor_id, d.first_name, d.last_name
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

# 18. How many treatments are linked to each appointment status?

SELECT a.status, COUNT(t.treatment_id) AS total_treatments
FROM appointments a
LEFT JOIN treatments t
ON a.appointment_id = t.appointment_id
GROUP BY a.status;

# 19. What is the average bill amount for each payment method?

SELECT payment_method, AVG(amount) AS average_amount
FROM billing
GROUP BY payment_method;

# 20. How much was billed for each treatment type?

SELECT t.treatment_type, round(SUM(b.amount),2) AS total_billed
FROM treatments t
JOIN billing b
ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type;

# 21. How many completed and cancelled appointments does each doctor have?

SELECT d.doctor_id,d.first_name,d.last_name,
SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed,
SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

# 22. Which patients have three or more appointments?

SELECT patient_id, COUNT(*) AS total_appointments
FROM appointments
GROUP BY patient_id
HAVING COUNT(*) >= 3;

# 23. What is the average bill amount for each month?

SELECT MONTH(bill_date) AS bill_month,
round(AVG(amount),2) AS average_bill
FROM billing
GROUP BY MONTH(bill_date)
ORDER BY bill_month;

# 24. What is the average treatment cost for each appointment status?

SELECT a.status,
AVG(t.cost) AS average_treatment_cost
FROM appointments a
JOIN treatments t
ON a.appointment_id = t.appointment_id
GROUP BY a.status;

#25. How many bills and what total amount are there for each treatment type?

SELECT t.treatment_type,
       COUNT(b.bill_id) AS total_bills,
       SUM(b.amount) AS total_amount
FROM treatments t
JOIN billing b
ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type;

# 26. Which patients have not made an appointment?

SELECT p.patient_id
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

#27. How many bills are paid, pending, or failed for each payment method?

SELECT payment_method,
       SUM(CASE WHEN payment_status = 'Paid' THEN 1 ELSE 0 END) AS paid,
       SUM(CASE WHEN payment_status = 'Pending' THEN 1 ELSE 0 END) AS pending,
       SUM(CASE WHEN payment_status = 'Failed' THEN 1 ELSE 0 END) AS failed
FROM billing
GROUP BY payment_method;

# 28. How many treatments were given by each doctor’s specialization?

SELECT d.specialization,
       COUNT(t.treatment_id) AS total_treatments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
JOIN treatments t
ON a.appointment_id = t.appointment_id
GROUP BY d.specialization
ORDER BY total_treatments DESC;

