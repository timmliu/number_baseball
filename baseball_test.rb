require 'minitest/autorun'
require './baseball'

class TestBaseball < Minitest::Test

  # def setup
  #   @baseball = Baseball.new
  # end
  #
  # def test_number_of_guesses_at_start
  #   assert_equal 0, @baseball.number_of_guesses
  # end
  #
  # def test_valid_input
  #   assert_equal true, @baseball.valid_input?(1234)
  # end
  #
  # def test_invalid_input_length
  #   assert_equal false, @baseball.valid_input?(1234567)
  #   assert_equal false, @baseball.valid_input?(12)
  # end
  #
  # def test_invalid_input_type
  #   assert_equal false, @baseball.valid_input?('12ab')
  #   assert_equal false, @baseball.valid_input?('abcd')
  # end
end
