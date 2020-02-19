require_relative "./bike"

class DockingStation
DEFAULT_CAPACITY = 8

  attr_accessor :currently_docked
  attr_reader :capacity

  def initialize(capacity: DEFAULT_CAPACITY)
    @currently_docked = []
    @capacity = capacity
  end

  def release_bike
  raise "Dock is empty. Please come back again later" if empty?
    return Bike.new
  end

  def dock_bike(bike:)
    raise "Full, go to another docking station" if full?
    currently_docked.push(bike)
  end

  def show_docked_bikes
    if currently_docked.length == 0
      "No bikes here currently"
    elsif currently_docked.length > 0
      return currently_docked.length
    end
  end

  private
  def full?
    currently_docked.length >= capacity ? true : false
  end

  def empty?
    currently_docked.length == 0 ? true : false
  end
end 

puts DockingStation.new.currently_docked.length