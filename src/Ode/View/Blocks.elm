{--
Blocks.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View.Blocks where

import Graphics.Collage (Form)

import Ode.View.ViewUtil (tile)

dirtBlock : Form
dirtBlock = tile "Dirt%20Block"

grassBlock : Form
grassBlock = tile "Grass%20Block"

stoneBlock : Form
stoneBlock = tile "Stone%20Block"

waterBlock : Form
waterBlock = tile "Water%20Block"
