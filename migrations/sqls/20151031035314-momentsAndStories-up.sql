CREATE TABLE stories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  created TIMESTAMP WITH TIME ZONE DEFAULT (now() at time zone 'utc')
);

CREATE TABLE moments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  met_start BIGINT NOT NULL,
  met_end BIGINT NOT NULL,
  created TIMESTAMP WITH TIME ZONE DEFAULT (now() at time zone 'utc')
);

CREATE TABLE moment_channel_join (
  id SERIAL PRIMARY KEY,
  moment_id INTEGER REFERENCES moments (id) NOT NULL,
  channel_id INTEGER REFERENCES channels (id) NOT NULL
);

CREATE TABLE moment_story_join (
  id SERIAL PRIMARY KEY,
  moment_id INTEGER REFERENCES moments (id) NOT NULL,
  story_id INTEGER REFERENCES stories (id) NOT NULL
);
