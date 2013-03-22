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
		10.times do
			sp.write "AT+CMGR=1\r"
			sp.read_timeout=300
			@message=sp.readlines()
			binding.pry
			#catch(:message) do
			#throw :message if @message!=nil
			if @message.last.include?('OK')
				binding.pry
				time=Time.now.inspect.split
				date=time[0]
				time=time[1]
				actual_message=@message[2].gsub(/\r/, '').gsub(/\n/, '').gsub(/OK/, '')
				binding.pry
				Receivemessage.new_receivemessage(sm_id, actual_message, number, time, date, scid)
			end
			if @message.last.include?('OK')
				break
			end

				
			#end
			#if @message.include?('OK') == true
				#break
			#end
		end
	end
	def self.new_receivemessage(sm_id, actual_message, number, time, date, scid)
		params = {:receivemessage=>
  		{"sendmessage_id"=>sm_id,
   		"simcard_id"=>scid,
   		"message"=>actual_message,
   		"time"=>time,
   		"date"=>date,
   		"sender"=>number}}
  		Receivemessage.create(params[:receivemessage])
  	end
end
