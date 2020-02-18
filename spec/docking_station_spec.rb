require "docking_station"
require "bike"

describe DockingStation do

  context "methods" do
    it "responds to #release_bike" do
      expect(subject).to respond_to(:release_bike)
    end
    it "#release_bike" do
      expect(subject.release_bike).to be_an_instance_of(Bike).and respond_to(:working?)
    end
  end
end