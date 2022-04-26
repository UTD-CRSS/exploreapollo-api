class Story < ApplicationRecord
  include FriendlyIdAble

  has_many :moments

  validates_presence_of :description

  #def ordered_moments
  # moments.includes(:moments_stories).order("moments_stories.order")
  #end

  def met_start
    ms = moments.order(:met_start).first
    ms.nil? ? nil : ms.met_start
  end

  def met_end
    ms = moments.order(:met_end).last
    ms.nil? ? nil : ms.met_end
  end
end
