class Train

  attr_reader :speed, :wagons
  attr_accessor :route, :station

  def initialize(speed = 0, wagons = 0, station = nil, route = nil)
    @speed = speed
    @wagons = wagons
    @station = station
    @route = route
  end

  def speed_up
    @speed += 100 if @speed < 300
  end

  def speed_down
    @speed -= 100 if @speed != 0
  end

  def stop
    @speed = 0
  end

  def add_wagon
    if @speed == 0
      @wagons = @wagons + 1
    else
      puts "Нельзя прицепить вагон если поезд движется"
    end
  end
  
  def del_wagon
    if @speed == 0 && @wagons > 0
      @wagons = @wagons - 1
    else
      puts "Нельзя отцепить вагон если поезд движется или нет вагонов"
    end
  end

  def next_station
    if find_station_index <= route.stations.size - 1 - 1
      puts "Следующая станция: #{@route.stations[find_station_index+1].name}"
    else
      puts "Поезд на конечной станции"
    end
  end

  def prev_station
    if find_station_index > 0
      puts "Предыдущая станция: #{@route.stations[find_station_index-1].name}"
    else
      puts "Поезд на начальной станции"
    end
  end

  def current_station
    puts "Текущая станция: #{@station.name}"
  end

  def go_to_next_station
    if @route.stations[find_station_index+1]
      @station = @route.stations[find_station_index+1]
    else
      puts "Поезд на конечной станции"
    end
  end

  private

  def find_station_index
    st =  @route.stations.find {|s| s == @station}
    @route.stations.index(st)

  end

end
