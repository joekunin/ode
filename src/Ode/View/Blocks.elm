{--
Blocks.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View.Blocks where

import Graphics.Collage (Form)

import Ode.Model.MapModel (..)
import Ode.View.ViewUtil (tile)

block : BlockLabel -> Form
block label =
  case label of
    Brown -> brownBlock
    Dirt -> dirtBlock
    Grass -> grassBlock
    RampSouth -> rampSouth
    Stone -> stoneBlock
    Wall -> wallBlock
    WallTall -> wallBlockTall
    Water -> waterBlock
    Wood -> woodBlock

brownBlock : Form
brownBlock = tile "Brown%20Block"

dirtBlock : Form
dirtBlock = tile "Dirt%20Block"

grassBlock : Form
grassBlock = tile "Grass%20Block"

rampSouth : Form
rampSouth = tile "Ramp%20South"

stoneBlock : Form
stoneBlock = tile "Stone%20Block"

wallBlock : Form
wallBlock = tile "Wall%20Block"

wallBlockTall : Form
wallBlockTall = tile "Wall%20Block%20Tall"

waterBlock : Form
waterBlock = tile "Water%20Block"

woodBlock : Form
woodBlock = tile "Wood%20Block"
