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
#   ['Guidance, Navigation and Controls System Engineer', 'gnc', 'Monitors vehicle guidance and navigation systems'],
#   ['Electrical, Environmental and Consumables Manager', 'eecom', 'Responsible for passive and active thermal controls of the vehicle, cabin atmosphere, supply systems and fire detection'],
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
  ["T870","t870", "Lift Off", 1, -14558954, -14532287, 1, 2],
  ["T869", "t869", "Lift Off", 1, -14567263, -14538463, 5, 5]
]

tapes.each_with_index do |(title, slug, operation, missionId, met_start, met_end, minBlock, maxBlock), index|
  Tape.find_or_create_by(title: title, slug: slug, operation: operation, mission_id: missionId,met_start: met_start, met_end: met_end, min_block: minBlock, max_block: maxBlock)
end

channels=[
  ["mocr", "MOCR", "MOCR", 1],
  ["network", "NETWORK", "NETWORK", 1]
]

channels.each do |slug, title, description, missionId|
  Channel.create_or_find_by(slug: slug, title: title, description: description, mission_id: missionId)
end
#MultiChannel
# operation, audioUrl, mission_id, channel_name, block_index, nugget_index, tape_id
multi_chan = [
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-01.wav", 1, 'mocr', 1, 1, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-02.wav", 1, 'mocr', 1, 2, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-01.wav", 1, "flight", 1, 1, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-02.wav", 1, 'flight', 1, 2, 1],

["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-03.wav", 1, "flight", 1, 3, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-04.wav", 1, "flight", 1, 4, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-05.wav", 1, "flight", 1, 5, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-06.wav", 1, "flight", 1, 6, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-01.wav", 1, "flight", 2, 1, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-02.wav", 1, "flight", 2, 2, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-03.wav", 1, "flight", 2, 3, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-04.wav", 1, "flight", 2, 4, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-05.wav", 1, "flight", 2, 5, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-02-06.wav", 1, "flight", 2, 6, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-03.wav", 1, "mocr", 1, 3, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-04.wav", 1, "mocr", 1, 4, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-05.wav", 1, "mocr", 1, 5, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-06.wav", 1, "mocr", 1, 6, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-01.wav", 1, "mocr", 2, 1, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-02.wav", 1, "mocr", 2, 2, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-03.wav", 1, "mocr", 2, 3, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-04.wav", 1, "mocr", 2, 4, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-05.wav", 1, "mocr", 2, 5, 1],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-06.wav", 1, "mocr", 2, 6, 1],


