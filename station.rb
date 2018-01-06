class RailwayStation

  attr_reader :name

  def initialize(name, trains = [])
    @name = name
    @trains = trains
  end

  def trains
    puts "Пассажирские поезда: #{trains_passenger}, Грузовые поезда: #{trains_cargo}"
  end

  def trains_list
    @trains.each do |train|
      puts "Тип: #{train.type}, Скорость: #{train.speed}, Кол-во вагонов: #{train.wagons}, Станция: #{train.station.name}"
    end
  end

  def add_train(train)
    @trains << train
  end

  def del_train(train)
    @trains.delete(train)
  end

  private

  def trains_passenger
    count = 0
    @trains.each { |train| count += 1 if train.is_a?(PassengerTrain) }
    count
  end

  def trains_cargo
    count = 0
    @trains.each { |train| count += 1 if train.is_a?(CargoTrain) }
    count
  end

end
