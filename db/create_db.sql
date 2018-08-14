DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS classes;


CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255)
);

CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  instructor VARCHAR (255),
  description VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  start_time TIME,
  gym_class_id INT REFERENCES classes(id) ON DELETE CASCADE,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  capacity INT
);
