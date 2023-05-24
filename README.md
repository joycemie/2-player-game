#part 1:
Hangman is a simple 2-player game where one player picks a word or phrase and the other player tries to guess it. The word to guess is marked out by underscores, where each underscore represents one letter. The guesser picks one letter at a time. If the letter is in the word then all occurrences of that letter replace the dash(es) at the appropriate place(s). The game continues until either the guesser picks all the letters in the word, or until they reach a predetermined limit of incorrect guesses.
(a) Write an assembly program that reads a word entered by the player. The word is composed of one or more lowercase letters only followed by a new line character. Then read a single, lowercase letter followed by a newline character which is a guess. Print the state of the game after one guess, where if the guessed letter appears in the word then it is printed in its correct spot(s), otherwise a underscore is printed in place of the letter in the word. A newline character should be printed at the end of the state. The ASCII code value of a newline character is the hex number 0xA.
For example, if the user enters the word waterloo, then enters the letter o, the following characters will be printed on their own line:
_ _ _ _ _ _oo
Test your solution using the noargs front end.

#part 2:
Write a more complete version of the game that reads a word entered by the player, and accepts multiple guesses one letter at a time. This continues until either the player guesses all the letters in the original word or until they have made six guesses where the letter guessed is not in the word. You are not required to keep track of which letters have been guessed. After each guess, the state of the game as described in part (a) should appear on its own line. If the player guesses all the letters, then print an uppercase W, followed by a newline character. If the player runs out of guesses, then print an uppercase L, followed by a newline character.
Here are two sample interactions of the game. For clarity, the user input appears in italics and output appears in bold.
<img width="320" alt="image" src="https://github.com/joycemie/2-player-game/assets/134363926/f40d01fd-7cd1-4c9f-86e1-36ddfff669dd">

Write a more complete version of the game that reads a word entered by the player, and accepts multiple guesses one letter at a time. This continues until either the player guesses all the letters in the original word or until they have made six guesses where the letter guessed is not in the word. You are not required to keep track of which letters have been guessed. After each guess, the state of the game as described in part (a) should appear on its own line. If the player guesses all the letters, then print an uppercase W, followed by a newline character. If the player runs out of guesses, then print an uppercase L, followed by a newline character.
