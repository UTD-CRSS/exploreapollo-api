class Tape < ApplicationRecord
    include FriendlyIdAble
    validates_presence_of :mission_id

    belongs_to :mission
    has_many :multi_channels
end