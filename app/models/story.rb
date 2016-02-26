class Story < ApplicationRecord
  include FriendlyIdAble

  has_and_belongs_to_many :moments

  validates_presence_of :description

  def ordered_moments
    moments.includes(:moments_stories).order("moments_stories.order")
  end
end
