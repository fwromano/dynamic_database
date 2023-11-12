class Subgroup < ApplicationRecord
  self.primary_key = 'subgroup_id'

  belongs_to :data
end
