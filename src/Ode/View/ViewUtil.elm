{-
ViewUtil.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.View.ViewUtil where

import Graphics.Collage exposing (Form, toForm)
import Graphics.Element exposing (image)

tile : String -> Form
tile s = toForm (image 101 171 ("/resources/planet-cute/" ++ s ++ ".png"))
