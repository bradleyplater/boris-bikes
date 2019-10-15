require_relative 'Bike'
 
class DockingStation
    attr_reader :dock
    @@DEFAULT_CAPACITY = 20
    def initialize
        @max_dock = @@DEFAULT_CAPACITY
        @dock = []
    end
    def release_bike
        if !empty?
            @dock.pop
        else
            raise "No bikes to release"
        end
    end

    def dock_bike (bike)
        if !full?
            @dock << bike
        else
            raise "Too many bikes"
        end

    end
    def show_dock (bike)
        @dock.each do |el|
            if el == bike
                print bike
            end
        end
    end

    private def full?
        @dock.length == @max_dock
    end
    private def empty?
        @dock.length == 0
    end

end
