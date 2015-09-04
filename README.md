# Hangman
A command line Hangman game.  To run the game type ```ruby Hangman.rb``` into the command line after navigating to the current directory where the contents are.

# Game Interface
Hangman will prompt you for your choice and you will be provided a visual on correct letters, letters guessed, and of course the hangman graphic itself to let you know how close you are.\

### Upon Load:
```
=====================================================================
Hello!  Welcome to a command line version of the classic Hangman.
Would you like to start a new game or would you like to load a game?
Please type 'new' or 'load': new
=====================================================================
Excellent choice!  The word we have chosen for you 
is 8 letters long.  Good Luck!
=====================================================================

      __________
      |        |
               |
               |
               |
               |
               |
               |
    ============
Letters Guessed: []
Please type 'save' to save current game or guess a letter:
```
### After First Choice:
```
Please type 'save' to save current game or guess a letter: e

E was found!

      __________
      |        |
               |
               |
               |
               |
               |
               |
    ============
  _   e   _    _    _    _    _  
Letters Guessed: ["e"]
Please type 'save' to save current game or guess a letter: 
```