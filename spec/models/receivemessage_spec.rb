require 'spec_helper'

describe Receivemessage do
 	it "port id should be correct" do
		portid = File.stub!(:open).with("/dev/ttyUSB5")
		SerialPort.stub!(:new).with(portid).and_return(@sp)
		port_id="/dev/ttyUSB5"
		port_id.should=="/dev/ttyUSB5"
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
	before do
		@receivemessage=Receivemessage.new(
			time: "19:43:18", 
			date: "13/03/21", 
			message: "You checked into Y2CF Digital Medi... and got 1000pts. Your score in the last 7days is 25000pts. Make thisal, show ur love. Send L to 56660", 
			sender: "56660", 
			simcard_id: "56", 
			sendmessage_id: "89"
		)
	end
	subject { @receivemessage }

	it { should respond_to(:date) }
  	it { should respond_to(:message) }
  	it { should respond_to(:time) }
  	it { should respond_to(:sender) }
  	it { should respond_to(:simcard_id) }
  	it { should respond_to(:sendmessage_id) }

  	describe "date is not present" do
		before { @receivemessage.date=nil }
		it { should_not be_valid }
	end
	describe "date is present" do
		before { @receivemessage.date="13/03/21" }
		it { should be_valid }
	end
	describe "message is not present" do
		before { @receivemessage.message=nil }
		it { should_not be_valid }
	end
	describe "message is present" do
		before { @receivemessage.message="You checked into Y2CF Digital Medi... and got 1000pts. Your score in the last 7days is 25000pts. Make thisal, show ur love. Send L to 56660" }
		it { should be_valid }
	end	
	describe "time is not present" do
		before { @receivemessage.time=nil }
		it { should_not be_valid }
	end
	describe "time is present" do
		before { @receivemessage.time="19:48:12" }
		it { should be_valid }
	end
	describe "sender is not present" do
		before { @receivemessage.sender=nil }
		it { should_not be_valid }
	end
	describe "sender is present" do
		before { @receivemessage.sender=56660 }
		it { should be_valid }
	end
	describe "simcard id is not present" do
		before { @receivemessage.simcard_id=nil }
		it { should_not be_valid }
	end
	describe "simcard id is present" do
		before { @receivemessage.simcard_id=56 }
		it { should be_valid }
	end
	describe "send message id is not present" do
		before { @receivemessage.sendmessage_id=nil }
		it { should_not be_valid }
	end
	describe "send message id is present" do
		before { @receivemessage.sendmessage_id=89 }
		it { should be_valid }
	end
end

