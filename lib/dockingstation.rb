require_relative 'Bike'
 
class DockingStation
    attr_reader :dock
    def initialize
        @max_dock = 20
        @dock = []
    end
    def release_bike
        if @dock.length != 0
            @dock.pop
        else
            raise "No bikes to release"
        end
    end

    def dock_bike (bike)
        if @dock.length <  @max_dock
            @dock.append(bike)
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

end
