CREATE TABLE speakers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  title TEXT NOT NULL,
  photo_url TEXT NOT NULL
);

CREATE TABLE transcript_parts (
  id SERIAL PRIMARY KEY,
  message TEXT NOT NULL,
  met_start BIGINT NOT NULL,
  met_end BIGINT NOT NULL,
  speaker_id INTEGER REFERENCES speakers (id) NOT NULL,
  channel_id INTEGER REFERENCES channels (id) NOT NULL
);
