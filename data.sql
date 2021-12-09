INSERT INTO animals 
(id,name,date_of_birth,escape_attempts,neutered,weight_kg,species)
VALUES 
('1','Agumon','02-03-2020','1','yes','10.23');
('2','Gabumon','11-15-2018','1','no','8');
('3','Pikachu','01-07-2021','5','yes','15.04');
('4','Devimon','03-12-2017','5','yes','11');
('5','Charmander','02-08-2020','0','No','-11','Domestic');
('6','Plantmon','11-15-2022','2','true','-5.7','wild');
('7','Squirtle','04-02-1993','3','false','-12.13','very wild');
('8','Angemon','06-12-2005','1','true','-45','Domestic');
('9','Boarmon','06-07-2005','7','true','20.4','wise mix');
('10','Blossom','10-13-1998','3','true','17','Domestic');

/*add information to the species and owners table*/
INSERT INTO
	owners (full_name, age)
VALUES 
('Sam Smith', '34'),
('Jennifer Orwell ','19'),
('Bob', '45'),
('Melody Pond', '77'),
('Dean Winchester', '14'),
('Jodie Whittaker', '38')

INSERT INTO
species (name)
VALUES 
('Pokemon'),
('Digimon')

/* SET ANIMALS WITH MON TO DIGIMON */
BEGIN;
UPDATE animals
SET species_id = 2 WHERE name LIKE '%mon';
COMMIT;
END;

/* SET POKEMON FOR THE REST */
BEGIN;
UPDATE animals
SET species_id = 1 WHERE species_id is NULL;
COMMIT;
END;

/* Set owners_id */

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')  WHERE name='Agumon';
COMMIT;
END;

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')  WHERE name='Gabumon' OR name='Pikachu';
COMMIT;
END;

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob')  WHERE name='Devimon' OR name='Plantmon';
COMMIT;
END;

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')  WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
COMMIT;
END;

BEGIN;
UPDATE animals
SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')  WHERE name='Angemon' OR name='Boarmon';
COMMIT;
END;

/* add necesary information into the vet table */
INSERT INTO vets (name,age,date_of_graduation)
VALUES  ('William Tatcher',45,'2000-04-23'),
        ('Maisy Smith',26,'2019-01-17'),
        ('Stephanie Mendez',64,'1981-05-04'),
        ('Jack Harkness',38,'2008-06-08');
/* using the vets and species id to differentiate them*/
INSERT INTO specializations (vets_id,species_id)
VALUES  (1,1), 
        (3,2),
        (3,1),
        (4,2);

/* add data to the visit table*/
INSERT INTO visits (vets_id,animals_id,visit_date)
VALUES 
    (1,(SELECT id from animals where name = 'Agumon'),'2020-05-24'),
    (3,(SELECT id from animals where name = 'Agumon'),'2020-07-22'),
    (4,(SELECT id from animals where name = 'Gabumon'),'2021-02-02'),
    (2,(SELECT id from animals where name = 'Pikachu'),'2020-01-05'),
    (2,(SELECT id from animals where name = 'Pikachu'),'2020-03-08'),
    (2,(SELECT id from animals where name = 'Pikachu'),'2020-05-14'),
    (3,(SELECT id from animals where name = 'Devimon'),'2021-05-04'),
    (4,(SELECT id from animals where name = 'Charmander'),'2021-02-24'),
    (2,(SELECT id from animals where name = 'Plantmon'),'2019-12-21'),
    (1,(SELECT id from animals where name = 'Plantmon'),'2020-08-10'),
    (2,(SELECT id from animals where name = 'Plantmon'),'2021-04-07'),
    (3,(SELECT id from animals where name = 'Squirtle'),'2019-09-29'),
    (4,(SELECT id from animals where name = 'Angemon'),'2020-10-03'),
    (4,(SELECT id from animals where name = 'Angemon'),'2020-11-04'),
    (2,(SELECT id from animals where name = 'Boarmon'),'2019-01-24'),
    (2,(SELECT id from animals where name = 'Boarmon'),'2019-05-15'),
    (2,(SELECT id from animals where name = 'Boarmon'),'2020-02-27'),
    (2,(SELECT id from animals where name = 'Boarmon'),'2020-08-03'),
    (3,(SELECT id from animals where name = 'Blossom'),'2020-05-24'),
    (1,(SELECT id from animals where name = 'Blossom'),'2021-01-11');


























