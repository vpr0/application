#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным

puts "Число" #02
day = gets.to_i
puts "Месяц" #04
month = gets.to_i
puts "Год" #1999
year = gets.to_i
# t = Time.new(year, month, day)
# t.yday
year
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
vysok_ili_net = year%4 == 0
day2 = vysok_ili_net ? 1 : 0
sum = 0
months.each{|m| sum+=m}
puts sum
sum = 0
months[0..(month-2)].each{|m| sum+=m}
puts sum + day + day2


























































#26 08 83

# Сумма покупок. Пользователь вводит поочередно название товара,
# цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся: Заполнить и вывести на экран хеш,
# ключами которого являются названия товаров, а значением - вложенный хеш,
# содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине"