# Сумма покупок. Пользователь вводит поочередно название товара,
# цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара.
#
# На основе введенных данных требуетеся: Заполнить и вывести на экран хеш,
# ключами которого являются названия товаров, а значением - вложенный хеш,
# содержащий цену за единицу товара и кол-во купленного товара.
#
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине"

#items = []
#items2 = {}
#summa = []
#loop do
 # puts 'Товар'
#item = gets.chomp
 # break if item == 'stop'
 # puts 'Цена'
 # price = gets.to_i
 # puts 'Количество'
 # quantity = gets.to_i
 # items << [item, price, quantity ]
 # items2[item] = {quantity: quantity, price: price }
 # summa << price*quantity
#end

#p summa
#p summa.reduce(0, :+)
items2 = {"koasa"=>{:quantity=>3, :price=>2}, "kolbasa1"=>{:quantity=>3, :price=>5}, "kolbasa2"=>{:quantity=>3, :price=>1}, "hleb"=>{:quantity=>2, :price=>4}}
items2.each do |key, val|
  p key + ': ' + (val[:quantity] * val[:price] ).to_s
end
summa = 0
items2.each do |key, val|
  p '==============='
  puts summa
  summa = summa + (val[:quantity] * val[:price])
  puts summa
end

p summa