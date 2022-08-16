CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "parient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "medical_histories" ADD PRIMARY KEY("id");
CREATE TABLE "treatments"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "treatments" ADD PRIMARY KEY("id");
CREATE TABLE "invoice_item"(
    "id" INTEGER NOT NULL,
    "unit_proce" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoice_item" ADD PRIMARY KEY("id");
CREATE TABLE "invoices"(
    "id" INTEGER NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoices" ADD PRIMARY KEY("id");
ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_parient_id_foreign" FOREIGN KEY("parient_id") REFERENCES "patients"("id");
ALTER TABLE
    "invoice_item" ADD CONSTRAINT "invoice_item_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");
ALTER TABLE
    "invoice_item" ADD CONSTRAINT "invoice_item_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "treatments"("id");