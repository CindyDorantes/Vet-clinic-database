/*Queries that provide answers to the questions from all projects.*/
-- CREATE ANIMALS TABLE
-- Find all animals whose name ends in "mon"
SELECT *
from animals
WHERE name like '%mon';
-- List the name of all animals born between 2016 and 2019
SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name
FROM animals
WHERE neutered IS NOT FALSE
    AND escape_attempts <= 3;
-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth
FROM animals
WHERE name LIKE 'Agumon'
    OR name LIKE 'Pikachu';
-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
-- Find all animals that are neutered
SELECT *
FROM animals
WHERE neutered IS TRUE;
-- Find all animals not named Gabumon.
SELECT *
FROM animals
WHERE name NOT LIKE 'Gabumon';
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;
-- SECOND TASK: query and update animals table
-- 1ST TRANSACTION: Update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;
SELECT *
FROM animals;
-- 2ND TRANSACTION: Update the animals table by setting the species column to digimon/pokemon
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;
SELECT *
FROM animals;
-- 3RD TRANSACTION: Delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT *
FROM animals;
-- 4TH TRANSACTION: Delete all animals born after Jan 1st, 2022. Create a savepoint. Update all animals' weight. Rollback to the savepoint.
-- Update all animals' weights that are negative to be their weight multiplied by -1. Commit transaction
BEGIN;
DELETE FROM animals
WHERE date_of_birth >= '2022-01-01';
SAVEPOINT sp01;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO sp01;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT *
FROM animals;
-- Complex queries that answer analytical questions.
-- How many animals are there?
SELECT COUNT(*)
FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered,
    AVG(escape_attempts)
FROM animals
GROUP BY neutered
ORDER BY AVG DESC
LIMIT 1;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;