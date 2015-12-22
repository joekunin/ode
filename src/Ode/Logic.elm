{-
Logic.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.Logic where

import Time exposing (..)
import Ode.Model.GameModel exposing (GameState, Player)

{-
Part 3: Update the game ---------------------------------------------------

How does the game step from one state to another based on user input?

Task: Redefine `stepGame` to use the UserInput and GameState
      you defined in parts 1 and 2. Maybe use some helper functions
      to break up the work, stepping smaller parts of the game.

------------------------------------------------------------------------------}
areaW : Float
areaW = 800

areaH : Float
areaH = 800

{-| Advances the game forward one step based on the input and current game state.
-}
stepGame : (Time, { x : Int, y : Int }, Bool) -> GameState -> GameState
stepGame (timeDelta, direction, isRunning) gameState =
    let map = gameState.map
        player = gameState.player
    in
      { map = map
      , player =
        player
          |> newVelocity isRunning direction
          |> setDirection direction
          |> updatePosition timeDelta
      -- FIXME Get the actual time, not computed time
      , time = gameState.time + timeDelta
      }

-- Helper function
newVelocity : Bool -> { x : Int, y : Int } -> Player -> Player
newVelocity isRunning {x, y} player =
  let scale = if isRunning then 10 else 5
      newVel n =
        if x == 0 || y == 0
          then scale * toFloat n
          else scale * toFloat n / sqrt 2
  in
    { player |
      vx = newVel x,
      vy = newVel y
    }

-- Helper function
setDirection : { x : Int, y : Int } -> Player -> Player
setDirection { x, y } player =
  { player |
    dir =
      if isPositive x then
        "east"
      else if isNegative x then
        "west"
      else if isPositive y then
        "North"
      else if isNegative y then
        "SouthOC"
      else
        "standing"
  }

-- Helper Function
isPositive : Int -> Bool
isPositive number = number > 0

isNegative : Int -> Bool
isNegative number = number < 0

-- Helper function
updatePosition : Time -> Player -> Player
updatePosition dt player =
  { player |
    x = clamp (-areaW/2) (areaW/2) (player.x + dt * player.vx),
    y = clamp (-areaH/2) (areaH/2) (player.y + dt * player.vy)
  }
