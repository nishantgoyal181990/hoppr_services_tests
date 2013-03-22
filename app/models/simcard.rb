class Simcard < ActiveRecord::Base
  attr_accessible :operator, :phone_number, :simid
has_many :sendmessages
has_many :receivemessages
validates :simid, presence: true, length: { minimum: 20 }
	def self.simcheck(portid)
		sp=SerialPort.new portid
		while true do
			sp.write "AT+CCID\r"
			sp.read_timeout=100
			z=sp.readline('OK')
			x=z.split(/\"/)
			simid=x[1]
			 
			if simid.size == 20
				break
			end
		end
		 
		return simid
	end
end