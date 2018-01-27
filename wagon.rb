class Wagon
  include Developer
  attr_reader :type

  def initialize(type = '')
    @type = type
    validate!
  end

  def valid?
    validate!
  rescue StandardError => e
    puts e.message
    false
  end

  private

  def validate!
    raise 'Тип вагона может быть только "Пассажирский" или "Грузовой"' if @type != 'Пассажирский' && @type != 'Грузовой'
    true
  end
end
