require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bikes, :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike
		bike_to_return = @bikes.detect { |bike| bike.bike_working}
		@bikes.delete(bike_to_return)
		fail 'No bikes available' if empty? || !bike_to_return
		bike_to_return
	end


	def dock(bike, status=true)
		fail 'Docking station full' if full?
		bike.bike_working = status
		@bikes << bike
	end

	private

	def full?
		@bikes.count >= DEFAULT_CAPACITY
	end

	def empty?
		@bikes.empty?
	end


end
