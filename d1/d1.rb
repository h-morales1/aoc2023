#!/usr/bin/env ruby

file = File.open("input")

nums = [
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine"
]

file_data = file.readlines.map(&:chomp)
#
sum = 0 # final sum
def proc_line( line )
  first_n = line[/[0-9]/, 0] # extract first number
  second_n = line.reverse[/[0-9]/,0] # extract last number
  num = (first_n + second_n).to_i # combine strings into 1 num, conv to int

  puts  "#{first_n}#{second_n}"

  return num
end

## find first num(int)
## find first num(string) -Iterate through array of strings
## compare index, lower is real first
##
## iterate through array of strings
## check if substring is in text
## check its index, if it is lower than int_indx we found a winner

# extract first number(string or num)
def get_num1(line, nums)
  first_n_str = line[/[0-9]/, 0] # extract first number
  first_n_str_indx = line.index(first_n_str) # get index of number

  for num in nums
    first_n_int = line[/#{num}/,0] # get first number int
    if !first_n_int.nil?
      first_n_int_indx = line.index(first_n_int) # get its index

      if first_n_int_indx < first_n_str_indx && !first_n_int_indx.nil?
        return nums.index(num)
      end

    end

  end
  return first_n_str.to_i
end

def get_num2(line, nums)
  second_n_str = line.reverse[/[0-9]/, 0] # extract last number
  second_n_str_indx = line.index(second_n_str) # get the index of number

  # try and find any matches to strings in nums
  for num in nums
    reversed = num.reverse
    second_n_int = line.reverse[/#{reversed}/, 0]
    if !second_n_int.nil?
      second_n_int_indx = line.reverse.index(second_n_int) # get its index

      if second_n_int_indx < second_n_str_indx && !second_n_int_indx.nil?
        return nums.index(num)
      end
    end
  end
  return second_n_str.to_i
end

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
      # TODO: figure out a way to compare old and new indx
    end
  end
  min = indxs.min # get the smallest index

  return min
end

def get_first_word(line, nums)
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

end

def process_line(line, nums)
  first_num_indx = line.index(line[/[0-9]/])
  first_num_word_indx = get_num_word_indx(line, nums)

  if first_num_word_indx.nil?
    puts "#{line}, has int first"
  elsif first_num_indx < first_num_word_indx
    puts "#{line}, has int first"
  else
    puts "#{line}, has word first"
  end
end

# for line in file_data
#  sum += proc_line line
# end

file_data.each { |line| process_line line, nums }

# puts "Sum is: #{sum}"
# File.foreach("input") { |line| proc_line line, sum }
