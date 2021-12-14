/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species string,
    PRIMARY KEY (id)

);

/* add two new tables.. owners and species. */
CREATE TABLE owners (
    id SERIAL PRIMARY KEY NOT NULL,
    full_name varchar(100) NOT NULL,
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL
);

/*remove species coloum in animal table. */
ALTER TABLE animals
DROP COLUMN species

/*adding two columns to be used as foreign reference keys*/

ALTER TABLE animals
    ADD species_id INT,
    ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
    ADD owners_id INT,
    ADD CONSTRAINT owners_id FOREIGN KEY(owners_id) REFERENCES owners(id);

/*add vets table and specialization table to create the many to many relationship*/

CREATE TABLE vets (
    id SERIAL PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

/*join table to handle the relationship between vets and species tables*/
CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    CONSTRAINT vets_id FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id)
);

/*join table to handle the relationship between vets and animals tables*/
CREATE TABLE visits (
    vets_id INT,
    visit_date DATE,
    animals_id INT,
    CONSTRAINT vets_id FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT animals_id FOREIGN KEY(animals_id) REFERENCES animals(id)
);

/*ALTER TABLE visits 
ADD visit_date DATE;*/



ALTER TABLE owners ADD COLUMN email VARCHAR(120);










