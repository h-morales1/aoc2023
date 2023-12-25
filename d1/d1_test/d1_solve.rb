#!/usr/bin/env ruby
require_relative "d1"

file = File.open("input") # puzzle input

file_data = file.readlines.map(&:chomp)

sum = 0
file_data.each do |line|
  first_digit = D1.get_first_digit(line)
  second_digit = D1.get_last_digit(line)
  puts "line: #{line}"
  puts "first digit: #{first_digit}, second digit: #{second_digit}"
  sum += D1.combine_digits(line)
end

puts "sum: #{sum}"
