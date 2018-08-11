DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS members;


CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE instructors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  profile VARCHAR(255)
);

CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  session_time TIME,
  class_id INT REFERENCES classes(id),
  instructor_id INT REFERENCES instructors(id),
  member_id INT REFERENCES members(id),
  capacity INT
);
