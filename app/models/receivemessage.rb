class Receivemessage < ActiveRecord::Base
	attr_accessible :date, :message, :senders_number, :sendmessage_id, :simcard_id, :time
	belongs_to :simcard
	belongs_to :sendmessage
	def self.read_message(time_ds, portid, sm_id, scid)
		sp=SerialPort.new portid
		sp.write "at+cnmi=0,1,1,1,0\r"
		sleep 1
		sp.write "at+csmp=17,169,0,0\r"
		sleep 1
		sp.write "at+cmgf=1\r"
		sleep 1
		4.times do
			sp.write "at+cmgr=1\r"
			message = sp.readline()
			catch(:message) do
				message.start_with?('OK') 
				throw :message if message.start_with?('OK') == false
				binding.pry
				time=Time.now.inspect.split
				date=time[0]
				time=time[1]
				actual_message=a.last.gsub(/\r/, '').gsub(/\n/, '').gsub(/OK/, '')
				Receivemessage.new_receivemessage(sm_id, actual_message, number, time, date, scid)
			end
		sleep 5
		end
	end
	def self.new_receivemessage(sm_id, actual_message, number, time, date, scid)
		params = {:receivemessage=>
  		{"sendmessage_id"=>sm_id,
   		"simcard_id"=>scid,
   		"message"=>actual_message,
   		"time"=>time,
   		"date"=>date,
   		"senders_number"=>number}}
  		Receivemessage.create(params[:receivemessage])
  	end
end
