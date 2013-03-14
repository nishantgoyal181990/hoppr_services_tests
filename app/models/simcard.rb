class Simcard < ActiveRecord::Base
  attr_accessible :operator, :phone_number, :simid
has_many :sendmessages
has_many :receivemessages
end
