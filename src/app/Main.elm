module Main exposing (main)


import Json.Encode exposing (Value)
import Browser

import Types exposing (Model, Msg)
import Init
import View
import Update


main : Program Value Model Msg
main =
  { init = Init.init
  , view = View.view
  , update = Update.update
  , subscriptions = \_ -> Sub.none
  }
    |> Browser.element
