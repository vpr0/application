class Route
  attr_reader :number, :stations

  def initialize(number)
    @stations = []
    @number = number
    validate!
  end

  def valid?
    validate!
  rescue StandardError => e
    puts e.message
    false
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def stations_list
    @stations.map do |station|
      puts "Станция: #{station.name}"
    end
  end

  private

  def validate!
    raise 'Номер не может быть меньше трех символов и больше 5-ти символов' if @number.size < 3 && @number.size > 5
    raise 'Марщруту можно содержать только станции' unless @stations.reject do |station|
      station.class == RailwayStation
    end.empty?
    true
  end
end
