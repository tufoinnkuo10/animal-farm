CREATE TABLE patients (
  id SERIAL,
  name VARCHAR(120),
  date_of_birth DATE,
  PRIMARY KEY (id)
);
CREATE TABLE medical_history (
  id SERIAL,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(120),
  PRIMARY KEY (id),
  CONSTRAINT FK_patient_id
    FOREIGN KEY (patient_id)
      REFERENCES patients(id)
);
CREATE TABLE treatments (
  id SERIAL,
  type VARCHAR(120),
  name VARCHAR(120),
  PRIMARY KEY (id)
);
CREATE TABLE invoices (
  id SERIAL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY (id)
);
