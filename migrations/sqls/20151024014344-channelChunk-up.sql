/* Replace with your SQL commands */
CREATE TABLE missions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  met_start_time TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE channels (
  id SERIAL PRIMARY KEY,
  mission INTEGER REFERENCES missions (id) NOT NULL,
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT
);

CREATE TABLE channel_chunks (
  id SERIAL PRIMARY KEY,
  channel INTEGER REFERENCES channels (id) NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  met_start BIGINT NOT NULL,
  met_end BIGINT NOT NULL
);
