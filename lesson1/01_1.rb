puts 'Как тебя зовут?'
name = gets.chomp
puts 'Какой у тебя рост?'
height = gets.to_i
weight = height - 110
ideal_weight = if weight > 0
                 weight
               else
                 'Ваш вес уже оптимальный'
               end
puts "#{name}, твой идеальный вес - #{ideal_weight}"
