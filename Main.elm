{--
Main.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Main where

import Graphics.Element (..)
import Signal
import Signal (Signal)
import Time
import Window

import Ode.Model.InputModel (userInput, Input)
import Ode.Model.GameModel (GameState, defaultGame)
import Ode.Logic (stepGame)
import Ode.View.GameView (view)

{-| Main function, which is the entry point into the game.
-}
main : Signal Element
main = Signal.map2 view Window.dimensions gameState

{-| Communicates changes in the game state or user input to the controller. I think.
-}
gameState : Signal GameState
gameState = Signal.foldp stepGame defaultGame input

{-| Checks for user input changes based on clock ticks.
-}
input : Signal Input
input = Signal.sampleOn delta (Signal.map2 Input delta userInput)

{-| Generates clock ticks.
-}
delta : Signal Float
delta = Time.fps 30
