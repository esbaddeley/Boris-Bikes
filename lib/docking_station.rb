
require 'bike.rb'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
    #check bikes.pop . . . I thought previously that you would have to do bikes.each ... first 
  end

  def dock_bike(bike) 
    raise "No space!" if full?
    bikes << bike   
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end


