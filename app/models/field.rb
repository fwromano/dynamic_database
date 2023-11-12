class Field < ApplicationRecord
  self.primary_key = 'field_id'

  belongs_to :data
end
