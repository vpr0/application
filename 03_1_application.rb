#С этого занятия мы будем создавать прилоежение, которое поможет диспетчеру железнодорожной странции управлять поездами:
# принимать, отправлять, показывать информацию и т.д. (точнее, мы будем создавать его объектную модель). Нужно написать:
#*: Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.

require_relative '03_2_train'
require_relative '03_3_station'
require_relative '03_4_route'

station1 = RailwayStation.new('Востряково')
station2 = RailwayStation.new('Симферополь')
station3 = RailwayStation.new('Севастополь')
station4 = RailwayStation.new('Керч')

train1 = Train.new(0, 10, station1, 'pass')
train2 = Train.new(0, 20, station1, 'gruz')
train3 = Train.new(0, 15, station1, 'pass')
train4 = Train.new(0, 11, station1, 'pass')
train5 = Train.new(0, 13, station1, 'gruz')

station1.add_train(train1)
station1.add_train(train2)
station1.add_train(train3)
station1.del_train(train3)
station2.add_train(train3)
station2.add_train(train4)
station2.add_train(train5)
p station1.name
station1.trains
station1.trains_list

p station2.name
station2.trains
station2.trains_list

route1 = Route.new(101, [station1, station3])
route2 = Route.new(102, [station3, station2])
route3 = Route.new(102, [station2, station4])

route1.stations_list
route1.add_station(station2)
route1.add_station(station4)
route1.del_station(station4)
route1.stations_list

