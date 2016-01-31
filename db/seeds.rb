# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Channels
# title, slug, description
chan_data = [
  ['Flight Director', 'FLIGHT', 'Responsible for overall Shuttle mission and payload operations'],
  ['Spacecraft Communicator', 'CAPCOM', 'Communications link between flight control and astronauts. Acronym was created when spacecraft were referred to as "capsules.'],
  ['Flight Dynamics Officer', 'FDO', 'Pronounced "fido" -- plans maneuvers and monitors trajectory'],
  ['Guidance Procedures Officer', 'GPO', 'Monitors onboard navigation and guidance computer software'],
  ['Data Processing System (Engineer)', 'DPS', 'Monitors the data processing system of computers'],
  ['Surgeon', 'Surgeon', 'A medical doctor on staff'],
  ['Booster Engineer', 'Booster', 'Monitors the main engine, Solid Rocket Boosters and External Tank from pre-launch to ascent phases of missions'],
  ['Payload Deploy Retrieval System', 'PDRS', 'Monitors operation of the remote manipulator system'],
  ['Propulsion Engineer', 'PROP', 'Monitors reaction control and orbital maneuvering propellants'],
  ['Guidance, Navigation and Controls System Engineer', 'GNC', 'Monitors vehicle guidance and navigation systems'],
  ['Electrical, Environmental and Consumables Manager', 'EECOM', 'Responsible for passive and active thermal controls of the vehicle, cabin atmosphere, supply systems and fire detection'],
  ['Electrical Generation and Illumination Engineer', 'EGIL', 'Monitors electrical systems'],
  ['Instrumentation and Communications Officer', 'INCO', 'Monitors in-flight communications and instrumentation systems'],
  ['Russian Interface Operator', 'RIO', 'Liaison between U.S. and Russian Control teams'],
  ['Ground Controller', 'GC', 'Responsible for telemetry and command in the MCC and directs maintenance and operation activities'],
  ['Flight Activities Officer', 'FAO', 'Plans crew activities'],
  ['Payloads Officer', 'PAYLOAD', 'Coordinates activities involving the payload'],
  ['Maintenance, Mechanical, Arm and Crew Systems', 'MMACS', 'Monitors the Orbiter''s structural and mechanical system'],
  ['Public Affairs Officer', 'PAO', 'Provides commentary and mission information to the media and public'],
  ['Mission Operations Directorate Manager', 'MOD', 'Link from the Flight Control Room to top NASA and JSC mission operations directorate management']
]

story_data = [
  ["apollo_launch", "Apollo Launch", "Launch Sequence of Apollo  11 Mission"],
  ["lunar_landing", "Lunar Landing", "When the lunar module enters the lunar orbit  some interesting, tensed and nail-biting techincal challenges are encountered and are solved."],
  ["moon_walk", "Moon Surface Walk", "A Walk on the moon"],
  ["apollo_touchdown", "Apollo Touchdown", "Lunar module's re-entry to earths atmosphere and water landing"]
]

moment_data = [
  ["Landing sequence start", "Landing sequence start", "Lunar Landing Sequence Initiated",735673141, 735816243],
  ["Alarm Solving", "Alarm Solving", "Scientists solving the Alarm Issue",735891591, 735934364],
  ["Fuel Venting", "Fuel Venting", "Fuel venting for course correction to land at right location on the moon.",736463875, 736624693],
  ["Final Landing Sequence", "Final Landing Sequence", "Final stages for landing on the moon",736244812, 736344897],
  ["Alarm", "Alarm", "Instant larm started ringing while starting the lunar landing",735935162, 735998977],
]

# Mission
mission = Mission.find_or_create_by(
  title: "Apollo 11",
  start_time: DateTime.parse('1969-07-16 13:32:00+01')
)

chan_data.each do |item|
  chan = Channel.find_or_create_by description: item[2], title: item[1]
  chan.mission = mission
  chan.save!
end


story_data.each do |item|
  story = Story.find_or_create_by title: item[1], description: item[2]
  story.save!
end
first_story = Story.friendly.find("apollo-launch")

moment_data.each do |item|
  moment = Moment.find_or_create_by title: item[1], description: item[2], met_start: item[3], met_end: item[4]
  first_story.moments << moment
  moment.save!
end

# Dev data
if Rails.env != "production"

  # Channel Chunks
  channel = Channel.friendly.find("booster")
  cc = ChannelChunk.find_or_create_by(
    met_start: 369300000,
    met_end: 370500000,
    name: "Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav",
    url: 'https://exploreapollo-data.s3.amazonaws.com/audio/Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav',
    slug: '19_BOOSTER-R_20July_20-07-00.wav'
  )
  cc.channel = channel
  cc.save!

  Moment.all.each do |moment|
    moment.channels << channel
  end

  # TranscriptPart
  tr = TranscriptPart.find_or_create_by(
    text: "Something said",
    met_start: 735673141,
    met_end: 735816243
  )

  sp = Speaker.find_or_create_by name: "Speaker", title: "title"

  tr.speaker = sp
  channel.transcript_parts << tr

  tr.save!
end
