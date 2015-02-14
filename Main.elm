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

import Ode.Model.InputModel (UserInput, userInput, Input)
import Ode.Model.GameModel (Player, GameState, defaultGame)
import Ode.Logic (stepGame)
import Ode.View (view)

{-| Main function, which is the entry point into the game.
-}
main : Signal Element
main = Signal.map2 view Window.dimensions gameState

gameState : Signal GameState
gameState = Signal.foldp stepGame defaultGame input

input : Signal Input
input = Signal.sampleOn delta (Signal.map2 Input delta userInput)

delta : Signal Float
delta = Time.fps 30
