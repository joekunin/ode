{--
Blocks.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Blocks where

import Graphics.Collage (..)
import Graphics.Element (..)

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
