require 'garage'

describe Garage do
  subject { Garage.new }
  it "Can create an instance of Garage" do
    expect(subject).to be_instance_of(Garage)
  end
end
