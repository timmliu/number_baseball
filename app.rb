#!/usr/bin/env ruby
#app.rb

require "highline/import"
require 'active_support/inflector'

#guessing cycle
def run_cycle
	prompt_player
	run_compare
	if @strikes < 4
		return_hints
	else
		winner_msg
	end
	@cycles += 1
end

#generate 4 digit number without repeating digits
def generate_number
	@set = (0..9).to_a
	@a = @set.sample
	@b = (@set-[@a]).sample
	@c = (@set-[@a]-[@b]).sample
	@d = (@set-[@a]-[@b]-[@c]).sample
	@number = [@a,@b,@c,@d]
	#FOR TESTING
	#print "#{@number}\n"
end

#prompt player for a guess
def prompt_player
	@guess_string = ask "Guess a 4 digit number: "
	@guess_array = @guess_string.each_char.each_slice(1).map{|s| s.join}.collect{|s| s.to_i}
end

#compare guess to actual
def run_compare
	@strikes, @balls, @digit = 0, 0, 0
	4.times do
		if @number[@digit] == @guess_array[@digit]
			@strikes += 1
		elsif @number.include? @guess_array[@digit]
			@balls += 1
		else
		end
		@digit += 1
	end
end

#return hints (strikes and balls) to player
def return_hints
	@strike_label = "strike".pluralize(@strikes)
	@ball_label = "ball".pluralize(@balls)
	puts "#{@strikes} #{@strike_label} & #{@balls} #{@ball_label}"
end

#display winner message
def winner_msg
	@number = @number.join
	@guess_label = "guess".pluralize(@cycles)
	puts "You got it! The number is #{@number}!\n It took you #{@cycles} #{@guess_label}!"
end

#initialize
generate_number
@cycles = 1
run_cycle
while @strikes < 4 do
	run_cycle
end