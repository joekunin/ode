{--
Main.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Main where

import Graphics.Element (..)
import Keyboard
import Signal
import Signal (Signal)
import Time (..)
import Window

import Ode.Model.InputModel (Input)
import Ode.Model.GameModel (GameState, initGameState)
import Ode.Logic (stepGame)
import Ode.View.GameView (view)

{-| Main function, which is the entry point into the game.
    Listens for changes to the window or game state and applies the view to them.
-}
main : Signal Element
main = Signal.map2 view Window.dimensions gameState

{-| Communicates changes in the game state or user input to the controller. I think.
    Idea is to start with initGameState and apply stepGame based on the input.
-}
gameState : Signal GameState
gameState = Signal.foldp stepGame initGameState input

{-| Sample user input on each clock tick.
-}
input : Signal (Time, { x:Int, y:Int }, Bool)
input = Signal.sampleOn delta (Signal.map3 (,,) delta Keyboard.arrows Keyboard.shift)

{-| Generates clock ticks.
-}
delta : Signal Time
delta = Signal.map (\t -> t / 20) (fps 25)
