require_relative 'modules'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
tr1 = PassengerTrain.new
st1 = RailwayStation.new('Востряково')
stations = []
stations << st1
stations << RailwayStation.new('Симферополь')
stations << RailwayStation.new('Севастополь')
stations << RailwayStation.new('Керч')
trains = []
st1.each_trains { |train| puts train.number }
tr1.each_wagons { |wagon| puts wagon.type }
def print_trains(trains)
  trains.each_with_index { |train, index| puts "#{index} - #{train.type}, Вагонов: #{train.wagons}" }
end

def print_stations(stations)
  stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
end

str = ''
while str != 0
  puts ' 1 - Создать станцию'
  puts ' 2 - Создать поезд'
  puts ' 3 - Прицепить вагон'
  puts ' 4 - Отцепить вагон'
  puts ' 5 - Добавить поезд на станцию'
  puts ' 6 - Список станций'
  puts ' 7 - Список поездов на станции'
  str = gets.to_i
  case str
    when 1
    puts 'Введите название станции'
    name = gets.chomp
    stations << RailwayStation.new(name)
    when 2
      puts 'Введите 1 если хотите создать пассажирский поезд или введите 2 если хотите создать грузовой поезд'
      type = gets.to_i
      if type == 1
        trains << PassengerTrain.new
      elsif type == 2
        trains << CargoTrain.new
      else
        puts 'Error: неверный тип поезда!'
      end
    when 3
      print_trains(trains)
      puts 'Введите поезд к которому прицепить вагон'
      t = gets.to_i
      if trains[t]
        trains[t].add_wagon
      else
        puts 'Поезда не существует'
      end
    when 4
      print_trains(trains)
      puts 'Введите поезд от которого отцепить вагон'
      t = gets.to_i
      if trains[t]
        trains[t].del_wagon
      else
        puts 'Поезда не существует'
      end
    when 5
      print_stations(stations)
      puts 'Введите станцию'
      s = gets.to_i
      if stations[s]
        print_trains(trains)
        puts 'Введите поезд'
        t = gets.to_i
        if trains[t]
          stations[s].add_train(trains[t])
        else
          puts 'Поезда не существует'
        end
      else
        puts 'Станции не существует'
      end
    when 6
      print_stations(stations)
    when 7
      print_stations(stations)
      puts 'Введите станцию'
      s = gets.to_i
      stations[s].trains
  else
    puts  '!!!НЕВЕРНАЯ КОМАНДА!!!'
  end
end

#У класса RailwayStation написать метод,
# который принимает блок и выполняет действия
# из блока над каждым поездом (Train),
# находящимся в данный момент на станции.
#У класса Train написать метод,
# который принимает блок и проходит
# по всем вагонам поезда, передавая
# каждый объект вагона в блок.
 #   С учетом того, что еще предыдущее
# задание было для многих сложным и не все
# еще с ним управились, задание к этому уроку
# будет не очень объемным и сложным.
# Тут главное понять, как работают блоки.
#

