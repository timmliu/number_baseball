class Baseball
  def initialize
    @number_of_guesses = 0
    generate_number
    game
  end

  private

  def correct?(guess)
    guess.to_i == @number
  end

  def duplicate_digits?(number)
    number.to_s.chars.map(&:to_i).uniq.length <= 3
  end

  def game
    if correct?(user_input)
      success_message
    else
      give_hints_to_user
      game
    end
  end

  def generate_number
    @number = rand(1234..9876)
    if duplicate_digits?(@number)
      generate_number
    else
      @number
    end
  end

  def get_hints
    guess = split_digits(@guess)
    number = split_digits(@number)
    strikes = 0
    balls = 0

    guess.each_with_index do |digit, index|
      if number.include?(digit)
        if (number[index] == guess[index])
          strikes += 1
        else
          balls += 1
        end
      end
    end

    { balls: balls, strikes: strikes }
  end

  def give_hints_to_user
    puts "#{get_hints[:strikes]} strikes, #{get_hints[:balls]} balls"
  end

  def is_number?(input)
    input.to_s == input.to_i.to_s
  end

  def split_digits(number)
    number.to_s.chars.map(&:to_i)
  end

  def success_message
    try_word = (@number_of_guesses == 1) ? 'try' : 'tries'
    puts "Great job! You guessed the number #{@number} correctly! It took you #{@number_of_guesses} #{try_word}."
  end

  def user_input
    puts 'What do you think the 4 digit number is?'
    @guess = gets.chomp
    @number_of_guesses += 1
    if valid_input?(@guess)
      @guess
    else
      puts @error_message
      user_input
    end
  end

  def valid_input?(guess)
    if guess.length != 4 || !is_number?(guess)
      @error_message = 'Your guess must be a 4 digit number.'
      false
    elsif duplicate_digits?(guess)
      @error_mesage = 'Your guess must not contain duplicate digits.'
      false
    else
      true
    end
  end
end

Baseball.new
