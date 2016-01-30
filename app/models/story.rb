class Story < ApplicationRecord
	has_and_belongs_to_many :moments, join_table: "moment_story_join"
end
