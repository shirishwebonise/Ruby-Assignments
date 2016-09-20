
module ComponentFactory

  def self.createScheduleClass
    schedule = Class.new(Object) do
      def initialize
        @flight_timings = Array.new
      end
    end

    schedule.class_eval do
      def addFlight(arrival_time, departure_time)
        @flight_timings.push({ arrival: arrival_time, departure: departure_time})
      end
    end

    schedule.class_eval do
      private
        def sortTimings
          @flight_timings = @flight_timings.sort_by { |flight_timing| flight_timing[:arrival].time }
        end
    end

    schedule.class_eval do
      def no_of_platforms
        sortTimings()
        flights_stack = Array.new
        max_platforms = 0;

        @flight_timings.each do |this_flight_timing|
          if flights_stack.length > 0
            last_flight_timing = flights_stack.last
            while last_flight_timing && last_flight_timing[:departure] < this_flight_timing[:arrival]
              flights_stack.pop
              last_flight_timing = flights_stack.last
            end
          end

          flights_stack.push this_flight_timing

          if max_platforms < flights_stack.length
            max_platforms = flights_stack.length
          end
        end
        max_platforms
      end
    end
    return schedule
  end
end
