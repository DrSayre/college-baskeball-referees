class Api::RefereeAssignmentResource < JSONAPI::Resource
  has_one :game
  has_one :referee

  filter :id
  filters :referee_id
end
