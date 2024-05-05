# d2_spec.rb

# requires

def input_string
  input_string = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
end

RSpec.describe "An ideal d2 module" do
  it "gets the game id" do
    game_id = D2.get_game_id(input_string)
    expect(game_id).to eq("1")
  end
end
