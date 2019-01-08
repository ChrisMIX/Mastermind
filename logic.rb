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
  puts computer_pattern[0]
  puts computer_pattern[1]
  puts computer_pattern[2]
  puts computer_pattern[3]
  game_start(computer_pattern)
end

def game_start(computer_pattern)
  puts "Welcome to Mastermind! The pattern has been decided. Make your first guess. Valid choices are red, orange, yellow, green, blue, and purple. Any other answers will lead to a wasted turn."
  round_count = 1
  computer_pattern2 = []
  computer_pattern2 << computer_pattern[0]
  computer_pattern2 << computer_pattern[1]
  computer_pattern2 << computer_pattern[2]
  computer_pattern2 << computer_pattern[3]

  until round_count == 11
    puts "Make a guess!"

    guess = gets.chomp
    guess = guess.split(" ")

    count = 0
    response = {}
    until count == 4

      if computer_pattern[count] == guess[count]
        response[count] = 'white peg'
        guess[count] = "white peg"
        computer_pattern2[count] = "white peg"
      else
        response[count] = "nada"
      end

      count += 1
    end

    count = 0

    until count == 4
      if guess[count] != "white peg" && computer_pattern2.include?(guess[count]) && response[count] != "white peg"

        response[count] = "red peg"
        computer_pattern2[computer_pattern2.index(guess[count])] = "red peg"
      end

      count += 1
    end
    puts "#{response}"
    puts "Guess received. Response is #{response[0]}, #{response[1]}, #{response[2]}, #{response[3]}"

=begin
      puts "The pattern is..."
      computer_pattern.each do |p|
          print p
      end

      puts "\n"

      puts "The second pattern is..."
      computer_pattern2.each do |l|
          print l
      end
=end

    round_count += 1

    computer_pattern2 = []

    if response == ['white peg', 'white peg', 'white peg', 'white peg']
      puts "CORRECT"
      return
    end
  end
end


greeting
