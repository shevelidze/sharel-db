CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(10) NOT NULL,
    email VARCHAR(10) NOT NULL UNIQUE
);