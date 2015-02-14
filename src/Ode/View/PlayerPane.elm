{-
PlayerPane.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.PlayerPane where

import Graphics.Collage (..)
import Graphics.Element (..)
import Markdown

import Ode.Model.GameModel (GameState)

{-| Render the player pane.
-}
playerPane : (Int, Int) -> GameState -> Element
playerPane (w, h) gameState =
  flow down
  [ Markdown.toElement "# Adventurer"
  , Markdown.toElement ("Gold: " ++ (toString gameState.player.gold))
  , Markdown.toElement ("Experience: " ++ (toString gameState.player.experience))
  , Markdown.toElement ("Hit Points: " ++ (toString gameState.player.hitPoints))
  ]
