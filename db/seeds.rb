# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Channels
# title, slug, description
# chan_data = [
#   ['Flight Director', 'FLIGHT', 'Responsible for overall Shuttle mission and payload operations'],
#   ['Spacecraft Communicator', 'CAPCOM', 'Communications link between flight control and astronauts. Acronym was created when spacecraft were referred to as "capsules.'],
#   ['Flight Dynamics Officer', 'FDO', 'Pronounced "fido" -- plans maneuvers and monitors trajectory'],
#   ['Guidance Procedures Officer', 'GPO', 'Monitors onboard navigation and guidance computer software'],
#   ['Data Processing System (Engineer)', 'DPS', 'Monitors the data processing system of computers'],
#   ['Surgeon', 'Surgeon', 'A medical doctor on staff'],
#   ['Booster Engineer', 'Booster', 'Monitors the main engine, Solid Rocket Boosters and External Tank from pre-launch to ascent phases of missions'],
#   ['Payload Deploy Retrieval System', 'PDRS', 'Monitors operation of the remote manipulator system'],
#   ['Propulsion Engineer', 'PROP', 'Monitors reaction control and orbital maneuvering propellants'],
#   ['Guidance, Navigation and Controls System Engineer', 'GNC', 'Monitors vehicle guidance and navigation systems'],
#   ['Electrical, Environmental and Consumables Manager', 'EECOM', 'Responsible for passive and active thermal controls of the vehicle, cabin atmosphere, supply systems and fire detection'],
#   ['Electrical Generation and Illumination Engineer', 'EGIL', 'Monitors electrical systems'],
#   ['Instrumentation and Communications Officer', 'INCO', 'Monitors in-flight communications and instrumentation systems'],
#   ['Russian Interface Operator', 'RIO', 'Liaison between U.S. and Russian Control teams'],
#   ['Ground Controller', 'GC', 'Responsible for telemetry and command in the MCC and directs maintenance and operation activities'],
#   ['Flight Activities Officer', 'FAO', 'Plans crew activities'],
#   ['Payloads Officer', 'PAYLOAD', 'Coordinates activities involving the payload'],
#   ['Maintenance, Mechanical, Arm and Crew Systems', 'MMACS', 'Monitors the Orbiter''s structural and mechanical system'],
#   ['Public Affairs Officer', 'PAO', 'Provides commentary and mission information to the media and public'],
#   ['Mission Operations Directorate Manager', 'MOD', 'Link from the Flight Control Room to top NASA and JSC mission operations directorate management']
# ]

# story_data = [
#   ["apollo_launch", "Apollo Launch", "Launch Sequence of Apollo  11 Mission"],
#   ["lunar_landing", "Lunar Landing", "When the lunar module enters the lunar orbit  some interesting, tensed and nail-biting techincal challenges are encountered and are solved."],
#   ["moon_walk", "Moon Surface Walk", "A Walk on the moon"],
#   ["apollo_touchdown", "Apollo Touchdown", "Lunar module's re-entry to earths atmosphere and water landing"]
# ]

# moment_data = [
#   ["Landing sequence start", "Landing sequence start", "Lunar Landing Sequence Initiated",735673141, 735816243],
#   ["Alarm Solving", "Alarm Solving", "Scientists solving the Alarm Issue",735891591, 735934364],
#   ["Fuel Venting", "Fuel Venting", "Fuel venting for course correction to land at right location on the moon.",736463875, 736624693],
#   ["Final Landing Sequence", "Final Landing Sequence", "Final stages for landing on the moon",736244812, 736344897],
#   ["Alarm", "Alarm", "Instant larm started ringing while starting the lunar landing",735935162, 735998977],
# ]

# # Mission
# mission = Mission.find_or_create_by(
#   title: "Apollo 11",
#   description: "The first spaceflight that landed humans on the Moon",
#   start_time: DateTime.parse('1969-07-16 13:32:00+01')
# )

# chan_data.each do |item|
#   chan = Channel.find_or_create_by description: item[2], title: item[1]
#   chan.mission = mission
#   chan.save!
# end


# story_data.each do |item|
#   story = Story.find_or_create_by title: item[1], description: item[2]
#   story.save!
# end
# first_story = Story.friendly.find("apollo-launch")

