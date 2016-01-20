class DockingStation

   attr_reader :bike

  def release_bike
    raise "No bikes available" unless @bike
    @bike 
   end

  def dock_bike(bike)
    raise "Bike already docked here" if @bike 
    @bike = bike
  end



end

class Bike

  def working?
    true
  end

end
