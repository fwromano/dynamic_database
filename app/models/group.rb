class Group < ApplicationRecord
  self.primary_key = 'group_id'

  belongs_to :data
end
