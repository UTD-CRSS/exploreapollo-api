class Story < ApplicationRecord
  include FriendlyIdAble

  has_and_belongs_to_many :moments

  validates_presence_of :description

  def ordered_moments
    moments.includes(:moments_stories).order("moments_stories.order")
  end

  def met_start
    moments.order(:met_start).first.met_start
  end

  def met_end
    moments.order(:met_end).last.met_end
  end
end
