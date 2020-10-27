# frozen_string_literal: true

class Clock
  MINUTES_IN_A_DAY = 1440
  MINUTES_IN_A_HOUR = 60

  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * MINUTES_IN_A_HOUR + minute) % MINUTES_IN_A_DAY
  end

  def to_s
    format('%02<hour>d:%02<minute>d', minute: minute, hour: hour)
  end

  def ==(other)
    to_s == other.to_s
  end

  def +(other)
    self.class.new(minute: minutes + other.minutes)
  end

  def -(other)
    self.class.new(minute: minutes - other.minutes)
  end

  private

  def hour
    minutes / MINUTES_IN_A_HOUR % 24
  end

  def minute
    minutes % MINUTES_IN_A_HOUR
  end
end
