-- TABLE
CREATE TABLE worker (
    worker_id INTEGER PRIMARY KEY,
    shop_id INTEGER REFERENCES product (id),
    name VARCHAR(255),
    salary INTEGER NOT NULL,
    position VARCHAR(255)
  );
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
