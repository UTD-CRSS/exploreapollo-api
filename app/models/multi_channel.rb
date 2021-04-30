class MultiChannel < ApplicationRecord
    has_one :transcriber
    belongs_to :channel
    has_one :tape
    scope :filter_by_block, ->(block) {where block_index: block}
    scope :filter_by_nugget, ->(nugget) {where nugget_index: nugget} 
    scope :filter_by_channel, ->(channel) {where channel_name: channel}
    scope :filter_by_tape, ->(tape) {where tape: tape}
end
