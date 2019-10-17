require 'bike'

describe Bike do

    subject { Bike.new }

    it "check when bike is released it is an instance of Bike" do
        expect(subject).to be_instance_of(Bike)
    end

    it "Checks that bike is working" do 
        expect(subject).to respond_to :working?
    end
    it "User can report damage on a bike" do
        subject.report_broken
        expect(subject.working?).to eq false
    end
end
