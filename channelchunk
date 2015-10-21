-- Table: channelchunk

-- DROP TABLE channelchunk;

CREATE TABLE channelchunk
(
  id integer NOT NULL,
  url character varying,
  start_time interval,
  end_time interval,
  channel_pkey integer,
  CONSTRAINT channelchunk_pkey PRIMARY KEY (id),
  CONSTRAINT channelchunk_channel_pkey_fkey FOREIGN KEY (channel_pkey)
      REFERENCES channel (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE channelchunk
  OWNER TO postgres;
