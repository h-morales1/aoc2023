#!/usr/bin/env ruby

file = File.open('input')

nums = [
  'zero',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
]

file_data = file.readlines.map(&:chomp)
# extract num word index for first word
def get_num_word_indx(line, nums)
  indxs = []
  for num in nums
    num_word = line[/#{num}/, 0] # search for substring
    unless num_word.nil?
      num_word_index = line.index(num_word)
      indxs.push(num_word_index)
      # TODO: figure out a way to compare old and new indx
    end
  end
  min = indxs.min

  return min
end

# extract second num word index
def get_second_num_word_indx(line, nums)
  indxs = []
  for num in nums
    reversed = num.reverse # reverse string we are searching for
    num_word = line.reverse[/#{reversed}/, 0] # search for substring but reversed
    unless num_word.nil?
      num_word_index = line.index(num_word) # index of word number we found
      indxs.push(num_word_index) # store index
    end
  end
  min = indxs.min # get the smallest index

  return min
end

def get_first_word(line, nums)
  indxs = []
  words_found = []
  for num in nums
    num_word = line[/#{num}/, 0] # search for substring
    unless num_word.nil?
      num_word_index = line.index(num_word)
      indxs.push(num_word_index)
      words_found[num_word_index] = num
    end
  end
  min = indxs.min # get the word that shows up first, index
  number_word = words_found[min] # the actual word
  converted = nums.index(number_word) # convert word into its number equivalent
end

def process_line(line, nums)
  first_num_indx = line.index(line[/[0-9]/])
  first_num_word_indx = get_num_word_indx(line, nums)

  first_num = 0

  if first_num_word_indx.nil?
    puts "#{line}, has int first"
    # call default get_num1
    first_num = line[/[0-9]/]
  elsif first_num_indx < first_num_word_indx
    puts "#{line}, has int first"
    # call default get_num1
    first_num = line[/[0-9]/]
  else
    puts "#{line}, has word first"
    first_num = get_first_word(line, nums)
    # call function to get word
  end

  # handle other end of line
  reversed_line = line.reverse
  reversed_nums = [] # store reverse of number strings
  nums.each { |num| reversed_nums.push(num.reverse) } # reverse number words
  second_num_indx = reversed_line.index(reversed_line[/[0-9]/])
  second_num_word_indx = get_num_word_indx(reversed_line, reversed_nums)

  second_num = 0

  if second_num_word_indx.nil?
    # call default get_num1
    second_num = reversed_line[/[0-9]/]
  elsif second_num_indx < second_num_word_indx
    # call defulat get_num1
    second_num = reversed_line[/[0-9]/]
  else
    # call funct to get word
    second_num = get_first_word(reversed_line, reversed_nums)
  end

  both_num = "#{first_num}#{second_num}"
  puts "final: #{both_num}"
  final_num = both_num.to_i
end

total = 0
file_data.each { |line| total += process_line line, nums }

puts "total: #{total}"
