-- Table: moment

-- DROP TABLE moment;

CREATE TABLE moment
(
  id integer NOT NULL,
  start_time interval,
  end_time interval,
  channelchunk_pkey integer,
  channel_pkey integer,
  speaker_pkey integer,
  transcript_pkey integer,
  CONSTRAINT moment_pkey PRIMARY KEY (id),
  CONSTRAINT moment_channel_pkey_fkey FOREIGN KEY (channel_pkey)
      REFERENCES channel (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moment_channelchunk_pkey_fkey FOREIGN KEY (channelchunk_pkey)
      REFERENCES channelchunk (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moment_speaker_pkey_fkey FOREIGN KEY (speaker_pkey)
      REFERENCES speaker (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT moment_transcript_pkey_fkey FOREIGN KEY (transcript_pkey)
      REFERENCES transcript (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE moment
  OWNER TO postgres;
