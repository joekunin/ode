{--
GameModel.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Model.GameModel where

{-- Part 2: Model the game ----------------------------------------------------

What information do you need to represent the entire game?

Tasks: Redefine `GameState` to represent your particular game.
       Redefine `defaultGame` to represent your initial game state.

For example, if you want to represent many objects that just have a position,
your GameState might just be a list of coordinates and your default game might
be an empty list (no objects at the start):

    type GameState = { objects : [ (Float, Float) ] }
    defaultGame = { objects = [] }

------------------------------------------------------------------------------}

--data Command = NORTH | SOUTH | EAST | WEST

{-| Type alias representing the overall game state type.
-}
type alias GameState =
  { player : Player
  , timeDelta : Float
  }

{-| Type alias representing the player.
-}
type alias Player =
  { x : Float
  , y : Float
  , gold : Int
  , hitPoints : Int
  , experience : Int
  }

defaultGame : GameState
defaultGame =
  { player = player
  , timeDelta = 0.0
  }

player : Player
player =
  { x = -44
  , y = 230
  , gold = 0
  , hitPoints = 15
  , experience = 0
  }
