require 'DockingStation'
require 'Bike'

describe DockingStation do
  subject { DockingStation.new }
  let(:bike) { double :bike, working?: false }

  it "Responds to user releasing bike" do
    expect(subject).to respond_to(:release_bike)
  end

  it "Docks bike that user has" do
    subject.dock_bike(bike)
    expect(subject.dock).to include bike
  end

  it "sees the bike that has been docked" do
    subject.dock_bike(bike)
    expect(subject.show_dock).to eq bike
  end

  it "Shows error if no bikes available" do
    expect { subject.release_bike }.to raise_error "No bikes to release"
  end

  it "shows error if max number of bikes are in dock" do
    expect { 21.times { subject.dock_bike(double(:bike)) } }.to raise_error "Too many bikes"
  end

  it "Capacity is equal to the capacity set by user" do
    dock = DockingStation.new(12)
    expect(dock.max_dock).to eq 12
  end

  it "Capacity is equal to default when no capacity set by user" do
    expect(subject.max_dock).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "Docking station does not release broken bike" do
    subject.dock_bike(bike)
    expect { subject.release_bike }.to raise_error "Bike is broken"
  end

  it "Docking station can store bike that is broken" do
    subject.dock_bike(bike)
    expect(subject.dock[0].working?).to eq false
  end
end
