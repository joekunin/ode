{--
InputModel.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.InputModel where

import Keyboard
import Signal

{-- Part 1: Model the user input ----------------------------------------------

What information do you need to represent all relevant user input?

Task: Redefine `UserInput` to include all of the information you need.
      Redefine `userInput` to be a signal that correctly models the user
      input as described by `UserInput`.

------------------------------------------------------------------------------}

type alias UserInput = {}

userInput : Signal UserInput
userInput = Signal.constant {}

type alias Input =
  { timeDelta : Float
  , userInput : UserInput
  }
