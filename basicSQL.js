var SelectTranscript = "SELECT transcript_parts.id, transcript_parts.met_start, transcript_parts.message, transcript_parts.speaker_id, speakers.name, transcript_parts.ChannelID\
                        FROM (\
                            SELECT * FROM transcript_parts WHERE met_start  >= $1 AND met_start <= $2\
                        )\
                        INNER JOIN speakers\
                        ON transcript_parts.speaker_id = speakers.id\
                        ORDER BY transcript_parts.met_start ASC";
var GenerateStreamingURL = "SELECT moments.id, moments.title, moments.met_start, moments.met_end\
                        FROM (\
                            SELECT channel_id, moment_id FROM moment_channel_join ON moment_channel_join.moment_id = $1\
                        )\
                        INNER JOIN moments\
                        ON moments.id = moment_channel_join.moment_id\
                        ORDER BY moment_channel_join.channel_id ASC";

exports.SelectTranscript = SelectTranscript;
exports.GenerateStreamingURL = GenerateStreamingURL;
