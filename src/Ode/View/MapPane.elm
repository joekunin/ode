{-
MapPane.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.MapPane where

import Graphics.Collage (..)
import Graphics.Element (..)

import Ode.Model.GameModel (GameState)
import Ode.View.Blocks (..)
import Ode.View.Characters (..)

{-| Render the map pane.

    See http://docs.racket-lang.org/teachpack/2htdpPlanet_Cute_Images.html for info on composing the tiles.
-}
mapPane : (Int, Int) -> GameState -> Element
mapPane (w, h) gameState =
  -- FIXME Temporarily just hardcoding these bad boys
  collage 800 800
    [ move (-303, 342) grassBlock
    , move (-202, 342) grassBlock
    , move (-202, 382) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
    , move (-101, 342) grassBlock
    , move (0, 342) grassBlock
    , move (101, 342) grassBlock
    , move (202, 342) grassBlock
    , move (303, 342) grassBlock
    
    , move (-303, 261) grassBlock
    , move (-202, 261) grassBlock
    , move (-101, 261) grassBlock
    , move (0, 261) grassBlock
    , move (101, 261) grassBlock
    , move (101, 301) (toForm (image 101 171 "/resources/planet-cute/Key.png"))
    , move (202, 261) grassBlock
    , move (303, 261) grassBlock
    , move (303, 302) (toForm (image 101 171 "/resources/planet-cute/Tree%20Tall.png"))
    
    , move (-303, 180) dirtBlock
    , move (-202, 180) dirtBlock
    , move (-101, 180) dirtBlock
    , move (0, 180) dirtBlock
    , move (101, 180) dirtBlock
    , move (202, 180) dirtBlock
    , move (303, 180) grassBlock

    , move (-303, 99) waterBlock
    , move (-202, 99) waterBlock
    , move (-101, 99) waterBlock
    , move (0, 99) waterBlock
    , move (101, 99) waterBlock
    , move (202, 99) dirtBlock
    , move (303, 99) dirtBlock

    , move (-303, 18) waterBlock
    , move (-202, 18) waterBlock
    , move (-101, 18) waterBlock
    , move (0, 18) waterBlock
    , move (101, 18) waterBlock
    , move (202, 18) waterBlock
    , move (303, 18) dirtBlock

    , move (-303, -63) waterBlock
    , move (-202, -63) waterBlock
    , move (-101, -63) waterBlock
    , move (0, -63) waterBlock
    , move (101, -63) waterBlock
    , move (202, -63) waterBlock
    , move (303, -63) dirtBlock

    -- TODO Render in the correct layer.
    , move (gameState.player.x, gameState.player.y) hornGirl
    , move (gameState.player.x + 70, gameState.player.y + 60) (toForm (image 101 171 "/resources/planet-cute/SpeechBubble.png"))
    ]
