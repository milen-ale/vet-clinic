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
-- Invoice Items Table
CREATE TABLE invoice_items(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
-- Add indexes for foreign keys
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
-- medical_treatments
CREATE TABLE medical_treatments (
  treatments_id INT,
  invoice_items_id INT,
  PRIMARY KEY(treatments_id,invoice_items_id),
  CONSTRAINT fk_treatments FOREIGN KEY(treatments_id) REFERENCES treatments(id),
  CONSTRAINT fk_invoice_items FOREIGN KEY(invoice_items_id) REFERENCES invoice_items(id)
);
-- Add indexes for foreign keys
CREATE INDEX ON medical_treatments (treatments_id);
CREATE INDEX ON medical_treatments (invoice_items_id);











