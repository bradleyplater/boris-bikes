require_relative 'Bike'
 
class DockingStation
    attr_reader :dock, :max_dock, :DEFAULT_CAPACITY
    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @max_dock = capacity
        @dock = []
    end
    def release_bike
        if !empty?
            @dock.each_with_index do |bike, index|
                if bike.working?
                    @dock.delete_at(index)
                    return bike
                else
                    raise "Bike is broken"
                end
            end
         else
            raise "No bikes to release"
        end
    end

    def dock_bike (bike,working = true)
        if !full?
            @dock << bike
        else
            raise "Too many bikes"
        end
    end
    def show_dock
        @dock.each do |el|
            return el
        end
    end

    private def full?
        @dock.length == @max_dock
    end
    private def empty?
        @dock.length == 0
    end

end
