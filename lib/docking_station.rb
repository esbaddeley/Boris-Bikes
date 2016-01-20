class DockingStation

   attr_reader :bikes, :capacity, :num_bikes

  def initialize(capacity=20)
    @capacity = [capacity]
    @num_bikes = 0
  end


  def release_bike
    raise "No bikes available" unless @num_bikes == 0
    @num_bikes -= 1
    @bikes
   end

  def dock_bike(bike)
    raise "Bike already docked here" if @num_bikes >= @capacity[0]
    @num_bikes += 1
    @bikes = bike
  end



end

class Bike

  def working?
    true
  end

end