["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-01.wav", 1, "gnc", 5, 1, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-02.wav", 1, "gnc", 5, 2, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-03.wav", 1, "gnc", 5, 3, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-04.wav", 1, "gnc", 5, 4, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-05.wav", 1, "gnc", 5, 5, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-06.wav", 1, "gnc", 5, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-01.wav", 1, "gnc", 7, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-02.wav", 1, "gnc", 7, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-03.wav", 1, "gnc", 7, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-04.wav", 1, "gnc", 7, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-05.wav", 1, "gnc", 7, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-07-06.wav", 1, "gnc", 7, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-01.wav", 1, "gnc", 8, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-02.wav", 1, "gnc", 8, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-03.wav", 1, "gnc", 8, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-04.wav", 1, "gnc", 8, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-05.wav", 1, "gnc", 8, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-08-06.wav", 1, "gnc", 8, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-01.wav", 1, "gnc", 9, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-02.wav", 1, "gnc", 9, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-03.wav", 1, "gnc", 9, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-04.wav", 1, "gnc", 9, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-05.wav", 1, "gnc", 9, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-09-06.wav", 1, "gnc", 9, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-01.wav", 1, "gnc", 10, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-02.wav", 1, "gnc", 10, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-03.wav", 1, "gnc", 10, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-04.wav", 1, "gnc", 10, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-05.wav", 1, "gnc", 10, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-10-06.wav", 1, "gnc", 10, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-01.wav", 1, "gnc", 11, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-02.wav", 1, "gnc", 11, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-03.wav", 1, "gnc", 11, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-04.wav", 1, "gnc", 11, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-05.wav", 1, "gnc", 11, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-11-06.wav", 1, "gnc", 11, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-01.wav", 1, "gnc", 12, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-02.wav", 1, "gnc", 12, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-03.wav", 1, "gnc", 12, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-04.wav", 1, "gnc", 12, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-05.wav", 1, "gnc", 12, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-12-06.wav", 1, "gnc", 12, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-01.wav", 1, "gnc", 13, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-02.wav", 1, "gnc", 13, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-03.wav", 1, "gnc", 13, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-04.wav", 1, "gnc", 13, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-05.wav", 1, "gnc", 13, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-13-06.wav", 1, "gnc", 13, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-01.wav", 1, "gnc", 14, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-02.wav", 1, "gnc", 14, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-03.wav", 1, "gnc", 14, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-04.wav", 1, "gnc", 14, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-05.wav", 1, "gnc", 14, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-14-06.wav", 1, "gnc", 14, 6, 2],

["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-01.wav", 1, "eecom", 5, 1, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-02.wav", 1, "eecom", 5, 2, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-03.wav", 1, "eecom", 5, 3, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-04.wav", 1, "eecom", 5, 4, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-05.wav", 1, "eecom", 5, 5, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-06.wav", 1, "eecom", 5, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-01.wav", 1, "eecom", 6, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-02.wav", 1, "eecom", 6, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-03.wav", 1, "eecom", 6, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-04.wav", 1, "eecom", 6, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-05.wav", 1, "eecom", 6, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-06-06.wav", 1, "eecom", 6, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-01.wav", 1, "eecom", 7, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-02.wav", 1, "eecom", 7, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-03.wav", 1, "eecom", 7, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-04.wav", 1, "eecom", 7, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-05.wav", 1, "eecom", 7, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-07-06.wav", 1, "eecom", 7, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-01.wav", 1, "eecom", 8, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-02.wav", 1, "eecom", 8, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-03.wav", 1, "eecom", 8, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-04.wav", 1, "eecom", 8, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-05.wav", 1, "eecom", 8, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-08-06.wav", 1, "eecom", 8, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-01.wav", 1, "eecom", 9, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-02.wav", 1, "eecom", 9, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-03.wav", 1, "eecom", 9, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-04.wav", 1, "eecom", 9, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-05.wav", 1, "eecom", 9, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-09-06.wav", 1, "eecom", 9, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-01.wav", 1, "eecom", 10, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-02.wav", 1, "eecom", 10, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-03.wav", 1, "eecom", 10, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-04.wav", 1, "eecom", 10, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-05.wav", 1, "eecom", 10, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-10-06.wav", 1, "eecom", 10, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-01.wav", 1, "eecom", 11, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-02.wav", 1, "eecom", 11, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-03.wav", 1, "eecom", 11, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-04.wav", 1, "eecom", 11, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-05.wav", 1, "eecom", 11, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-11-06.wav", 1, "eecom", 11, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-01.wav", 1, "eecom", 12, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-02.wav", 1, "eecom", 12, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-03.wav", 1, "eecom", 12, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-04.wav", 1, "eecom", 12, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-05.wav", 1, "eecom", 12, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-12-06.wav", 1, "eecom", 12, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-01.wav", 1, "eecom", 13, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-02.wav", 1, "eecom", 13, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-03.wav", 1, "eecom", 13, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-04.wav", 1, "eecom", 13, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-05.wav", 1, "eecom", 13, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-13-06.wav", 1, "eecom", 13, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-01.wav", 1, "eecom", 14, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-02.wav", 1, "eecom", 14, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-03.wav", 1, "eecom", 14, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-04.wav", 1, "eecom", 14, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-05.wav", 1, "eecom", 14, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-14-06.wav", 1, "eecom", 14, 6, 2],

["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-01.wav", 1, "network", 5, 1, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-02.wav", 1, "network", 5, 2, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-03.wav", 1, "network", 5, 3, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-04.wav", 1, "network", 5, 4, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-05.wav", 1, "network", 5, 5, 2],
["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-06.wav", 1, "network", 5, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-01.wav", 1, "network", 6, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-02.wav", 1, "network", 6, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-03.wav", 1, "network", 6, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-04.wav", 1, "network", 6, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-05.wav", 1, "network", 6, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-06-06.wav", 1, "network", 6, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-01.wav", 1, "network", 7, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-02.wav", 1, "network", 7, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-03.wav", 1, "network", 7, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-04.wav", 1, "network", 7, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-05.wav", 1, "network", 7, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-07-06.wav", 1, "network", 7, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-01.wav", 1, "network", 8, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-02.wav", 1, "network", 8, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-03.wav", 1, "network", 8, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-04.wav", 1, "network", 8, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-05.wav", 1, "network", 8, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-08-06.wav", 1, "network", 8, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-01.wav", 1, "network", 9, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-02.wav", 1, "network", 9, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-03.wav", 1, "network", 9, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-04.wav", 1, "network", 9, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-05.wav", 1, "network", 9, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-09-06.wav", 1, "network", 9, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-01.wav", 1, "network", 10, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-02.wav", 1, "network", 10, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-03.wav", 1, "network", 10, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-04.wav", 1, "network", 10, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-05.wav", 1, "network", 10, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-10-06.wav", 1, "network", 10, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-01.wav", 1, "network", 11, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-02.wav", 1, "network", 11, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-03.wav", 1, "network", 11, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-04.wav", 1, "network", 11, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-05.wav", 1, "network", 11, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-11-06.wav", 1, "network", 11, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-01.wav", 1, "network", 12, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-02.wav", 1, "network", 12, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-03.wav", 1, "network", 12, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-04.wav", 1, "network", 12, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-05.wav", 1, "network", 12, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-12-06.wav", 1, "network", 12, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-01.wav", 1, "network", 13, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-02.wav", 1, "network", 13, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-03.wav", 1, "network", 13, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-04.wav", 1, "network", 13, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-05.wav", 1, "network", 13, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-13-06.wav", 1, "network", 13, 6, 2],

# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-01.wav", 1, "network", 14, 1, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-02.wav", 1, "network", 14, 2, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-03.wav", 1, "network", 14, 3, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-04.wav", 1, "network", 14, 4, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-05.wav", 1, "network", 14, 5, 2],
# ["Lift Off", "https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-14-06.wav", 1, "network", 14, 6, 2]
] 

transcribers=[
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-01.trs"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-01-02.trs"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH20_FD/A11_T870_HR2L_CH20_197-11-50-46_197-19-15-13-01-01.json"],
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
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T870_HR2L_CH24_MOCR/A11_T870_HR2L_CH24_197-11-50-46_197-19-15-13-02-06.trs"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-01.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-02.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-03.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-04.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-05.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH18_GNC/A11_T869_HR1U_CH18_197-09-32-17_197-17-32-17-05-06.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-01.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-02.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-03.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-04.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-05.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH17_EECOM/A11_T869_HR1U_CH17_197-09-32-17_197-17-32-17-05-06.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-01.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-02.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-03.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-04.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-05.json"],
["https://exploreapollo-data.s3.amazonaws.com/audio/Lift_Off/A11_T869_HR1U_CH11_NTWK/A11_T869_HR1U_CH11_197-09-32-17_197-17-32-17-05-06.json"],
]

multi_chan.each_with_index do |(operation, audioUrl, missionId, channelName, blockIndex, nuggetIndex, tape), index|
channel = MultiChannel.find_or_create_by(operation: operation, audioUrl: audioUrl, mission_id: missionId, channel_name: channelName, block_index: blockIndex, nugget_index: nuggetIndex, tape_id: tape)
Transcriber.find_or_create_by(transcriberUrl: transcribers[index][0], multi_channel_id: channel.id)
end

