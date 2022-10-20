/* Populate database with sample data. */
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals(id, name,date_of_birth,escape_attemtps, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 2, FALSE, -11)

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

--INSERT data into ownera table
INSERT INTO owners(id, full_name, age) VALUES (1, sam smith, 31);
INSERT INTO owners (id, full_name, age) VALUES (Jennifer Orwell, 19);
INSERT INTO owners (id, full_name, age) VALUES (Melody Pond, 77);
INSERT INTO owners (id, full_name, age) VALUES (Dean Winchester , 14);
INSERT INTO owners (id, full_name, age) VALUES (5,Jodie Whittaker, 38);

--INSERT data into species table
   INSERT INTO species (name) VALUES ('Pokemon');

   INSERT INTO species (name) VALUES ('Digimon');

   INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

--Modify your inserted animals so it includes the species_id value
  --If the name ends in "mon" it will be Digimon
     UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
     --All other animals are Pokemon
     UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

   -- Modify your inserted animals to include owner information (owner_id):  

 UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon';

UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name = 'Charmander';

UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle';

UPDATE animals SET owner_id = 4 WHERE name = 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name = 'Angemon';

UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon';




