module View.AddHeader exposing (addHeader)


import Html exposing (Html)
import View.Styled exposing (styled)


addHeader : String -> List (Html msg) -> List (Html msg)
addHeader title =
  Html.text title
    |> List.singleton
    |> styled Html.div
      [ "mb-2b"
      , "pb-1b"
      , "border-b-2"
      , "border-softer"
      , "font-extrabold"
      , "text-lg"
      , "leading-lg"
      , "text-center"
      ]
    |> (::)
