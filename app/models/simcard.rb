class Simcard < ActiveRecord::Base
  attr_accessible :operator, :phone_number, :simid
has_many :sendmessages
has_many :receivemessages
validates :simid, presence: true, length: { minimum: 20 }
	def self.simcheck(portid)
		begin
			sp=SerialPort.new portid
			sp.write "AT+CCID\r"
			sp.read_timeout=200
			z=sp.readline('OK')
			binding.pry
			x=z.split(/\"/)
			simid=x[1]
			binding.pry
		rescue => e
			s=e.class
		retry if x==nil
		retry if simid.size<20
		end
		return simid
	end
end