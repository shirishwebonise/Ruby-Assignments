
class TimeOfDay
  def initialize(str)
    @hours = str.split(":")[0].to_i
    @minutes = str.split(":")[1].to_i
  end

  def time
    @hours*60 + @minutes
  end

  def <(otherTime)
    time < otherTime.time
  end

  def >(otherTime)
    time > otherTime.time
  end

  def to_s
    { hours: @hours.to_s, minutes: @minutes.to_s }.to_s
  end
end
