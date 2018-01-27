
items2 = { 'koasa' => { quantity: 3, price: 2 },
           'kolbasa1' => { quantity: 3, price: 5 },
           'kolbasa2' => { quantity: 3, price: 1 },
           'hleb' => { quantity: 2, price: 4 } }

items2.each do |key, val|
  p key + ': ' + (val[:quantity] * val[:price]).to_s
end

summa = 0
items2.each_value do |val|
  p '==============='
  puts summa
  summa += (val[:quantity] * val[:price])
  puts summa
end

p summa
