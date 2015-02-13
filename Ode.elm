{--
Ode.elm

Copyright (c) 2015 Willie Wheeler.
--}

import InputModel (UserInput, userInput, Input)
import GameModel (Player, GameState, defaultGame)
import Logic (stepGame)
import View (display)

import Graphics.Element (..)
import Signal
import Signal (Signal)
import Time
import Window

delta : Signal Float
delta = Time.fps 30

input : Signal Input
input = Signal.sampleOn delta (Signal.map2 Input delta userInput)

gameState : Signal GameState
gameState = Signal.foldp stepGame defaultGame input

main : Signal Element
main = Signal.map2 display Window.dimensions gameState
