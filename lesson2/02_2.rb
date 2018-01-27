puts 'Число'
day = gets.to_i
puts 'Месяц'
month = gets.to_i
puts 'Год'
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
vysok_ili_net = (year % 4).zero?
day2 = vysok_ili_net ? 1 : 0
sum = 0
months.each { |m| sum += m }
puts sum
sum = 0
months[0..(month - 2)].each { |m| sum += m }
puts sum + day + day2
