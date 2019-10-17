require 'van'

describe Van do
  subject { Van.new }
  it "Can create an instance of Van" do
    expect(subject).to be_instance_of(Van)
  end
end