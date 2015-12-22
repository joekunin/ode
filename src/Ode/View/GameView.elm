{--
GameView.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.GameView where

import Graphics.Element exposing (..)

import Ode.Model.GameModel exposing (GameState)
import Ode.View.MapPane exposing (mapPane)
import Ode.View.PlayerPane exposing (playerPane)

{-| Function to display game state.

    (w, h) : window dimensions
    gameState : current game state
-}
view : (Int, Int) -> GameState -> Element
view (w, h) gameState =
  flow right
  [ mapPane (w, h) gameState
  , playerPane (w, h) gameState
  ]
