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

import Time (..)

import Ode.Model.MapModel (..)

{-| Type alias representing the overall game state type.
-}
type alias GameState =
  { map : List (List BlockLabel)
  , player : Player
  , time : Time
  }

{-| Type alias representing the player.
    x : position x-coord
    y : position y-coord
    vx : x velocity
    vy : y velocity
    dir : direction ("north", "south", "east" or "west")
    gold : gold pieces
    hitPoints : hit points
    experience : experience points
-}
type alias Player =
  { x : Float
  , y : Float
  , vx : Float
  , vy : Float
  , dir : String
  , gold : Int
  , hitPoints : Int
  , experience : Int
  }

{-| Initial game state.
-}
initGameState : GameState
initGameState =
  { map = initMap
  , player = initPlayerState
  , time = 0
  }

{-| Initial player state.
-}
initPlayerState : Player
initPlayerState =
  { x = -44
  , y = 230
  , vx = 0
  , vy = 0
  , dir = "south"
  , gold = 0
  , hitPoints = 15
  , experience = 0
  }
