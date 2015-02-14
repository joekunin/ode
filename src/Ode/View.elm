{--
View.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View where

import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import List
import Markdown
import Text
import Window

import Ode.GameModel (Player, GameState, defaultGame)
import Ode.Tiles.Blocks (..)
import Ode.Tiles.Characters (..)

{-- Part 4: Display the game --------------------------------------------------

How should the GameState be displayed to the user?

Task: Redefine `display` to use the GameState you defined in part 2.

------------------------------------------------------------------------------}

player = defaultGame.player

-- FIXME Temporarily just hardcoding these bad boys
mapDisplay : Element
mapDisplay =
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

    , move (player.x, player.y) hornGirl
    , move (player.x + 70, player.y + 60) (toForm (image 101 171 "/resources/planet-cute/SpeechBubble.png"))
    ]

playerPanel : Element
playerPanel =
  flow down
  [ Markdown.toElement "# Adventurer"
  , Markdown.toElement ("Gold: " ++ (toString player.gold))
  , Markdown.toElement ("Experience: " ++ (toString player.experience))
  , Markdown.toElement ("Hit Points: " ++ (toString player.hitPoints))
  ]

display : (Int, Int) -> GameState -> Element
display (w, h) gameState =
  flow right
  [ mapDisplay
  , playerPanel
  ]
