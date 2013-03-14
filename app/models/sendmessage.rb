require 'serialport'
require 'rubygems'
require 'json'
require 'rufus/scheduler'
class Sendmessage < ActiveRecord::Base
attr_accessible :date, :delievery_status, :message_text, :recipient_number, :simcard_id, :time
belongs_to :simcard
has_many :recievemessages
     def self.send_msg(portid, message)
         sp=SerialPort.new portid
    	     hx="\x1A"
    	     sp.write "AT+CNMI=0,1,1,1,0\r"
    	     sleep 1
    	     sp.write "AT+CSMP=17,169,0,0\r"
    	     sleep 1
    	     sp.write "AT+CMGF=1\r"
    	     sleep 1
    	     messagerecipient=56660
    	     sp.write "AT+CMGS=56660\r"
    	     sleep 1
          messagetext=message
          sp.write message
          sp.write hx
          sleep 1
          x = sp.readlines('OK')
          binding.pry
          scheduler = Rufus::Scheduler.start_new
          scheduler.in '15m' do
               if x.start_with?('+CMTI')
                    @time1 = Time.new
                    ds = "delivered"
                    dt=Time.now
               else
                    ds = "not delivered"
               end
               @ds=ds
               params = {:sendmessage => {"recipient_number"=>"56660",                                                        
               "message_text"=>messagetext,                                                         
               "time"=>"svsvsv",                                                      
               "date"=>"vsdvsdv",                                                     
               "delievery_status"=>@ds}}
               Sendmessage.create(params[:sendmessage])
          end
     end
end