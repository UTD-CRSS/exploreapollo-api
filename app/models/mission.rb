class Mission < ApplicationRecord
  include FriendlyIdAble

  validates_presence_of :description, :start_time
end
