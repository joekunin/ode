{-
ViewUtil.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.ViewUtil where

import Graphics.Collage (Form, toForm)
import Graphics.Element (image)

tile : String -> Form
tile s = toForm (image 101 171 ("/resources/planet-cute/" ++ s ++ ".png"))
