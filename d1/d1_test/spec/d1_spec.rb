# d1_spec.rb

require_relative "../d1"

def input_string
  #input_string = "sthreetd2dgefd4fived"
  input_string = "sdpgz3five4seven6fiveh"
end
RSpec.describe "An ideal d1 module" do
  it "uses get_first_num to return the first number in string" do
    first_num = D1.get_first_num(input_string)
    expect(first_num).to eq("3")
  end

  it "uses get_last_num to return the last number in string" do
    last_num = D1.get_last_num(input_string)
    expect(last_num).to eq("6")
  end

  it "uses get_first_num_word to return the first num word in string" do
    first_num_word = D1.get_first_num_word(input_string)
    expect(first_num_word).to eq("five")
  end

  it "uses get_last_num_word to return the last num word in string" do
    last_num_word = D1.get_last_num_word(input_string)
    expect(last_num_word).to eq("five")
  end

  it "uses get_first_num_indx to return the index of first num in string" do
    first_num_indx = D1.get_first_num_indx(input_string)
    expect(first_num_indx).to eq(5)
  end

  it "uses get_last_num_indx to return the index of last num in string" do
    last_num_indx = D1.get_last_num_indx(input_string)
    expect(last_num_indx).to eq(5)
  end

  it "uses get_first_num_word_indx to return the index of first num word in string" do
    first_num_word_indx = D1.get_first_num_word_indx(input_string)
    expect(first_num_word_indx).to eq(6)
  end

  it "uses get_last_num_word_indx to return the index of last num word" do
    last_num_word_indx = D1.get_last_num_word_indx(input_string)
    expect(last_num_word_indx).to eq(1)
  end

  it "uses get_first_digit to return a string representing first digit in string" do
    first_digit = D1.get_first_digit(input_string)
    expect(first_digit).to eq("3")
  end

  it "uses get_last_digit to return a string representing last digit in string" do
    last_digit = D1.get_last_digit(input_string)
    expect(last_digit).to eq("5")
  end

  it "uses combine_digits to return an int using first and last digits" do
    combined_digits = D1.combine_digits(input_string)
    expect(combined_digits).to eq(35)
  end
end
