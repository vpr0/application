class Train

  attr_reader :speed, :wagons, :number
  attr_accessor :route, :station

  include Developer

  include InstanceCounter
  @@number = 0
  @@trains = []
  def self.find(number)
    tr = nil
    @@trains.select{ |train| tr = train if train.number == number }
    tr
  end

  def initialize
    @speed = 0
    @type = type
    @wagons = []
    @station = nil
    @route = nil
    @@instances = register_instance
    @@number += 1
    @number = @@number.to_s.rjust(3, '0')
    @@trains << self
    validate!
  end

  def valid?
    validate!
  rescue => e
    puts e.message
    false
  end

  def each_wagons (&block)
    @wagons.each { |wagon| block.call(wagon) }
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

  def add_wagon (wagon)
    if @speed == 0
      @wagons << wagon
    else
      puts "Нельзя прицепить вагон если поезд движется"
    end
  end
  
  def del_wagon
    if @speed == 0 && @wagons > 0
      @wagons.delete(@wagons.last)
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

  def type
    ''
  end

  def find_station_index
    st =  @route.stations.find { |s| s == @station }
    @route.stations.index(st)

  end

  def validate!
    if @type != 'Пассажирский' && @type != 'Грузовой'
      raise 'Тип поезда может быть только "Пассажирский" или "Грузовой"'
    end
    if @number.size != 3
      raise 'Номер должен состоять из 3-х символов'
    end
    if @wagons.select { |wagon| wagon.class != Wagon }.size > 0
      raise 'К поезду можно прицепить только вагоны'
    end
    true
  end
end
# Релизовать проверку на формат номера поезда.
# Допустимый формат: три буквы или цифры в любом порядке,
# необязательный дефис (может быть, а может нет)
# и еще 2 буквы или цифры после дефиса.


