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
   end

  def dock_bike(bike, working=true)
    raise "No space!" if full?
    report = working
    bikes << bike


    end 
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end

class Bike

  def working?
    true
  end

end
