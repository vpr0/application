puts "Как тебя зовут?"
name = gets.chomp
puts "Какой у тебя рост?"
height = gets.to_i
weight = height - 110
if weight > 0
ideal_weight = weight
else
ideal_weight = 'Ваш вес уже оптимальный'
end
puts "#{name}, твой идеальный вес - #{ideal_weight}"

