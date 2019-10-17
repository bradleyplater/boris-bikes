require 'DockingStation'
require 'Bike'

describe DockingStation do 

    it 'Responds to user releasing bike' do
        docking_station = DockingStation.new()
        expect(docking_station).to respond_to(:release_bike)
    end

    it "Docks bike that user has" do 
        docking_station = DockingStation.new
        bike = Bike.new
        docking_station.dock_bike(bike)
        expect(docking_station.dock).to include bike
    end

    it "sees the bike that has been docked" do
        docking_station = DockingStation.new
        bike = Bike.new
        docking_station.dock_bike(bike)
        expect(docking_station.show_dock).to eq bike
    end
        
    it "Shows error if no bikes available" do
        docking_station = DockingStation.new 
        expect { docking_station.release_bike }.to raise_error "No bikes to release"

    end

    it "shows error if max number of bikes are in dock" do
        docking_station = DockingStation.new
        expect { 21.times{docking_station.dock_bike(Bike.new)} }.to raise_error "Too many bikes"
    end 

    it "Capacity is equal to the capacity set by user" do
        docking_station = DockingStation.new(12)
        expect(docking_station.max_dock).to eq 12
    end

    it "Capacity is equal to default when no capacity set by user" do
        docking_station = DockingStation.new
        expect(docking_station.max_dock).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "Docking station does not release broken bike" do
        docking_station = DockingStation.new
        bike = Bike.new
        bike.report_broken
        docking_station.dock_bike(bike)
        expect { docking_station.release_bike }.to raise_error "Bike is broken"
    end

    it "Docking station can store bike that is broken" do 
        docking_station = DockingStation.new
        bike = Bike.new
        bike.report_broken
        docking_station.dock_bike(bike)
        expect(docking_station.dock[0].working?).to eq false
    end
end