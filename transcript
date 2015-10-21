-- Table: transcript

-- DROP TABLE transcript;

CREATE TABLE transcript
(
  id integer NOT NULL,
  text text,
  start_time interval,
  end_time interval,
  channelchunk_pkey integer,
  channel_pkey integer,
  speaker_pkey integer,
  CONSTRAINT transcript_pkey PRIMARY KEY (id),
  CONSTRAINT transcript_channel_pkey_fkey FOREIGN KEY (channel_pkey)
      REFERENCES channel (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT transcript_channelchunk_pkey_fkey FOREIGN KEY (channelchunk_pkey)
      REFERENCES channelchunk (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT transcript_speaker_pkey_fkey FOREIGN KEY (speaker_pkey)
      REFERENCES speaker (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE transcript
  OWNER TO postgres;
