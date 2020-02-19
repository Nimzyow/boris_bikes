require "docking_station"
require "bike"

shared_context "common" do
  let(:bike) {Bike.new}
end

describe DockingStation do
  include_context "common"
  context "methods" do
    it "responds to #release_bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "#release_bike prevents release if currently_docked.length = 0" do
      expect{subject.release_bike}.to raise_error
    end

    it "#release_bike" do
      subject.dock_bike({bike:bike})
      expect(subject.release_bike).to be_an_instance_of(Bike).and respond_to(:working?)
    end

    it "#dock_bike pushes Bike instance into currently_docked array" do
      expect{subject.dock_bike({bike:bike})}.to change{subject.currently_docked.length}.by(1)
    end

    it "#dock_bike prevents push into currently_docked array if = capacity" do
      8.times {subject.dock_bike({bike:bike})}
      expect{subject.dock_bike({bike:bike})}.to raise_error
    end

    it "#show_docked_bikes returns number of bikes on the docking station" do
      subject.dock_bike({bike:bike})
      subject.dock_bike({bike:bike})
      subject.dock_bike({bike:bike})
      expect(subject.show_docked_bikes).to eq(subject.currently_docked.length).or eq("No bikes here currently")
    end

  end
  context "has attributes" do
    it "currently_docked" do
      expect(subject).to have_attributes(currently_docked: [])
    end

    it "capacity with default of 8" do
      expect(subject).to have_attributes(capacity: 8)
    end

    it "capacity with custom capcaity" do
      subject = described_class.new({capacity: 10})
      expect(subject).to have_attributes(capacity: 10)
    end
  end
end
