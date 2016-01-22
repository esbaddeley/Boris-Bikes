class Van


  def initialize
    @bikes_to_fix = []
  end

  def dock(broken_bikes)
    @bikes_to_fix << broken_bikes
  end

  def release_broken_bikes
    @bikes_to_fix.pop(bikes_to_fix.length)
  end


  private

  attr_reader :bikes_to_fix

end
