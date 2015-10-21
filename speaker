-- Table: speaker

-- DROP TABLE speaker;

CREATE TABLE speaker
(
  id integer NOT NULL,
  fname character varying,
  lname character varying,
  year integer,
  channel_pkey integer,
  CONSTRAINT speaker_pkey PRIMARY KEY (id),
  CONSTRAINT speaker_channel_pkey_fkey FOREIGN KEY (channel_pkey)
      REFERENCES channel (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE speaker
  OWNER TO postgres;
