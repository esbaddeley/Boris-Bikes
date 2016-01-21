require './lib/bike.rb'

class DockingStation

  attr_reader :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    fail 'No working bikes available' if empty?
    bikes.pop
    #check bikes.pop . . . I thought previously that you would have to do bikes.each ... first
  end

  def release_to_fix
    broken_bikes.pop(broken_bikes.length)
  end


  def dock_bike(bike)
    raise "No space!" if full?
    if bike.broken?
      broken_bikes << bike
    elsif !bike.broken?
      bikes << bike
    end
  end



  private

  def full?
    bikes.count + broken_bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
