-- Add up migration script here
CREATE TABLE blogs(
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    content text NOT NULL,
    author varchar(100) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp DEFAULT CURRENT_TIMESTAMP
);

