#!/usr/bin/env ruby
module D1
#  file = File.open("input") # puzzle input
# TODO: handle possibility of no ints or no words being found, also duplicates
  #number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  def self.get_first_num(line)
    num = line[/[0-9]/]
    return num
  end

  def self.get_last_num(line)
    num = line.reverse[/[0-9]/]
    return num
  end

  def self.get_first_num_word(line)
    number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    indxs = [] # keep track of the index for words found
    numbers_found = [] # keep track of the words found

    number_words.each do |number|
      num_word = line[/#{number}/, 0] # search for zero, one, etc
      next if num_word.nil? # skip if no substring found
      indxs.push(line.index(num_word)) # store index of substring found
      numbers_found[line.index(num_word)] = number # store the substring found
    end

    min_indx = indxs.min
    if min_indx.nil?
      return nil
    end
    # return the word at the start of the string
    return numbers_found[min_indx]
  end

  def self.get_last_num_word(line)
    line_reversed = line.reverse # reverse input to start search from end
    number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    indxs = [] # keep track of the index for words found
    numbers_found = [] # keep track of the words found

    number_words.each do |number|
      number_reversed = number.reverse
      num_word = line_reversed[/#{number_reversed}/, 0] # search for zero, one, etc
      next if num_word.nil? # skip if no substring found
      indxs.push(line_reversed.index(num_word)) # store index of substring found
      numbers_found[line_reversed.index(num_word)] = number # store the substring found
    end

    min_indx = indxs.min
    if min_indx.nil?
      return nil
    end
    # return the word at the start of the string
    return numbers_found[min_indx]
  end

  def self.get_first_num_indx(line)
    num = get_first_num(line)
    num_index = line.index(num)

    return num_index
  end

  def self.get_last_num_indx(line)
    reverse_line = line.reverse
    last_num = get_last_num(line)
    last_num_indx = reverse_line.index(last_num)

    return last_num_indx
  end

  def self.get_first_num_word_indx(line)
    first_num_word = get_first_num_word(line)
    first_num_word_indx = line.index(first_num_word)

    return first_num_word_indx
  end

  def self.get_last_num_word_indx(line)
    last_num_word = get_last_num_word(line)
    reverse_word = last_num_word.reverse
    reverse_line = line.reverse
    last_num_word_indx = reverse_line.index(reverse_word)

    return last_num_word_indx
  end

  def self.get_first_digit(line)
    number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    # check to make sure num and words actually exist
    if get_first_num(line).nil?
      return number_words.index(get_first_num_word(line)).to_s
    end
    if get_first_num_word(line).nil?
      return get_first_num(line).to_s
    end
    first_num_indx = get_first_num_indx(line) # get index of first number
    first_num_word_indx = get_first_num_word_indx(line) # get index of first number word
    first_num = get_first_num(line) # get the first number as string
    first_num_word = number_words.index(get_first_num_word(line)) # convert number word into number

    # return the one with the lowest index as a string
    return (first_num_indx < first_num_word_indx) ? first_num : first_num_word
  end

  def self.get_last_digit(line)
    number_words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    # check to make sure num and words actually exist
    if get_last_num(line).nil?
      return number_words.index(get_last_num_word(line)).to_s
    end
    if get_last_num_word(line).nil?
      return get_last_num(line).to_s
    end
    last_num_indx = get_last_num_indx(line) # get index of last number
    last_num_word_indx = get_last_num_word_indx(line) # get index of last number word
    last_num = get_last_num(line) # get last number

    last_num_word = number_words.index(get_last_num_word(line)) # get last word number

    # return the one with the biggest index
    return (last_num_indx < last_num_word_indx) ? last_num.to_s : last_num_word.to_s
  end

  def self.combine_digits(line)
    first_digit = get_first_digit(line) # get first digit of string
    last_digit = get_last_digit(line) # get last digit of string
    combo = "#{first_digit}#{last_digit}" # combine both into one string

    # return combo as int
    return combo.to_i
  end
end
