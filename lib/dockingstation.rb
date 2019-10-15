require_relative 'Bike'
 
class DockingStation
    attr_reader :dock
    def initialize
       @dock = []
    end
    def release_bike
       Bike.new
         
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
