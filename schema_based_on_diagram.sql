-- CREATE TABLE patients (
--   id integer GENERATED ALWAYS AS IDENTITY,
--   name varchar,
--   date_of_birth date,
--   PRIMARY KEY(id)
-- );

-- CREATE TABLE invoices (
--   id integer GENERATED ALWAYS AS IDENTITY,
--   total_amount decimal,
--   generated_at timestamp,
--   payed_at timestamp,
--   medical_history_id integer,
--   PRIMARY KEY(id)
-- );


CREATE TABLE medical_history (
  id integer GENERATED ALWAYS AS IDENTITY,
  status varchar,
  patient_id integer,
  admitted_at timestamp,
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id integer GENERATED ALWAYS AS IDENTITY,
  type varchar,
  name varchar,
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
  id integer GENERATED ALWAYS AS IDENTITY,
  unit_price decimal,
  quantity integer,
  total_price integer,
  invoice_id integer,
  treatments_id integer,
  PRIMARY KEY (id)
);

ALTER TABLE invoice_items ADD FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE invoice_items ADD FOREIGN KEY (treatments_id) REFERENCES treatments(id);

ALTER TABLE medical_history ADD FOREIGN KEY (patient_id) REFERENCES patients(id);

ALTER TABLE invoices ADD FOREIGN KEY (medical_history_id) REFERENCES medical_history(id);

CREATE TABLE medical_history_treatments (
  medical_history_id integer,
  treatments_id integer,
  PRIMARY KEY (medical_history_id, treatments_id)
);

ALTER TABLE medical_history_treatments ADD FOREIGN KEY (medical_history_id) REFERENCES medical_history(id);

ALTER TABLE medical_history_treatments ADD FOREIGN KEY (treatments_id) REFERENCES treatments(id);

CREATE INDEX medical_history_paitient_id ON medical_history(paitient_id);

CREATE INDEX invoices_medical_history_id ON invoices(medical_history_id);

CREATE INDEX invoice_items_invoices_id ON invoice_items(invoice_id);

CREATE INDEX invoice_items_treatments_id ON invoice_items(treatments_id);