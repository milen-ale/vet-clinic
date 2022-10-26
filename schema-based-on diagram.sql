-- Patients Table --

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  name varchar(100) NOT NULL,
  date_of_birth DATE,
  PRIMARY key (id)
);

-- Medical Histories --

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  admitted_at TIMESTAMP,
  patient_id INT NOT NULL,
  status varchar(100),
  PRIMARY KEY(id) ,
  CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
);

-- Add indexes for foreign keys
CREATE INDEX ON medical_histories (patient_id);

-- Invoices Table

CREATE TABLE invoices(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  total_amount MONEY NOT NULL,
  generated_at DATE NOT NULL,
  payed_at DATE NOT NULL,
  medical_history_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

-- Add indexes for foreign keys
CREATE INDEX ON invoices (medical_history_id);

-- treatments
CREATE TABLE treatments (
  id BIGSERIAL PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(100)
);

