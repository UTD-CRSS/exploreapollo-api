const _ = require('lodash');
const Moment = require('./Moment');

function Story(rawStory) {
    return Object.assign(_.pick(rawStory, [
        'id',
        'name',
        'title',
        'description'
    ]), {
        created: new Date(rawStory.created),
        momentList: []
    });
};

Story.getById = function(id, client) {
    return new Promise(function (resolve, reject) {
        client.query(
            "SELECT * FROM stories WHERE id = $1",
            [id],
            (err, result) => {
                if (err) {
                    reject(err);
                }
                if (result.rows.length < 1) {
                    return reject({
                        message: "Couldn't find a story with that ID"
                    });
                }
                Moment
                .getByStoryId(id, client)
                .then((moments) => {
                    resolve(
                        Story.addMoments(
                            Story(result.rows[0]),
                            moments
                        )
                    );
                });
            }
        );
    });
}

Story.getAll = function(options, client) {
    return new Promise(function (resolve, reject) {
        // TODO: Pagination
        client.query(
            "SELECT * FROM public.stories",
            [],
            (err, result) => {
                // TODO: dry these error checks up
                if (err) {
                    return reject(err);
                }
                if (result.rows < 1) {
                    return reject({message: "no stories"});
                }

                Promise.all(result.rows.map((story) => {
                    return Moment.getByStoryId(story.id, client);
                })).then((moments) => {
                    resolve(
                        result.rows.map((story, index) => {
                            // TODO: this is an obviously leaky query, needs fixing
                            // and or caching
                            return Story.addMoments(
                                Story(story),
                                moments[index]
                            );
                        })
                    );
                });
            }
        );
    });
}

Story.addMoments = function(story, moments) {
    if (_.isArray(story.momentList)) {
        story.momentList = [].concat(story.momentList, moments);
    }
    return story
};

module.exports = Story;
