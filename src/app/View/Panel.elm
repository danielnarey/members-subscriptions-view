module View.Panel exposing (panel)


import Html exposing (Html)
import View.Styled exposing (styled)


panel : String -> List (Html msg) -> Html msg
panel bgHue =
  styled Html.div
    [ "column"
    , "half-tablet"
    , "unset-margin"
    , "h-9c"
    , "mb-2b"
    , "overflow-y-scroll"
    , "bg-lighter-" ++ bgHue
    , "border"
    , "border-softer"
    ]
