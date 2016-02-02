class MetricSerializer < ActiveModel::Serializer
  attributes :id, :type, :met_start, :met_end, :data
  attribute :channel_id
end
