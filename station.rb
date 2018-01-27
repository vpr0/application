class RailwayStation
  attr_reader :name
  @@stations = []
  def self.all
    @@stations.each do |station|
      puts "Станция: #{station.name}"
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validate!
  end

  def each_trains
    @trains.each { |train| yield(train) }
  end

  def valid?
    validate!
  rescue StandardError => e
    puts e.message
    false
  end

  def trains
    puts "Пассажирские поезда: #{trains_passenger}, Грузовые поезда: #{trains_cargo}"
  end

  def trains_list
    @trains.each do |train|
      puts "Тип: #{train.type},
            Скорость: #{train.speed},
            Кол-во вагонов: #{train.wagons},
            Станция: #{train.station.name}"
    end
  end

  def add_train(train)
    @trains << train
  end

  def del_train(train)
    @trains.delete(train)
  end

  private

  def validate!
    raise 'Имя должно быть от 2 до 20 символов' if @name.size < 2 && @name.size > 20
    raise 'Станция может содержать только поезда' unless @trains.reject { |train| train.class == Train }.empty?
    true
  end

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
