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

import Ode.InputModel (UserInput, userInput, Input)
import Ode.GameModel (Player, GameState, defaultGame)
import Ode.Logic (stepGame)
import Ode.View (display)

delta : Signal Float
delta = Time.fps 30

input : Signal Input
input = Signal.sampleOn delta (Signal.map2 Input delta userInput)

gameState : Signal GameState
gameState = Signal.foldp stepGame defaultGame input

main : Signal Element
main = Signal.map2 display Window.dimensions gameState
