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
