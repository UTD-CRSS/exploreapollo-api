class MultiChannelSerializer < ActiveModel::Serializer
  attributes :id, :operation, :audioUrl, :block_index, :nugget_index, :channel_name
  belongs_to :tape
  belongs_to :channel
  has_one :transcriber

  def tape
    Tape.find_by_id(object.tape_id)
  end

  def channel
    Channel.friendly.find(object.channel_name)
  end

end
