# Apollo Project - API Server

![NASA](./NASA_logo.png?raw=true)

## Development

This project requires ruby 2.3

## Setup

bundle install

## API Routes for web server

endpoint | optional params | method | description
--- | --- | --- | ---
`/api/moments/:id` | | GET | return an audio streaming URL
`/api/moments/:id/transcripts` | `start_time` `end_time` |GET | transcripts within given moment. 
`/api/transcripts` | `start_time` `end_time` `moment_id` | GET | return all transcripts
`/api/stories` | | GET | return all metadata for all available stories
`/api/stories/:id` | | GET | return all metadata of story with provided ID

