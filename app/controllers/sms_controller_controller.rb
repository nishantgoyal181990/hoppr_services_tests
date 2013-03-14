class SmsControllerController < ApplicationController

	def send_msg
		Receivemessage.read_message
		#Sendmessage.send_msg(portid="/dev/ttyUSB5", message="y2cf")
 		#Sendmessage.send_msg_port0(portid="/dev/ttyUSB4", message="y2cf")
 		#Sendmessage.send_msg_port0(portid="/dev/ttyUSB3", message="y2cf")
 		#Sendmessage.send_msg_port0(portid="/dev/ttyUSB2", message="y2cf")
 		#Sendmessage.send_msg_port0(portid="/dev/ttyUSB1", message="y2cf")
 		#Sendmessage.send_msg_port0(portid="/dev/ttyUSB0", message="y2cf")
 	end
end