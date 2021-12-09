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
