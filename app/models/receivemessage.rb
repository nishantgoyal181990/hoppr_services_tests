class Receivemessage < ActiveRecord::Base
	attr_accessible :date, :message, :sender, :sendmessage_id, :simcard_id, :time
	belongs_to :simcard
	belongs_to :sendmessage
	validates :date, presence: true
	validates :time, presence: true
	validates :sender, presence: true
	validates :message, presence: true
	validates :sendmessage_id, presence: true
	validates :simcard_id, presence: true
	def self.read_message(time_ds, portid, sm_id, scid)
		sp=SerialPort.new portid
		sp.write "AT+CNMI=0,1,1,1,0\r"
		sleep 1
		sp.write "AT+CSMP=17,169,0,0\r"
		sleep 1
		sp.write "AT+CMGF=1\r"
		sleep 1
		i=0
		10.times do
		#while true do
			sp.write "AT+CMGR=1\r"
			sp.read_timeout=300
			@message=sp.readlines()
				if @message.last.include?('OK')
					s=@message[1].split(/\,/)
					binding.pry
					sender=s[1].gsub(/"/, '')
					time=Time.now.inspect.split
					date=time[0]
					time=time[1]
					actual_message=@message[2].gsub(/\r/, '').gsub(/\n/, '').gsub(/OK/, '')
				 	Receivemessage.new_receivemessage(sm_id, actual_message, sender, time, date, $scid)
				end
			#end
			if @message.last.include?('OK')
				break
			end

				
			#end
			#if @message.include?('OK') == true
				#break
			#end
		end
	end
	def self.new_receivemessage(sm_id, actual_message, sender, time, date, scid)
		params = {:receivemessage=>
  		{"sendmessage_id"=>sm_id,
   		"simcard_id"=>$scid,
   		"message"=>actual_message,
   		"time"=>time,
   		"date"=>date,
   		"sender"=>sender}}
  		$rm_id=Receivemessage.create(params[:receivemessage]).id
  	end
end
