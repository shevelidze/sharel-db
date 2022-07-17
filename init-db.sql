DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS sessions CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS likes CASCADE;
DROP TABLE IF EXISTS views CASCADE;
DROP TABLE IF EXISTS subscriptions CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    registration_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL
);

CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    refresh_token_id INT NOT NULL DEFAULT 1,
    user_id INT REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    user_agent TEXT NOT NULL,
    ip_address TEXT NOT NULL,
    authentification_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    last_used_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    creation_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    user_id INT REFERENCES users(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE NOT NULL,
    user_id INT REFERENCES users(id) NOT NULL
);

CREATE TABLE views (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE NOT NULL,
    user_id INT REFERENCES users(id) NOT NULL
);

CREATE TABLE subscriptions (
    subscriber_user_id INT REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    user_id INT REFERENCES users(id) NOT NULL,
    PRIMARY KEY (subscriber_user_id, user_id)
);
