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



/* highest animal owner */

SELECT owners.full_name FROM animals
JOIN owners ON owners.id = animals.owners_id
GROUP BY owners.full_name
ORDER BY count(name) desc
limit 1;

/* last animal seen by william */
SELECT animals.name FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
WHERE vets.name='William Tatcher'
ORDER BY visit_date DESC
LIMIT 1;

/* number of animals seen by stephanie */

SELECT count(animals.name) FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
WHERE vets.name='Stephanie Mendez';

/* list vets and their speciality (including ones who hasn't) */

SELECT vets.name AS vet_name , species.name AS speciality FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id
LEFT JOIN species ON species.id=specializations.species_id;

/* animals that visisted stephanie between 01/04/2020 and 30/08/2002 */

SELECT animals.name FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
WHERE vets.name='Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

/* animal who had the most vists to vets */

SELECT animals.name FROM animals
JOIN visits ON animals.id=visits.animals_id
GROUP BY animals.name
ORDER BY count( animals.name ) DESC
LIMIT 1;

/* maisy smiths first visit */

SELECT animals.name /*,visits.visit_date*/ FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
WHERE vets.name='Maisy Smith'
ORDER BY visit_date
LIMIT 1;

/* details on latest visit */ 

SELECT visits.visit_date AS latest_visit_date,
animals.*,
vets.name, vets.age, vets.date_of_graduation FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
ORDER BY visit_date DESC
LIMIT 1;

/* visists with vet that has no speciality */

SELECT count(animals.name) as no_spec_visit_count /* , vets.name*/ FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
LEFT JOIN specializations ON specializations.vets_id = vets.id
WHERE specializations.species_id IS NULL
GROUP BY vets.name;

/* maisy specialization base on most visited animal*/

SELECT species.name FROM vets
JOIN visits ON visits.vets_id=vets.id
JOIN animals ON visits.animals_id=animals.id
JOIN species ON animals.species_id=species.id
WHERE vets.name='Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.name) DESC
LIMIT 1;













