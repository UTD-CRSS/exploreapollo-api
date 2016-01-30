class Story < ApplicationRecord
	has_and_belongs_to_many :moments
end
