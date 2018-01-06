#Сделать хеш, содеращий месяцы и количество дней в месяце.
# В цикле выводить те месяцы, у которых количество дней ровно 30

months = {jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31, sep: 30, oct: 31, nov: 30, dec: 31 }
months.each { |month, day| puts month if day == 30 }
array_of_30_days = months.map { |month, day| month if day == 30 }
array_of_31_days = months.map { |month, day| month if day !=  30 }

array = [ 1, 2, 3, 'a', 'b'] # это массив
hash = { a: '1', b: '2', c: 3, 'd': 4, 'e' => 5, e: 6} # это ассоциативный массив, простыми словами хэш


#Заполнить массив числами от 10 до 100 с шагом 5

array = []
10.step(100, 5) {|n| array.push(n) }
array

#Заполнить массив числами фибоначи до 100

#1, 2, 3, 5, 8, 13, 21, 34, 55, 89
array = []
100.times do
  new_number = array[-1] && array[-2] ? array[-1] + array[-2] : 1
  array << new_number if new_number <= 100
end
array.uniq

#Заполнить хеш гласными буквами,
# где значением будет являтся порядковый номер буквы в алфавите (a - 1).

hash = {} #('a'..'z').to_a.each_with_index { |val, index| hash.merge!({val => index+1}) if ['a', 'e', 'i', 'o', 'u'].include? val }
letters = ('a'..'z').to_a
glasnie = ['a', 'e', 'i', 'o', 'u']
letters.each_with_index { |val, index| hash.merge!({val => index+1}) if glasnie.include? val }
hash

