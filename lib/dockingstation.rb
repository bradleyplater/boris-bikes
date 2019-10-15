require_relative 'Bike'
 
class DockingStation
    attr_reader :dock, :max_dock
    @@DEFAULT_CAPACITY = 20

    def initialize(capacity = @@DEFAULT_CAPACITY)
        @max_dock = capacity
        @dock = []
    end
    def release_bike
        if !empty?
            @dock.pop
        else
            raise "No bikes to release"
        end
    end

    def dock_bike (bike,working = true)
        if !full?
            bike.report_broken if working == false
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
