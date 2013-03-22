require 'spec_helper'

describe Simcard do
	before do
		@simcard=Simcard.new(
			simid: "89911100180063122601"
		)
	end		
	subject { @simcard }
	
	it { should respond_to(:operator) }
	it { should respond_to(:phone_number) }
	it { should respond_to(:simid) }

	describe "when operator is not present" do
		before { @simcard.simid=89911100180063122601 }
		before { @simcard.operator=nil }
		it { should be_valid }
	end		
	describe "when operator is present" do
		before { @simcard.simid=89911100180063122601 }
		before { @simcard.operator="Idea" }
		it { should be_valid }
	end		
	describe "when phone number is not present" do
		before { @simcard.simid=89911100180063122601 }
		before { @simcard.phone_number=nil }
		it { should be_valid }
	end		
	describe "when phone number is present" do
		before { @simcard.simid=89911100180063122601 }
		before { @simcard.phone_number=235252 }
		it { should be_valid }
	end
	describe "when simid is not present" do
		before { @simcard.simid=nil }
		it { should_not be_valid }
	end		
	describe "when simid is present" do
		before { @simcard.simid=89911100180063122601 }
		it { should be_valid }
	end
	describe "when simid length is not correct" do
		before { @simcard.simid=070457 }
		it { should_not be_valid }
	end		
	describe "when simid length is correct" do
		before { @simcard.simid=89911100180063122601 }
		it { should be_valid }
	end
			
	before do
		@simcard=Simcard.create
	end
	subject { @simcard }
	
	it "should return a sim id" do
		@simcard.should_not==0
	end
end
