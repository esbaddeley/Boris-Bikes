require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes here!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "No space to dock here." if full?
    @bikes << bike
  end

  private
  def full?
  	@bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
  	@bikes.length == 0
  end
end
