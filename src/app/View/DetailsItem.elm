module View.DetailsItem exposing (detailsItem)


import Json.Encode exposing (Value)
import Html exposing (Html)

import Utils.Try as Try
import View.Styled exposing (styled)


detailsItem : (String, Value) -> Html msg
detailsItem (k, v) =
  Html.text (k ++ ": " ++ Try.string v)
    |> List.singleton
    |> styled Html.li ["pl-1b"]
