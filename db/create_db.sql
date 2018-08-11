DROP TABLE IF EXISTS clases;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  join_date DATE DEFAULT CURRENT DATE,
  enabled INT NOT NULL DEFAULT 1
);

CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  member_id INT REFERENCES members(id) ON DELETE CASCADE
);
