//*********************************************************************************// 
//********************** Library of frequently used sequel ************************//
//*********************************************************************************//


// be cautious for transcripts close to the boundaries
var SelectAllTranscriptsWithinGivenInterval = 
                        "SELECT tmp.id, tmp.message, tmp.met_start, tmp.met_end, tmp.channel_id, tmp.speaker_id, speakers.name\
                            FROM\
                            (\
                                (\
                                    SELECT id, message, met_start, met_end, channel_id, speaker_id FROM transcript_parts\
                                    WHERE channel_id IN (\
                                        SELECT channel_id FROM moment_channel_join WHERE moment_id = $1\
                                    ) AND met_start >= $2 AND met_start <= $3\
                                ) AS tmp\
                                INNER JOIN speakers ON tmp.speaker_id = speakers.id\
                            ) ORDER BY tmp.met_start ASC"; 

var GenerateStreamingURL = 
                    "SELECT tmp.moment_id, tmp.channel_id, moments.title, moments.met_start, moments.met_end\
                        FROM(\
                            (\
                                SELECT moment_id, channel_id FROM moment_channel_join WHERE moment_id = $1\
                            ) AS tmp\
                            INNER JOIN moments ON moments.id = tmp.moment_id)\
                        ORDER BY tmp.channel_id ASC";
var SelectAllMomentsOfGivenStory = 
                   "SELECT tmp2.story_id, stories.title as story_title, stories.description as story_description,\
                           tmp2.moment_id, tmp2.title as moment_title, tmp2.moment_order, tmp2.met_start,\
                           tmp2.met_end, tmp2.description as moment_description\
                        FROM\
                          (\
                            (\
                                (\
                                   SELECT story_id, moment_id, moment_order\
                                   FROM moment_story_join WHERE story_id = $1\
                                ) AS tmp\
                                INNER JOIN moments ON tmp.moment_id = moments.ID\
                            ) AS tmp2\
                            INNER JOIN stories ON tmp2.story_id = stories.id\
                          )\
                        ORDER BY tmp2.moment_order ASC";

exports.SelectAllTranscriptsWithinGivenInterval = SelectAllTranscriptsWithinGivenInterval;
exports.GenerateStreamingURL = GenerateStreamingURL;
exports.SelectAllMomentsOfGivenStory = SelectAllMomentsOfGivenStory;
