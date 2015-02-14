{--
Characters.elm

Copyright (c) 2015 Willie Wheeler.
--}

module Ode.View.Characters where

import Graphics.Collage (Form, toForm)
import Graphics.Element (image)

character : String -> Form
character s = toForm (image 101 171 ("/resources/planet-cute/" ++ s ++ ".png"))

hornGirl : Form
hornGirl = character "Character%20Horn%20Girl"
