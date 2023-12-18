-- TABLE
CREATE TABLE groups (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255)
);
CREATE TABLE product (
   id INTEGER PRIMARY KEY,
   name VARCHAR(255) UNIQUE,
   price FLOAT NOT NULL
);
CREATE TABLE shop (
   id INTEGER PRIMARY KEY,
   name VARCHAR(255) UNIQUE,
   balance FLOAT NOT NULL
);
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  group_id INTEGER NOT NULL
);
CREATE TABLE student_marks (
  student_id INTEGER PRIMARY KEY,
  math_mark_average FLOAT,
  physics_mark_average FLOAT,
  python_mark_average FLOAT
);
CREATE TABLE warehouse (
   shop_id INTEGER REFERENCES shop (id),
   product_id INTEGER REFERENCES product (id),
   quantity INTEGER NOT NULL,
   PRIMARY KEY (shop_id, product_id)
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
