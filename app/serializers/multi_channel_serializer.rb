class MultiChannelSerializer < ActiveModel::Serializer
  attributes :id, :operation, :audioUrl, :block_index, :nugget_index, :channel_name
  belongs_to :tape
  has_one :transcriber

  def tape
    Tape.find_by_id(object.tape_id)
  end

end
