const _ = require('lodash');

function Moment(rawMoment) {
    return Object.assign(_.pick(rawMoment, [
        'id',
        'name',
        'title',
        'description'
    ]), {
        metStart: rawMoment.met_start,
        metEnd: rawMoment.met_end,
        created: new Date(rawMoment.created)
    });
}

Moment.getByStoryId = function(storyId, client) {
    return new Promise(function(resolve, reject) {
        client.query(
            `
            SELECT * FROM public.moment_story_join
            INNER JOIN moments ON moments.id = moment_story_join.moment_id
            WHERE moment_story_join.story_id = $1
            `,
            [storyId],
            (err, result) => {
                if (err) {
                    return reject(err);
                }

                resolve(
                    result.rows.map((moment) => {
                        return Moment(moment);
                    })
                );
            }
        );
    });
}

module.exports = Moment;
