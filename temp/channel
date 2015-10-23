-- Table: channel

-- DROP TABLE channel;

CREATE TABLE channel
(
  id integer NOT NULL,
  name character varying,
  "number" integer,
  mission_pkey integer,
  CONSTRAINT channel_pkey PRIMARY KEY (id),
  CONSTRAINT channel_mission_pkey_fkey FOREIGN KEY (mission_pkey)
      REFERENCES mission (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE channel
  OWNER TO postgres;
