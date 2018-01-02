#Станция:
#  -Имеет название, которое указывается при ее создании
#  -Может принимать поезда
#  -Может показывать список всех поездов на станции, находящиеся в текущий момент
#  -Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#  -Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).

class RailwayStation

  attr_reader :name

  def initialize(name, trains = [])
    @name = name
    @trains = trains
  end

  def trains
    puts "Пассажирские поезда: #{trains_pass}, Грузовые поезда: #{trains_gruz}"
  end

  def trains_list
    @trains.each do |train|
      puts "Тип: #{train.type}, Скорость: #{train.speed}, Кол-во вагонов: #{train.wagons}, Станция: #{train.station.name}"
    end
  end

  def trains_pass
    count = 0
    @trains.each { |train| count += 1 if train.type == 'pass' }
    count
  end

  def trains_gruz
    count = 0
    @trains.each { |train| count += 1 if train.type == 'gruz' }
    count
  end

  def add_train(train)
    @trains << train
  end

  def del_train(train)
    @trains.delete(train)
  end

end
