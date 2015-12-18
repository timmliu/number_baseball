class Game
  attr_reader :answer, :error_message, :number_of_guesses

  def initialize
    @answer = generate_number
    @number_of_guesses = 0
  end

  def get_hints(guess)
    guess = split_digits(guess)
    correct_answer = split_digits(answer)
    strikes = 0
    balls = 0

    guess.each_with_index do |digit, index|
      if correct_answer.include?(digit)
        if (correct_answer[index] == guess[index])
          strikes += 1
        else
          balls += 1
        end
      end
    end

    { balls: balls, strikes: strikes }
  end

  def guess(number)
    @number_of_guesses += 1 if valid_number = valid?(number)
    valid_number && correct?(number)
  end

  private

  def correct?(guess)
    guess.to_i == answer
  end

  def duplicate_digits?(number)
    number.to_s.chars.map(&:to_i).uniq.length <= 3
  end

  def generate_number
    number = rand(1234..9876)
    if duplicate_digits?(number)
      generate_number
    else
      number
    end
  end

  def is_number?(input)
    input.to_s == input.to_i.to_s
  end

  def split_digits(number)
    number.to_s.chars.map(&:to_i)
  end

  def valid?(guess)
    if guess.length != 4 || !is_number?(guess)
      @error_message = 'Your guess must be a 4 digit number.'
      false
    elsif duplicate_digits?(guess)
      @error_message = 'Your guess must not contain duplicate digits.'
      false
    else
      @error_message = nil
      true
    end
  end
end
