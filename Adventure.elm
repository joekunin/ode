import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Keyboard
import Markdown
import Signal
import Time (..)
import Window

{-- Part 1: Model the user input ---------------------------------------------}

{-- Part 2: Model the game ---------------------------------------------------}

areaW = 407
areaH = 301

-- x, y are position
-- vx, vy are velocity
type alias Model =
  { x:Float, y:Float, vx:Float, vy:Float, dir:String }

hero : Model
hero =
  { x=0, y=0, vx=0, vy=0, dir="south" }

{-- Part 3: Update the game --------------------------------------------------}

-- (Time, { x:Int, y:Int }, Bool) is the user input
-- Model #1 is the current game state
-- Model #2 is the updated game state
update : (Time, { x:Int, y:Int }, Bool) -> Model -> Model
update (timeDelta, direction, isRunning) model =
  model
    |> newVelocity isRunning direction
    |> setDirection direction
    |> updatePosition timeDelta

-- Helper function
newVelocity : Bool -> { x:Int, y:Int } -> Model -> Model
newVelocity isRunning {x, y} model =
  let scale = if isRunning then 2 else 1
      newVel n =
        if x == 0 || y == 0
          then scale * toFloat n
          else scale * toFloat n / sqrt 2
  in
    { model |
      vx <- newVel x,
      vy <- newVel y
    }

-- Helper function
setDirection : { x:Int, y:Int } -> Model -> Model
setDirection { x, y } model =
  { model |
    dir <-
      if  | x > 0 -> "east"
          | x < 0 -> "west"
          | y < 0 -> "south"
          | y > 0 -> "north"
          | otherwise -> model.dir
  }

-- Helper function
updatePosition : Time -> Model -> Model
updatePosition dt ({ x, y, vx, vy } as model) =
  { model |
    x <- clamp (-areaW/2) (areaW/2) (x + dt * vx),
    y <- clamp (-areaH/2) (areaH/2) (y + dt * vy)
  }

{-- Part 4: Display the game -------------------------------------------------}

view : (Int, Int) -> Model -> Element
view (w, h) { x, y, vx, vy, dir } =
  let verb = if vx == 0 && vy == 0 then "stand" else "walk"
      src = "resources/images/hero/" ++ verb ++ "/" ++ dir ++ ".gif"
  in
      container w h middle <|
      collage areaW areaH
        [ toForm (image areaW areaH "/resources/images/desert.png"),
          toForm (image 22 28 src)
            |> move (x, y),
          toForm (Markdown.toElement "Arrows to move<br>Shift to run")
            |> move (70 - areaW / 2, 30 - areaH / 2)
        ]

{-- Part 5: Signals ----------------------------------------------------------}

main : Signal Element
main = Signal.map2 view Window.dimensions (Signal.foldp update hero input)

input : Signal (Time, { x:Int, y:Int }, Bool)
input =
  Signal.sampleOn delta (Signal.map3 (,,) delta Keyboard.arrows Keyboard.shift)

delta : Signal Time
delta = Signal.map (\t -> t / 20) (fps 25)









