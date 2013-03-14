class Receivemessage < ActiveRecord::Base
	attr_accessible :date, :message, :senders_number, :sendmessage_id, :simcard_id, :time
	belongs_to :simcard
	belongs_to :sendmessage
	def self.read_message
		sp=SerialPort.new "/dev/ttyUSB5"
		sp.write "at+cnmi=0,1,1,1,0\r"
		sleep 2
		sp.write "at+csmp=17,169,0,0\r"
		sleep 2
		sp.write "at+cmgf=1\r"
		sleep 2
		sp.write "at+cmgr=1\r"
		message = sp.readline('OK')
		a = message.split(/\"/)
		number=a[3]
		b=a[5]
		dt = b.split(/\,/)
		date=dt[0]
		time=dt[1]
		actual_message=a.last.gsub(/\r/, '').gsub(/\n/, '').gsub(/OK/, '')
		@actual_message=actual_message
		params = {:receivemessage=>
  		{"sendmessage_id"=>"knownpivnwp",
   		"simcard_id"=>"6-68-0",
   		"message"=>actual_message,
   		"time"=>time,
   		"date"=>date,
   		"senders_number"=>number}}
  		Receivemessage.create(params[:receivemessage])
		binding.pry
	end
end
