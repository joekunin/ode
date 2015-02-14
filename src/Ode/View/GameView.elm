{--
GameView.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View.GameView where

import Graphics.Collage (..)
import Graphics.Element (..)

import Ode.Model.GameModel (GameState)
import Ode.View.MapPane (mapPane)
import Ode.View.PlayerPane (playerPane)

{-| Function to display game state.
-}
view : (Int, Int) -> GameState -> Element
view (w, h) gameState =
  flow right
  [ mapPane (w, h) gameState
  , playerPane (w, h) gameState
  ]
