/* Populate database with sample data. */
INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23),
  ('Gabumon', '2018-11-15', 2, TRUE, 8.0),
  ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
  ('Devimon', '2017,05,12', 1, FALSE, 15.04);
UPDATE animals
SET date_of_birth = '2017-05-12',
  escape_attempts = 5,
  neutered = TRUE,
  weight_kg = 11.0
WHERE name = 'Devimon';

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Charmander', '2020-02-08', 0, FALSE, 11.0),
  ('Plantmon', '2021-11-15', 2, TRUE, 5.7),
  ('Squirtle', '1992-04-02', 3, FALSE, 12.13),
  ('Angemon', '2005-06-12', 1, TRUE, 45.0),
  ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
  ('Blossom', '1998-10-13', 3, TRUE, 17.0),
  ('Ditto', '2022-05-14', 4, TRUE, 22.0);

UPDATE animals
  SET weight_kg = -45.0
  WHERE name = 'Angemon';

-- Insert data into the owners table
INSERT INTO owners (
  full_name,
  age
)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (
  name
)
VALUES ('Pokemon'), ('Digimon');

-- Modify your inserted animals
UPDATE animals
  SET species_id = 2
  WHERE name LIKE '%mon';
UPDATE animals
  SET species_id = 1
  WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information
UPDATE animals
  SET owner_id = 1
  WHERE name = 'Agumon';
UPDATE animals
  SET owner_id = 2
  WHERE name = 'Gabumon';
UPDATE animals
  SET owner_id = 2
  WHERE name = 'Pikachu';
UPDATE animals
  SET owner_id = 3
  WHERE name = 'Devimon';
UPDATE animals
  SET owner_id = 3
  WHERE name = 'Plantmon';
UPDATE animals
  SET owner_id = 4
  WHERE name = 'Charmander';
UPDATE animals
  SET owner_id = 4
  WHERE name = 'Squirtle';
UPDATE animals
  SET owner_id = 4
  WHERE name = 'Blossom';
UPDATE animals
  SET owner_id = 5
  WHERE name = 'Angemon';
UPDATE animals
  SET owner_id = 5
  WHERE name = 'Boarmon';