CREATE OR REPLACE FUNCTION add_channel_chunks() RETURNS SETOF channel_chunks AS $$
DECLARE
    DECLARE mission integer;
    DECLARE booster_channel integer;
    DECLARE met_start integer;
    DECLARE met_end integer;
    BEGIN
    		select 369300000 into met_start;
    		select 370500000 into met_end;
            select id from missions where name = 'Apollo11' into mission;
            select id from channels where name = 'Booster' into booster_channel;
            select id from channels where name = 'Booster' into booster_channel;

            insert into channel_chunks (channel, url, name, met_start, met_end) VALUES 
            (booster_channel, 'https://exploreapollo-data.s3.amazonaws.com/audio/Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav', '19_BOOSTER-R_20July_20-07-00.wav', met_start, met_end);
            return query select * from channel_chunks;

    END;
$$ LANGUAGE plpgsql;

SELECT add_channel_chunks()
