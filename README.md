## README FILE for Number Baseball game ##

## Introduction

The point of this exercise is to compare different approaches to the same problem. It is even more interesting when the same person is asked to do the same exercise after a long period of time has passed. In my case, the first time I tried solving the problem was when I just started learning Ruby (baseball_original.rb). The second solution is written a little less than two years later (baseball_new.rb).

## Explanation of the game

The goal of the game is to correctly guess a randomly generated 4 digit number (with unique digits) in as few guesses as you can.

Following each guess, the app will return hints to help you for your next guess.

### Hints work as follows:

- You get a "strike" for each guess that has the correct number with the correct position.
- You get a "ball" for each guess that has the correct number with an incorrect position.

These are mutually exclusive, so you will only ever get 1 strike or 1 ball per digit.

### Example:

1. The actual number is 1234.
2. You guess 1428.
3. The app should respond with:
- 1 strike
- 2 balls

### Requirements for the exercise

- The app should prompt the user for input.
- The app should validate the user input and display helpful messaging if the user input is invalid.
- You can decide whether 0 is acceptable as the first digit of the number.
- The app should return correct hints for the user's guesses.
- The app should tell you how many tries it took you to get the correct answer.

## end README ###
