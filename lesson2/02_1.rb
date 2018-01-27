# Сделать хеш, содеращий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней 30
months = { jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31, sep: 30, oct: 31, nov: 30, dec: 31 }
months.each { |month, day| puts month if day == 30 }
array_of_30_days = months.map { |month, day| month if day == 30 }
array_of_31_days = months.map { |month, day| month if day != 30 }
# тут он говорит что эти переменные нигде не используются
p array_of_30_days
p array_of_31_days
# Заполнить массив числами от 10 до 100 с шагом 5
numbers = []
10.step(100, 5) { |n| numbers.push(n) }
# Заполнить массив числами фибоначи до 100
numbers = []
100.times do
  new_number = numbers[-1] && numbers[-2] ? numbers[-1] + numbers[-2] : 1
  numbers << new_number if new_number <= 100
end
numbers.uniq
# Заполнить хеш гласными буквами,
hash = {}
letters = ('a'..'z').to_a
glasnie = %w[a e i o u] # ['a', 'e', 'i', 'o', 'u']
letters.each_with_index do |val, index|
  hash.merge!(val => (index + 1)) if glasnie.include?(val)
end
hash
