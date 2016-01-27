class StorySerializer < ActiveModel::Serializer
  attributes :id , :created , :description, :name, :title
end
