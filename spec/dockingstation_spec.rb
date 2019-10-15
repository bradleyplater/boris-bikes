require 'DockingStation'
require 'Bike'

describe DockingStation do 

    it 'Responds to user releasing bike' do
        docking_station = DockingStation.new()
        expect(docking_station).to respond_to(:release_bike)
    end
   
    it "check when bike is released it is an instance of Bike" do
        docking_station = DockingStation.new
        bike = docking_station.release_bike
        expect(bike).to be_instance_of(Bike)
    end

    it "Checks that bike is working" do 
        docking_station = DockingStation.new
        expect(docking_station.release_bike).to respond_to :working?
    end

    it "Docks bike that user has" do 
        docking_station = DockingStation.new
        bike = docking_station.release_bike
        docking_station.dock_bike(bike)
        expect(docking_station.dock).to include bike
    end

    it "sees the bike that has been docked" do
        docking_station = DockingStation.new
        bike = docking_station.release_bike
        docking_station.dock_bike(bike)
        element = nil
        docking_station.dock.each do |el|
            element = bike if el == bike
        end
        expect{docking_station.show_dock(bike)}.to output(element.to_s).to_stdout
    end
        
    it "shows error if bike is not returned" do
        docking_station = DockingStation.new 
        docking_station.release_bike
        expect { docking_station.release_bike }.to raise_error "No bikes to release"

    end

    it "shows error if max number of bikes are in dock" do
        docking_station = DockingStation.new
        expect { 6.times{docking_station.dock_bike(Bike.new)} }.to raise_error "Too many bikes"
    end 
end