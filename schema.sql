/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer primary key,
    name varchar(100),
    date_of_birth date,
    escape_attemps integer,
    neutered boolean,
    weight_kg decimal
    
    );

    ALTER TABLE animals ADD COLUMN species TEXT;

    -- CREATE owners table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    age INT
);

--CREATE species tabel
CREATE TABLE spacies(
 id SERIAL PRIMARY KEY,
  name TEXT
);
 -- Modifay animal table
 --Make sure that id is set as autoincremented PRIMARY KEY
  CREATE SEQUENCE animals_id_seq owned BY animals.id;

  ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

  SELECT SETVAL(pg_get_serial_sequence('animals', 'id'), max(id)) FROM animals;

--Remove column species
ALTER TABLE animals DROP COLUMN species;

--Add column species_id which is a foreign key referencing species table

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species;

--Add column owner_id which is a foreign key referencing the owners table
    ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners;

