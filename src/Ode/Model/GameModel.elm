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

type alias Player =
  { x : Float
  , y : Float
  , gold : Int
  , hitPoints : Int
  , experience : Int
  }

type alias GameState = {
    player : Player
  }

defaultGame : GameState
defaultGame =
  { player =
    { x = -44
    , y = 230
    , gold = 0
    , hitPoints = 15
    , experience = 0
    }
  }
