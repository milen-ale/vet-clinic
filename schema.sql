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

--Create a table named vets
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    age INT,
    date_of_graduation DATE
);

-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.

CREATE TABLE specializations (
    species_id INT REFERENCES spacies (id),
    vets_id INT REFERENCES vets (id)
);

--There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship

CREATE TABLE visits (
    animals_id INT REFERENCES animals (id),
    vets_id INT REFERENCES vets (id),
    date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX friends_city_desc ON friends(city DESC);

CREATE INDEX  animal_id_index ON visits (animals_id); 

CREATE INDEX vets_id_index ON visits(vets_id); 

CREATE INDEX email_index ON owners(email);