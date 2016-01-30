# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Mission
mission = Mission.find_or_create_by(
  slug: "Apollo 11", 
  start_time: DateTime.parse('1969-07-16 13:32:00+01')
)

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

chan_data.each do |item|
  chan = Channel.find_or_create_by title: item[0], slug: item[1], description: item[2]
  chan.mission = mission
  chan.save!
end  

# Channel Chunks
channel = Channel.where(slug: "Booster").first
cc = ChannelChunk.find_or_create_by(
  met_start: 369300000, 
  met_end: 370500000, 
  url: 'https://exploreapollo-data.s3.amazonaws.com/audio/Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav', 
  slug: '19_BOOSTER-R_20July_20-07-00.wav'
)
cc.channel = channel
cc.save!

# Create Sory
story = Story.find_or_create_by slug: "test_story", description: "desc"

# Add moments
moment = Moment.find_or_create_by(
  slug: "test_moment",
  description: "desc",
  met_start: 369300000, 
  met_end: 370500000
)
moment.channels << channel

story.moments << moment
story.save!

# TranscriptPart
tr = TranscriptPart.find_or_create_by(
  text: "Something said",
  met_start: 369300000, 
  met_end: 370500000
)

sp = Speaker.find_or_create_by name: "Speaker"

tr.speaker = sp
channel.transcript_parts << tr

tr.save!
