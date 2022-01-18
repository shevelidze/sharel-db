CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    registration_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp
);
CREATE TABLE refreshSessions (
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    refresh_token_hash TEXT PRIMARY KEY,
    user_agent TEXT NOT NULL,
    ip_address TEXT NOT NULL,
    authentification_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp
);
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    creation_timestamp TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp,
    user_id INT REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id)
);
CREATE TABLE views (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id)
);
CREATE TABLE subscriptions (
    subscriber_user_id INT REFERENCES users(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id),
    PRIMARY KEY (subscriber_user_id, user_id)
);
