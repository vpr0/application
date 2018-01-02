
# Поезд:
# ##         Имеет, тип, который указывается при создании:
#          грузовой, пассажирский и количество вагонов.
# Поезд может делать следующие вещи:
#    -набирать скорость
#    -показывать текущую скорость
#    -тормозить
#    -показывать количество вагонов
#    -прицеплять/отцеплять вагоны (по одному вагону за операцию,
#     метод просто увеличивает или уменьшает количество вагонов).
# ##   Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# ##   -Принимать маршрут следования
# ##   -Перемещаться между станциями, указанными в маршруте.
# ##   -Показывать предыдущую станцию, текущую, следующую, на основе маршрута

# next_s prev_s current_s

class Train

  #attr_writer
  attr_reader :type, :station, :speed, :wagons
  #attr_accessor
  #


  def initialize(speed = 0, wagons = 0, station , type)  ###
    @speed = speed
    @wagons = wagons
    @station = station
    @type = type
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
    if @speed == 0
      @wagons = @wagons - 1
    else
      puts "Нельзя отцепить вагон если поезд движется"
    end
  end

end