# moment_data.each do |item|
#   moment = Moment.find_or_create_by title: item[1], description: item[2], met_start: item[3], met_end: item[4]
#   first_story.moments << moment
#   moment.save!
# end

# # Dev data
# if Rails.env != "production"
#   channel = Channel.friendly.find("booster")

#   met_data = {
#     met_start: 735673141,
#     met_end: 736673141,
#     data: { count: 42 }
#   }
#   metric = WordCount.find_by(met_start: met_data[:met_start], met_end: met_data[:met_end])
#   metric = WordCount.create met_data if metric.nil?
#   metric.data = met_data[:data]
#   metric.channel = channel
#   metric.save!

#   # Audio Segments
#   cc = AudioSegment.find_or_create_by(
#     met_start: 735673141,
#     met_end: 736673141,
#     title: "Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav",
#     url: 'https://exploreapollo-data.s3.amazonaws.com/audio/Tape885_20July_20-07-00_HR2U_LunarLanding/19_BOOSTER-R_20July_20-07-00.wav',
#     slug: '19_BOOSTER-R_20July_20-07-00.wav'
#   )
#   cc.channel = channel
#   cc.save!

#   Moment.all.each do |moment|
#     moment.channels << channel
#   end

#   # TranscriptPart
#   tr = TranscriptItem.find_or_create_by(
#     text: "Something said",
#     met_start: 735673141,
#     met_end: 735816243
#   )

#   sp = Person.find_or_create_by name: "Speaker", title: "title"

#   tr.person = sp
#   channel.transcript_items << tr

#   tr.save!

  tapes = [
    ["T870", "T870", -14558954, -14532287]
  ]

  tapes.each_with_index do |(title, slug, met_start, met_end), index|
    Tape.find_or_create_by(title: title, slug: slug, met_start: met_start, met_end: met_end)
  end


  #MultiChannel
  # operation, audioUrl, mission_id, channel_name, block_index, nugget_index, tape_id
  multi_chan = [
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-01.wav", 1, 'mocr', 1, 1, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-02.wav", 1, 'mocr', 1, 2, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-01.wav", 1, "flight-director", 1, 1, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-02.wav", 1, 'flight-director', 1, 2, 1],

  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-03.wav", 1, "flight-director", 1, 3, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-04.wav", 1, "flight-director", 1, 4, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-05.wav", 1, "flight-director", 1, 5, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-06.wav", 1, "flight-director", 1, 6, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-01.wav", 1, "flight-director", 2, 1, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-02.wav", 1, "flight-director", 2, 2, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-03.wav", 1, "flight-director", 2, 3, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-04.wav", 1, "flight-director", 2, 4, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-05.wav", 1, "flight-director", 2, 5, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-06.wav", 1, "flight-director", 2, 6, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-03.wav", 1, "mocr", 1, 3, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-04.wav", 1, "mocr", 1, 4, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-05.wav", 1, "mocr", 1, 5, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-06.wav", 1, "mocr", 1, 6, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-01.wav", 1, "mocr", 2, 1, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-02.wav", 1, "mocr", 2, 2, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-03.wav", 1, "mocr", 2, 3, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-04.wav", 1, "mocr", 2, 4, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-05.wav", 1, "mocr", 2, 5, 1],
  ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-06.wav", 1, "mocr", 2, 6, 1]
] 

transcribers=[
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-01.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-02.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-01.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-02.trs"],

  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-03.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-04.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-05.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-06.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-01.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-02.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-03.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-04.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-05.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-06.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-03.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-04.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-05.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-06.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-01.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-02.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-03.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-04.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-05.trs"],
  ["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-06.trs"]
]

multi_chan.each_with_index do |(operation, audioUrl, missionId, channelName, blockIndex, nuggetIndex, tape), index|
  channel = MultiChannel.find_or_create_by(operation: operation, audioUrl: audioUrl, mission_id: missionId, channel_name: channelName, block_index: blockIndex, nugget_index: nuggetIndex, tape_id: tape)
  Transcriber.find_or_create_by(transcriberUrl: transcribers[index][0], multi_channel_id: channel.id)
end
