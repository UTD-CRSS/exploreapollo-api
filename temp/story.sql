-- Table: story

-- DROP TABLE story;

CREATE TABLE story
(
  id integer NOT NULL,
  description character varying,
  rating character varying,
  moment_pkey integer,
  CONSTRAINT story_pkey PRIMARY KEY (id),
  CONSTRAINT story_moment_pkey_fkey FOREIGN KEY (moment_pkey)
      REFERENCES moment (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE story
  OWNER TO postgres;
