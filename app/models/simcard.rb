class Simcard < ActiveRecord::Base
  attr_accessible :operator, :phone_number
has_many :sendmessages
has_many :receivemessages
	def self.newsim
		params = {:simcard=>{"operator"=>"", 
        "phone_number"=>""}}
        scid = Simcard.create(params[:simcard]).id
        return scid
    end
end
