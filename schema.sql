/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id int,
  name char,
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  PRIMARY KEY(id)
);

ALTER TABLE animals
ALTER COLUMN name TYPE varchar(100);

ALTER TABLE animals
ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE animals  
  ADD COLUMN species varchar(200);
