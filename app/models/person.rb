class Person < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :title, :slug
  validates_uniqueness_of :name

  # Auto generate slug when title changes
  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
