require 'mathn'
puts 'a = '
a = gets.to_i
puts 'b = '
b = gets.to_i
puts 'c = '
c = gets.to_i
d = (b**2 - 4 * a * c)
k = Math.sqrt(d)
if d > 0
  x1 = (-b + k) / (2 * a)
  x2 = (-b - k) / (2 * a)
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d.zero?
  x = -d / (2 * a)
  puts "x = #{x}"
elsif d < 0
  puts "Корней нет, D = #{d}"
end
