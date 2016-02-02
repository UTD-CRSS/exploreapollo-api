# Apollo Project - API Server

![NASA](./NASA_logo.png?raw=true)

## Development

This project requires ruby 2.3

## Setup

bundle install

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

## Generate ERD Diagram

```
bundle exec rake erd filename=db/erd
```
