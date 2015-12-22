{-
MapModel.elm

Copyright (c) 2015 Willie Wheeler.
-}

module Ode.Model.MapModel where

type BlockLabel = Brown | Dirt | Grass | RampSouth | Stone | Wall | WallTall | Water | Wood

{-| Initial map state.
-}
initMap : List (List BlockLabel)
initMap =
  [ [ Grass, Grass, Grass, Stone, WallTall, Wood, Wood ]
  , [ Grass, Grass, Grass, Stone, WallTall, WallTall, WallTall ]
  , [ Grass, Grass, Grass, Stone, Grass, Grass, Grass ]
  , [ Dirt,  Dirt,  Dirt,  Dirt,  Dirt,  Dirt,  Grass ]
  , [ Water, Water, Water, Water, Water, Dirt,  Dirt  ]
  , [ Water, Water, Water, Water, Water, Water, Dirt  ]
  , [ Water, Water, Water, Water, Water, Water, Dirt  ]
  , [ Water, Water, Water, Water, Water, Water, Water ]
  ]
