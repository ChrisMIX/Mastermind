=begin

This is the initial proof of concept for the Mastermind logic. The rules are as follows...

A four color pattern is picked from the following (red, orange, yellow, green, blue, purple)

The player attempts to guess the pattern correctly.
They will have 10 attempts to do so.
With each attempt the computer will mark if any colors are correct but in the wrong space (designated by a red marker) or correct and in the right space (white marker)

The marker does not specify which space is being referred to so the player must figure it out themselves. After 10 attempts if the player fails the computer wins. A correct pattern leads to player victory.

=end

def greeting()
  puts "Would you like to start the game? (put y for yes and n for no)"
  user_in = gets.chomp

  if user_in == "y"
    new_game
  elsif user_in == "n"
    puts "Goodbye"
  else
    "invalid response"
    greeting
  end
end

COLOR_OPTIONS = ["red", "orange", "yellow", "green", "blue", "purple"]

def new_game()


  computer_pattern = [COLOR_OPTIONS[rand(0..5)], COLOR_OPTIONS[rand(0..5)], COLOR_OPTIONS[rand(0..5)], COLOR_OPTIONS[rand(0..5)]]

  game_start(computer_pattern)
end

def game_start(computer_pattern)
  puts "Welcome to Mastermind! The pattern has been decided. Make your first guess. Valid choices are red, orange, yellow, green, blue, and purple. Any other answers will lead to a wasted turn."
  round_count = 1

  until round_count == 11
    puts "Make a guess!"

    guess = gets.chomp
    guess = guess.split(" ")

    count = 0
    response = []
    until count == 3
      if computer_pattern[count] == guess[count]
        response << "white peg"
      elsif guess.include?(computer_pattern[count])
        response << "red peg"
      end

      count += 1
    end

    puts "Guess received. Response is #{response[0]}, #{response[1]}, #{response[2]}, #{response[3]}"

    round_count += 1

    return "CORRECTAMUNDO!" if response == ['white peg', 'white peg', 'white peg', 'white peg']
  end
end


greeting
