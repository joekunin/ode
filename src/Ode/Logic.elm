{--
Logic.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.Logic where

import Time (..)

import Ode.Model.InputModel (Input)
import Ode.Model.GameModel (GameState, Player)

{-- Part 3: Update the game ---------------------------------------------------

How does the game step from one state to another based on user input?

Task: Redefine `stepGame` to use the UserInput and GameState
      you defined in parts 1 and 2. Maybe use some helper functions
      to break up the work, stepping smaller parts of the game.

------------------------------------------------------------------------------}

areaW = 800
areaH = 800

{-| Advances the game forward one step based on the input and current game state.
-}
stepGame : (Time, { x : Int, y : Int }, Bool) -> GameState -> GameState
stepGame (timeDelta, direction, isRunning) gameState =
    let player = gameState.player
    in
      { player =
        player
          |> newVelocity isRunning direction
          |> setDirection direction
          |> updatePosition timeDelta
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
      vx <- newVel x,
      vy <- newVel y
    }

-- Helper function
setDirection : { x : Int, y : Int } -> Player -> Player
setDirection { x, y } player =
  { player |
    dir <-
      if  | x > 0 -> "east"
          | x < 0 -> "west"
          | y < 0 -> "south"
          | y > 0 -> "north"
          | otherwise -> player.dir
  }

-- Helper function
updatePosition : Time -> Player -> Player
updatePosition dt player =
  { player |
    x <- clamp (-areaW/2) (areaW/2) (player.x + dt * player.vx),
    y <- clamp (-areaH/2) (areaH/2) (player.y + dt * player.vy)
  }

