/* This will drop/delete the tables every time you run the migration script, thus ensuring you're starting with a clean slate. */
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS candidates;

CREATE TABLE parties (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE candidates (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  industry_connected BOOLEAN NOT NULL,
  party_id INTEGER UNSIGNED,
  /* because foreignkey references parties table it must be created first */
  CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);