# Apollo Project - API Server

![NASA](./NASA_logo.png?raw=true)

[![Build Status](https://travis-ci.org/UTD-CRSS/exploreapollo-api.svg?branch=master)](https://travis-ci.org/UTD-CRSS/exploreapollo-api)
[![Code Climate](https://codeclimate.com/github/UTD-CRSS/exploreapollo-api/badges/gpa.svg)](https://codeclimate.com/github/UTD-CRSS/exploreapollo-api)

## Development

This project requires ruby 2.3

## Setup

bundle install

### Dev setup

1. Copy .env.sample to .env
2. Fill out the placeholder values

To run the server on port `4060` you could run `source .env && bundle exec rails s -p 4060`

## Configuration
App configuration is located in config/explore_app.yml

ENV vars need to be set in production

| Var | Desc|
|-----|-----|
|`DATABASE_URL`|Url of database|
|`AWS_ACCESS_KEY`|AWS Access|
|`AWS_SECRET_KEY`|AWS Secret|
|`CACHE_BUCKET` |Name of the bucket to store cached audio.|
|`AUDIO_SERVER_URL`|Location of audio server (Without trailing slash).|
|`BACKEND_API_KEY`| Key used to secure access to backend API. |

## API Routes for web server

endpoint | optional params | method | description
--- | --- | --- | ---
`/api/moments/:id` | | GET | return an audio streaming URL
`/api/moments/:id/transcripts` | `start_time` `end_time` |GET | transcripts within given moment.
`/api/transcripts` | `start_time` `end_time` `moment_id` | GET | return all transcripts
`/api/stories` | | GET | return all metadata for all available stories
`/api/stories/:id` | | GET | return all metadata of story with provided ID
`/api/transcript_items/search`|`q`|GET|returns transcript items with text containing the string in `q`
`/api/moments/search`|`q`|GET|returns moments associated with transcript items with text containing the string in `q`

Feel free to test out with 
`curl -H "Authorization: Token token=<put token here>" http://localhost:4060/api/moments/search?q=sil`

## Backend Resources

|Resource|Fields|Associations|
|------|-------|-------|
|`missions`|`title` `description` `start_time`||
|`people`|`name` `title` `photo_url`||
|`audio_segments`|`title` `url` `met_start` `met_end`|`channel_id`|
|`channels`|`title` `description`|`transcript_part_ids` `audio_segment_ids`|
|`transcript_items`|`text` `met_start` `met_end`|`person_id` `channel_id`|
|`stories`|`title` `description`|`moment_ids`|
|`moments`|`title` `description` `met_start` `met_end`|`channel_ids` `story_ids`|
|`metrics`|`type` `met_start` `met_end` `data`|`channel_id`|
|`media`|`url` `title` `description` `caption` `alt_text`| `mission_id`|
|`media_attachment`|`media_id` `met_start` `met_end`|`media_attachable_type` `media_attachable_id`|



## Generate ERD Diagram

```
bundle exec rake erd filename=db/erd
```
