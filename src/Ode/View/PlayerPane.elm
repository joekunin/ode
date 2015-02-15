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
  let player = gameState.player
  in
    flow down
    [ Markdown.toElement "# Adventurer"
    , Markdown.toElement ("Gold: " ++ (toString player.gold))
    , Markdown.toElement ("Experience: " ++ (toString player.experience))
    , Markdown.toElement ("Hit Points: " ++ (toString player.hitPoints))
    , Markdown.toElement ("Position: x=" ++ (toString player.x) ++ ", y=" ++ (toString player.y))
    , Markdown.toElement ("Velocity: vx=" ++ (toString player.vx) ++ ", vy=" ++ (toString player.vy))
    , Markdown.toElement ("Direction: " ++ player.dir)
    , Markdown.toElement ("Time: " ++ (toString gameState.time))
    ]
