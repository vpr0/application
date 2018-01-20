class Wagon

  include Developer
  attr_reader :type

  def initialize(type = '')
    @type = type
    validate!
  end

  def valid?
    validate!
  rescue => e
    puts e.message
    false
  end

  private

  def validate!
    if @type != 'Пассажирский' && @type != 'Грузовой'
      raise 'Тип вагона может быть только "Пассажирский" или "Грузовой"'
    end
    true
  end
end
