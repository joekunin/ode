{--
InputModel.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Model.InputModel where

import Keyboard
import Signal

{-- Part 1: Model the user input ----------------------------------------------

What information do you need to represent all relevant user input?

Task: Redefine `UserInput` to include all of the information you need.
      Redefine `userInput` to be a signal that correctly models the user
      input as described by `UserInput`.

(This seems more like view-related stuff, not model stuff. [WLW])

------------------------------------------------------------------------------}

{-| Overall input type, including both clock ticks and user input.

    timeDelta : number of millis since the last tick.
    userInput : explicit action by the user (e.g. keypresses, mouse movements)
-}
type alias Input =
  { timeDelta : Float
  , userInput : UserInput
  }

{-| User-generated input type.
-}
type alias UserInput =
  {
  }

{-| Instance for user-generated inputs.
-}
userInput : Signal UserInput
userInput = Signal.constant {}
