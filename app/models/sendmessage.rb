require 'serialport'
require 'rubygems'
require 'json'
require 'rufus/scheduler'
class Sendmessage < ActiveRecord::Base
attr_accessible :date, :delievery_status, :message_text, :recipient_number, :simcard_id, :time
belongs_to :simcard
has_many :recievemessages
   
    def self.send_msg(portid, message)
        hx="\x1A"
        Simcard.newsim
        scid = Simcard.newsim
        sp=SerialPort.new portid
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
        x = sp.readline('OK')
        if y=x.include?('+CMGS:')
            ds="delivered"
        else
            ds="not delivered"
        end
        z=Time.now.inspect.split
            date_ds=z[0]
            time_ds=z[1]
        Sendmessage.new_sm(messagetext, time_ds, date_ds, scid, ds)
        sm_id = Sendmessage.new_sm(messagetext, time_ds, date_ds, scid, ds)
        binding.pry
        Receivemessage.read_message(time_ds, portid, sm_id, scid)
    end
    def self.new_sm(messagetext, time_ds, date_ds, scid, ds)
        params = {:sendmessage => {"recipient_number"=>"56660",                                                        
        "message_text"=>messagetext,                                                         
        "time"=>time_ds,                                                      
        "date"=>date_ds,                                                     
        "delievery_status"=>ds,
        "simcard_id"=>scid}}
        sm_id=Sendmessage.create(params[:sendmessage]).id
        return sm_id
    end
end