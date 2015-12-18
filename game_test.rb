require 'minitest/autorun'
require './game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_number_of_guesses_at_start
    assert_equal 0, @game.number_of_guesses
  end

  def test_generate_number
    assert_equal true, @game.answer.to_s.length == 4
  end

  def test_valid_input
    assert_equal true, @game.guess(@game.answer)
  end

  def test_invalid_input_length
    assert_equal false, @game.guess(1234567)
    assert_equal 'Your guess must be a 4 digit number.', @game.error_message
  end

  def test_invalid_input_type
    assert_equal false, @game.guess('abcd')
    assert_equal 'Your guess must be a 4 digit number.', @game.error_message
  end

  def test_invalid_duplicate_digits
    assert_equal false, @game.guess(1233)
    assert_equal 'Your guess must not contain duplicate digits.', @game.error_message
  end
end
