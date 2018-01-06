class Route

  attr_reader :number, :stations

  def initialize(number, stations = [])
    @stations = stations
    @number = number
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def stations_list
    puts "================ маршрут ##{@number} ====================="
    @stations.each do |station|
      puts "Станция: #{station.name}"
    end
  end
end

