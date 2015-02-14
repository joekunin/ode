{--
Blocks.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View.Blocks where

import Graphics.Collage (Form, toForm)
import Graphics.Element (image)

block : String -> Form
block s = toForm (image 101 171 ("/resources/planet-cute/" ++ s ++ ".png"))

dirtBlock : Form
dirtBlock = block "Dirt%20Block"

grassBlock : Form
grassBlock = block "Grass%20Block"

stoneBlock : Form
stoneBlock = block "Stone%20Block"

waterBlock : Form
waterBlock = block "Water%20Block"
