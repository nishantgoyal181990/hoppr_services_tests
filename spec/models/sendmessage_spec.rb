require 'spec_helper'

describe Sendmessage do
	it "message recipient should be present" do
		SerialPort.stub!(:new).and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		recipient="at+cmgs=56660\r"
		@sp.write recipient
		recipient.should_not==nil
		end
	it "should have correct CNMI settings" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid, message="y2cf").and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		x="AT+CNMI=0,1,1,1,0\r"
		@sp.write x
		x.should=="AT+CNMI=0,1,1,1,0\r"
	end
	it "should have correct message validity settings" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid, message="y2cf").and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		x="AT+CSMP=17,169,0,0\r"
		@sp.write x
		x.should=="AT+CSMP=17,169,0,0\r"
	end
	it "should have correct message format" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid, message="y2cf").and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		x="AT+CMGF=1\r"
		@sp.write x
		x.should=="AT+CMGF=1\r"
	end
	it "message recipient should be equal to 56660" do
		SerialPort.stub!(:new).and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		recipient="at+cmgs=56660\r"
		@sp.write recipient
		recipient.include?("56660")
	end
	it "port id should be correct" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid).and_return(@sp)
		port_id="/dev/ttyUSB5"
		port_id.should=="/dev/ttyUSB5"
	end
	it "message text should be correct" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid, message="y2cf").and_return(@sp)
		@sp.stub!(:write).and_return('OK')
		hx="\x1A"
		@sp.write message
		@sp.write hx
		message.should=="y2cf"
	end
	it "delivery report should be returned" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid, message="y2cf").and_return(@sp)
		@sp.stub!(:write).and_return(cmgs_msg='+CMGS:', 'OK')
		readline=File.stub!(:readline)
		hx="\x1A"
		@sp.write message
		@sp.write hx
		if cmgs_msg==@sp.write
			@ds="delivered"
		else
			@ds="not delivered"
		end
		@ds.should_not==nil
	end
	before do
		@sendmessage=Sendmessage.new(
			recipient_number: "56660", 
			message_text: "hello", 
			time: "14:57:00", 
			date: "13/03/21", 
			delievery_status: "delivered", 
			simcard_id: "87"
		)
	end

	subject { @sendmessage }
	it { should respond_to(:date) }
  	it { should respond_to(:delievery_status) }
  	it { should respond_to(:time) }
  	it { should respond_to(:message_text) }
  	it { should respond_to(:simcard_id) }
  	it { should respond_to(:recipient_number) }

	describe "deliverey report is not present" do
		before { @sendmessage.delievery_status=nil }
		it { should_not be_valid }
	end
	describe "deliverey report is present" do
		before { @sendmessage.delievery_status="delivered" }
		it { should be_valid }
	end
	describe "date and time are not present" do
		before { @sendmessage.date=nil}
		before { @sendmessage.time=nil }
		it { should_not be_valid }
		it { should_not be_valid }
	end
	describe "date and time are present" do
		before { @sendmessage.date="13/03/21" }
		before { @sendmessage.time="14:40:20" }
		it { should be_valid }
		it { should be_valid }
	end
	describe "sent message not present" do
		before { @sendmessage.message_text=nil }
		it { should_not be_valid }
	end
	describe "sent message present" do
		before { @sendmessage.message_text="hello" }
		it { should be_valid }
	end
	describe "simcard id not present" do
		before { @sendmessage.simcard_id=nil }
		it { should_not be_valid }
	end
	describe "simcard id present" do
		before { @sendmessage.simcard_id=67 }
		it { should be_valid }
	end
	describe "recipient is not present" do
		before { @sendmessage.recipient_number=nil }
		it { should_not be_valid }
	end
	describe "recipient is present" do
		before { @sendmessage.recipient_number=56660 }
		it { should be_valid }
	end
end			

