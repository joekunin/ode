{-
MapPane.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.MapPane where

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import List

import Ode.Model.GameModel exposing (GameState)
import Ode.Model.MapModel exposing (..)
import Ode.View.Blocks exposing (..)
import Ode.View.Characters exposing (..)

{-| Render the map pane.
    See http://docs.racket-lang.org/teachpack/2htdpPlanet_Cute_Images.html for info on composing the xyTiles.

    (w, h) : window dimensions
    gameState : current game state
-}
mapPane : (Int, Int) -> GameState -> Element
mapPane (w, h) gameState =
  collage 800 800
    ( mapTiles gameState ++

      -- TODO Render in the correct layer.
      [ move (-202, 382) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
      , move (303, 221) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
      , move (-202, 301 + yOffset2(gameState.time)) (toForm (image 101 171 "/resources/planet-cute/Key.png"))
      , move (gameState.player.x, gameState.player.y) hornGirl
      , move (gameState.player.x + 70, gameState.player.y + 60) (toForm (image 101 171 "/resources/planet-cute/SpeechBubble.png"))
      ]
    )

mapTiles : GameState -> List Form
mapTiles gameState =
  let t = gameState.time
      gameMap = gameState.map
  in
    List.concat (List.map (\ (i, row) -> rowTiles t i row) (List.indexedMap (,) gameMap))

rowTiles : Float -> Int -> List BlockLabel -> List Form
rowTiles t i labels =
    List.map (\ (j, label) -> cellTile t (i, j) label) (List.indexedMap (,) labels)

cellTile : Float -> (Int, Int) -> BlockLabel -> Form
cellTile t (i, j) label =
    let x = toFloat(101 * (j - 3))
        y = toFloat(-81 * i + 342)
        yOffset =
          if label == Water && i % 2 == 0 then
            yOffset0 t
          else if label == Water && i % 2 == 1 then
            yOffset1 t
          else if label == Wall then
            20
          else
            0
    in
      xyTile (x, y + yOffset) label

xyTile : (Float, Float) -> BlockLabel -> Form
xyTile (x, y) label = move (x, y) (block label)

yOffset0 : Float -> Float
yOffset0 t = 5 * sin(t / 30.0)

yOffset1 : Float -> Float
yOffset1 t = 5 * cos(t / 30.0)

yOffset2 : Float -> Float
yOffset2 t = 5 * cos(t / 10.0)
