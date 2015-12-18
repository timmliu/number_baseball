require_relative 'game'

class Baseball
  attr_reader :game, :solved

  def initialize
    @game = Game.new
  end

  def run
    while !solved
      guess = prompt_user
      if solved = game.guess(guess)
        return congratulate
      elsif game.error_message
        show_error
      else
        give_hints_to_user(guess)
      end
    end
  end

  private

  def congratulate
    try_word = (game.number_of_guesses == 1) ? 'try' : 'tries'
    puts "Great job! You guessed the number #{game.answer} correctly! It took you #{game.number_of_guesses} #{try_word}."
  end

  def give_hints_to_user(guess)
    hints = game.get_hints(guess)
    puts "#{hints[:strikes]} strikes, #{hints[:balls]} balls"
  end

  def prompt_user
    puts 'What do you think the 4 digit number is?'
    gets.chomp
  end

  def show_error
    puts game.error_message
  end
end

baseball = Baseball.new
baseball.run
