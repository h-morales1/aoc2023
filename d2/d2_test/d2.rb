#!/usr/bin/env ruby

file = File.open('input')

MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

file_data = file.readlines.map(&:chomp)

def get_game_id(input_string)
  colon_indx = input_string.index(':')
  pre_num = input_string[0..colon_indx-1]
  nums = pre_num.split(/[^\d]/).join
end
