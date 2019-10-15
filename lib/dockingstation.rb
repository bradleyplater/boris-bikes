require_relative 'Bike'
 
class DockingStation
    attr_reader :dock
    def initialize
       @dock = [Bike.new]
    end
    def release_bike
        if @dock.length != 0
            @dock.pop
        else
            raise "Error"
        end
    end

    def dock_bike (bike)
        @dock.append(bike)
    end
    def show_dock (bike)
        @dock.each do |el|
            if el == bike
                print bike
            end
        end
    end

end
