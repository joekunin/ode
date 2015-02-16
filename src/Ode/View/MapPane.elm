{-
MapPane.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.MapPane where

import Graphics.Collage (..)
import Graphics.Element (..)
import List

import Ode.Model.GameModel (GameState)
import Ode.View.Blocks (..)
import Ode.View.Characters (..)

{-| Render the map pane.
    See http://docs.racket-lang.org/teachpack/2htdpPlanet_Cute_Images.html for info on composing the xyTiles.

    (w, h) : window dimensions
    gameState : current game state
-}
mapPane : (Int, Int) -> GameState -> Element
mapPane (w, h) gameState =
  let t = gameState.time
  in
    collage 800 800
      -- FIXME Hardcoded for the moment
      ( (row t 0 [ Grass, Grass, Grass, Grass, Grass, Grass, Grass ]) ++
        (row t 1 [ Grass, Grass, Grass, Grass, Grass, Grass, Grass ]) ++
        (row t 2 [ Dirt,  Dirt,  Dirt,  Dirt,  Dirt,  Dirt,  Grass ]) ++
        (row t 3 [ Water, Water, Water, Water, Water, Dirt,  Dirt  ]) ++
        (row t 4 [ Water, Water, Water, Water, Water, Water, Dirt  ]) ++
        (row t 5 [ Water, Water, Water, Water, Water, Water, Dirt  ]) ++

        -- TODO Render in the correct layer.
        [ move (-202, 382) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
        , move (101, 301 + offset2(gameState.time)) (toForm (image 101 171 "/resources/planet-cute/Key.png"))
        , move (303, 302) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
        , move (gameState.player.x, gameState.player.y) hornGirl
        , move (gameState.player.x + 70, gameState.player.y + 60) (toForm (image 101 171 "/resources/planet-cute/SpeechBubble.png"))
        ])

row : Float -> Int -> List BlockLabel -> List Form
row t i labels =
    List.map (\ (j, label) -> ijTile t (i, j) label) (List.indexedMap (,) labels)

ijTile : Float -> (Int, Int) -> BlockLabel -> Form
ijTile t (i, j) label =
    let x = toFloat(101 * (j - 3))
        y = toFloat(-81 * i + 342)
        offset =
          if | label == Water && i % 2 == 0 -> offset0 t
             | label == Water && i % 2 == 1 -> offset1 t
             | otherwise -> 0
    in
      xyTile (x, y + offset) label

xyTile : (Float, Float) -> BlockLabel -> Form
xyTile (x, y) label = move (x, y) (block label)

offset0 : Float -> Float
offset0 t = 5 * sin(t / 30.0)

offset1 : Float -> Float
offset1 t = 5 * cos(t / 30.0)

offset2 : Float -> Float
offset2 t = 5 * cos(t / 10.0)
