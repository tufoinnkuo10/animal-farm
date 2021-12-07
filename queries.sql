/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = 'yes' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg>10.5;
SELECT name from animals where neutered=TRUE;
SELECT name from animals where name='Gabumon';
SELECT name from animals where weight_kg BETWEEN 10.4 AND 17.3;

/* querry and update table*/
UPDATE animals
SET species = 'unspecified'
/* rollback*/
ROLLBACK
/* transaction and name change*/
BEGIN
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species = 'unspecified';

commit 
/* delete all transactions or table*/
begin
SAVEPOINT mainanimallist;
DELETE FROM animals;

ROLLBACK TO mainanimallist;

/* delete animals born after january first*/
begin
SAVEPOINT animalsafterjanuary;
DELETE FROM animals
WHERE date_of_birth > 01-01-2022;
rollback to animalsafterjanuary;

/* SELECT * from animals; ===> ALL weights are opposit to what they were */
ROLLBACK;
UPDATE animals
SET weight_kg = weight_kg*-1 where weight_kg<0;
COMMIT;
/* SELECT * from animals; ===> ALL weights positive */
END;


/* querries to answer questions at hand */

/* howmany animals are there */
SELECT COUNT(name) FROM animals;
/* never escaped */
SELECT COUNT(name) FROM animals;
where escape_attemps < 1;

/* average weight of animals */
SELECT AVG(weight_kg) FROM animals;

/*neutered highest escape animal*/
SELECT name from animals
WHERE escape_attempts = (select MAX(escape_attempts) from animals);

/* WHICH IS MAX/MIN WEIGHT FOR EACH SPECIE */
SELECT species, MAX(weight_kg), MIN(weight_kg)
from animals GROUP BY species;

/* avg escape attempt btwn 1990 and 2000 */
SELECT species,AVG(escape_attempts) from animals
where date_of_birth BETWEEN '1990-1-1' AND '2000-1-1' GROUP BY species;

















