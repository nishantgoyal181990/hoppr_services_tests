class SmsControllerController < ApplicationController

	def send_msg
		#Receivemessage.read_message
		sSendmessage.send_msg(portid="/dev/ttyUSB5", message="y2cf")
 		#Sendmessage.send_msg(portid="/dev/ttyUSB4", message="y2cf")
 		#Sendmessage.send_msg(portid="/dev/ttyUSB3", message="y2cf")
 		#Sendmessage.send_msg(portid="/dev/ttyUSB2", message="y2cf")
 		#Sendmessage.send_msg(portid="/dev/ttyUSB1", message="y2cf")
 		#Sendmessage.send_msg(portid="/dev/ttyUSB0", message="y2cf")
 		#scheduler = Rufus::Scheduler.start_new
		#scheduler.in 270 do
			#Sendmessage.send_msg(portid="/dev/ttyUSB5", message="rank")
 			#Sendmessage.send_msg(portid="/dev/ttyUSB4", message="rank")
 			#Sendmessage.send_msg(portid="/dev/ttyUSB3", message="rank")
 			#Sendmessage.send_msg(portid="/dev/ttyUSB2", message="rank")
 			#Sendmessage.send_msg(portid="/dev/ttyUSB1", message="rank")
 			#Sendmessage.send_msg(portid="/dev/ttyUSB0", message="rank")
 		#end
 	end
 	 def msgReports
       
    @sendmessage = Sendmessage.find(1)
     
     respond_to do |format|
      format.html # msgReports.html.erb
      format.json { render json: @sendmessage }
     end
   end

end