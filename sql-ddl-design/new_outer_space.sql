DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    moons TEXT[]
);

CREATE TABLE galaxies
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE orbits_around
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planet_info
(
    id SERIAL PRIMARY KEY,  
    planet_id INTEGER REFERENCES planets(id) ON DELETE CASCADE,
    galaxy_id INTEGER REFERENCES galaxies(id) ON DELETE SET NULL,
    orbit_id INTEGER REFERENCES orbits_around(id) ON DELETE SET NULL,
    orbit_time_yrs FLOAT
);

INSERT INTO planets
  (name, moons)
VALUES
  ('Earth', '{"The Moon"}'),
  ('Mars', '{"Phobos", "Deimos"}'),
  ('Venus', '{}'),
  ('Neptune', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', '{}'),
  ('Gliese 876 b', '{}');

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO orbits_around
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planet_info
  (planet_id, galaxy_id, orbit_id, orbit_time_yrs)
VALUES
  (1, 1, 1, 1),
  (2, 1, 1, 1.88),
  (3, 1, 1, 0.62),
  (4, 1, 1, 164.8),
  (5, 1, 2, .03),
  (6, 1, 3, 0.23);
