CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR,
  name VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE treatment_history (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY(id)
);

