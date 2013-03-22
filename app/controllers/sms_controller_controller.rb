class SmsControllerController < ApplicationController

	def send_msg
		#Receivemessage.read_message
		Sendmessage.send_msg(portid="/dev/ttyUSB5", message="y2cf")
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
end