# Apollo Project - API Server

![NASA](./NASA_logo.png?raw=true)

[![Build Status](https://travis-ci.org/UTD-CRSS/exploreapollo-api.svg?branch=master)](https://travis-ci.org/UTD-CRSS/exploreapollo-api)
[![Code Climate](https://codeclimate.com/github/UTD-CRSS/exploreapollo-api/badges/gpa.svg)](https://codeclimate.com/github/UTD-CRSS/exploreapollo-api)

## Development

This project requires ruby 2.7.1

## Postgres Setup

1. Install pg Admin 4 to your local machine.
2. Install Postgres 9.6 to your local machine
   - Use default port 5432, or note down your port if you have to change it.
   - Create a simple root password for 'postgres' account, and remember this
3. Launch pg Admin 4.
   - Create connection to 'localhost' using port '5432' (or the port you changed to during installation). Also use user postgres with your root password that you created.
   - Right click on localhost>Databases on the left, and click Create Database. Name the database 'explore_api_test'.
   - Right click on localhost>Login/Group Roles, and click Create Login/Group Role. Name the role 'exploreapollo'. Do not assign any privileges or make any other changes to the role.
4. On pg Admin 4, create a connection to the exploreapollo database using the proper credentials.
5. Right click on the exploreapollo database under the exploreapollo connection. Click "Backup..." and then save the backup as a SQL file on your local machine.
6. Look back at your localhost connection, and right click on your explore_api_test database. Click "Restore..." and then select to view SQL files in the bottom right of the prompt. Then select the SQL file you just took as a backup from exploreapollo.
7. At this point, your explore_api_test should be populated the same as the remote database! You should test any changes on this version with the API running locally before you make any changes to the database! CHANGES TO THE REMOTE DATABASE WILL IMMEDIATELY REFLECT ON THE LIVE WEBSITE.

Note: Please do NOT run the ruby db schema load commands, etc, and simply make any changes using pg Admin.

## Setup

bundle install

### Dev setup

1. Copy .env.sample to .env
2. Fill out the placeholder values
3. Add the following lines to your .env file:
   - export RAILS_ENV=development
   - export DATABASE_URL=postgres://postgres:pwdyoucreated@localhost:5432/explore_api_test

This will ensure that you are using the local database.

To run the server on port `4060` you could run `source .env && bundle exec rails s -p 4060`

## Configuration

App configuration is located in config/explore_app.yml

ENV vars need to be set in production

| Var                | Desc                                               |
| ------------------ | -------------------------------------------------- |
| `DATABASE_URL`     | Url of database                                    |
| `AWS_ACCESS_KEY`   | AWS Access                                         |
| `AWS_SECRET_KEY`   | AWS Secret                                         |
| `CACHE_BUCKET`     | Name of the bucket to store cached audio.          |
| `AUDIO_SERVER_URL` | Location of audio server (Without trailing slash). |
| `BACKEND_API_KEY`  | Key used to secure access to backend API.          |

## API Routes for web server

| endpoint                       | optional params                     | method | description                                                                             |
| ------------------------------ | ----------------------------------- | ------ | --------------------------------------------------------------------------------------- |
| `/api/moments/:id`             |                                     | GET    | return an audio streaming URL                                                           |
| `/api/moments/:id/transcripts` | `start_time` `end_time`             | GET    | transcripts within given moment.                                                        |
| `/api/transcripts`             | `start_time` `end_time` `moment_id` | GET    | return all transcripts                                                                  |
| `/api/stories`                 |                                     | GET    | return all metadata for all available stories                                           |
| `/api/stories/:id`             |                                     | GET    | return all metadata of story with provided ID                                           |
| `/api/transcript_items/search` | `q`                                 | GET    | returns transcript items with text containing the string in `q`                         |
| `/api/moments/search`          | `q`                                 | GET    | returns moments associated with transcript items with text containing the string in `q` |

Feel free to test out with
`curl -H "Authorization: Token token=<put token here>" http://localhost:4060/api/moments/search?q=sil`

## Backend Resources

| Resource           | Fields                                           | Associations                                  |
| ------------------ | ------------------------------------------------ | --------------------------------------------- |
| `missions`         | `title` `description` `start_time`               |                                               |
| `people`           | `name` `title` `photo_url`                       |                                               |
| `audio_segments`   | `title` `url` `met_start` `met_end`              | `channel_id`                                  |
| `channels`         | `title` `description`                            | `transcript_part_ids` `audio_segment_ids`     |
| `transcript_items` | `text` `met_start` `met_end`                     | `person_id` `channel_id`                      |
| `stories`          | `title` `description`                            | `moment_ids`                                  |
| `moments`          | `title` `description` `met_start` `met_end`      | `channel_ids` `story_ids`                     |
| `metrics`          | `type` `met_start` `met_end` `data`              | `channel_id`                                  |
| `media`            | `url` `title` `description` `caption` `alt_text` | `mission_id`                                  |
| `media_attachment` | `media_id` `met_start` `met_end`                 | `media_attachable_type` `media_attachable_id` |

## Generate ERD Diagram

```
bundle exec rake erd filename=db/erd
```
