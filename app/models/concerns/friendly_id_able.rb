
# Friendly id
module FriendlyIdAble
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :description, :slug
    validates_uniqueness_of :title

    # Auto generate slug when title changes
    define_method :should_generate_new_friendly_id? do
      title_changed? || super()
    end
  end

end
