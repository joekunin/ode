{--
Logic.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Logic where

import Ode.Model.InputModel (Input, userInput)
import Ode.Model.GameModel (GameState)

{-- Part 3: Update the game ---------------------------------------------------

How does the game step from one state to another based on user input?

Task: Redefine `stepGame` to use the UserInput and GameState
      you defined in parts 1 and 2. Maybe use some helper functions
      to break up the work, stepping smaller parts of the game.

------------------------------------------------------------------------------}

stepGame : Input -> GameState -> GameState
stepGame { timeDelta, userInput } gameState =
  { player = gameState.player
  , timeDelta = timeDelta
  }
