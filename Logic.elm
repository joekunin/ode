{--
Logic.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Logic where

import InputModel (Input, userInput)
import GameModel (GameState)

{-- Part 3: Update the game ---------------------------------------------------

How does the game step from one state to another based on user input?

Task: Redefine `stepGame` to use the UserInput and GameState
      you defined in parts 1 and 2. Maybe use some helper functions
      to break up the work, stepping smaller parts of the game.

------------------------------------------------------------------------------}

stepGame : Input -> GameState -> GameState
stepGame { timeDelta, userInput } gameState =
  gameState
