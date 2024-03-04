CREATE TABLE person_audit
(
    created TIMESTAMPTZ DEFAULT now() NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age BIGINT,
    gender VARCHAR,
    address VARCHAR
);

ALTER TABLE person_audit
    ADD CONSTRAINT ch_type_event
        CHECK (type_event IN ('I', 'U', 'D'));

CREATE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$body$
BEGIN
   	INSERT INTO person_audit
   	SELECT now(), 'I', NEW.*;
    RETURN NULL;
END;
$body$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

