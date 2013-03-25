require 'serialport'
require 'rubygems'
require 'json'
require 'rufus/scheduler'
class Sendmessage < ActiveRecord::Base
attr_accessible :date, :delievery_status, :message_text, :recipient_number, :simcard_id, :time
belongs_to :simcard
has_many :receivemessages
    validates :date, presence: true
    validates :time, presence: true
    validates :delievery_status, presence: true
    validates :recipient_number, presence: true
    validates :message_text, presence: true
    validates :simcard_id, presence: true
    def self.send_msg(portid, message)
        hx="\x1A"
        simid=Simcard.simcheck(portid)
        binding.pry
        scid=Simcard.create(operator: "", phone_number: nil, simid: simid).id
         
        sp=SerialPort.new portid
        sp.write "AT+CNMI=0,1,1,1,0\r"
        sleep 1
        sp.write "AT+CSMP=17,169,0,0\r"
        sleep 1
        sp.write "AT+CMGF=1\r"
        sleep 1
            sp.write "AT+CMGD=1,4\r"
            sleep 8
            messagerecipient=56660
            sp.write "AT+CMGS=56660\r"
            messagetext=message
            sp.write message
            sp.write hx
            sp.read_timeout=100
            sleep 5
            binding.pry
            x = sp.readline('OK')
            binding.pry
            if y=x.include?('+CMGS:')
                ds="delivered"
            else
                ds="not delivered"
            end
        z=Time.now.inspect.split
            date_ds=z[0]
            time_ds=z[1]
        sm_id=Sendmessage.create(recipient_number: messagerecipient, message_text: messagetext, time: time_ds, date: date_ds, delievery_status: ds, simcard_id: $scid ).id
        sleep 5
        Receivemessage.read_message(time_ds, portid, sm_id, scid)
    end
end