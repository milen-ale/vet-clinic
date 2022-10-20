/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE right (name, 3) = 'mon';
SELECT name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name ='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE 10.4 <= weight_kg AND weight_kg >= 17.3;


BEGIN;
UPDATE ANIMALS SET species = 'unspecified';
SELECT * FROM ANIMALS; 
ROLLBACK;
SELECT * FROM ANIMALS; 

-- Update 

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE NOT name LIKE '%mon';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals; 

-- Delete all records and rollback

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals; 

-- Transaction 4

BEGIN;
DELETE FROM ANIMALS WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_after_january_2022;
UPDATE ANIMALS SET weight_kg = -1 * weight_kg;
ROLLBACK TO SAVEPOINT delete_after_january_2022;
UPDATE ANIMALS SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;

-- Aggregate Transactions

-- How many animals are there?
SELECT count(animals) FROM animals; -- 10


-- How many animals have never tried to escape?
SELECT count(animals) FROM animals WHERE escape_attempts = 0; -- 2


-- What is the average weight of animals?
SELECT avg(weight_kg) FROM animals; -- 15.55000

-- Who escapes the most, neutered or not neutered animals?
SELECT SUM(escape_attempts) FROM animals WHERE neutered; -- 20
SELECT SUM(escape_attempts) FROM animals WHERE NOT neutered; -- 4


-- What is the minimum and maximum weight of each type of animal?
-- Minimum of type digimon
SELECT MIN(weight_kg) FROM animals WHERE species = 'digimon'; -- 5.7
-- Maximum of type digimon
SELECT MAX(weight_kg) FROM animals WHERE species = 'digimon'; -- 45
-- Minimum of type pokemon
SELECT MIN(weight_kg) FROM animals WHERE species = 'pokemon'; -- 11
-- Maximum of type pokemon
SELECT MAX(weight_kg) FROM animals WHERE species = 'pokemon'; -- 17

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
-- Average escape attempts of type digimon
SELECT AVG(escape_attempts) FROM animals WHERE species = 'digimon' AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'; -- 0
-- Average escape attempts of type pokemon
SELECT AVG(escape_attempts) FROM animals WHERE species = 'pokemon' AND date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'; -- 3.0

/* Write queries (using JOIN) to answer the following questions: */


-- What animals belong to Melody Pond?

SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)

SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Sam Smith';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Bob';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester';

SELECT animals.name, owners.full_name FROM owners INNER JOIN animals ON animals.owner_id = owners.id WHERE owners.full_name = 'Jodie Whittaker';
