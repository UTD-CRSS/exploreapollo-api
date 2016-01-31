class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :moments

  validates_presence_of :title, :description, :slug
end
