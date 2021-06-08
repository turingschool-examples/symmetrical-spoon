# app/models/registration

class Registration < ApplicationRecord 
  belongs_to :team 
  belongs_to :competition
end