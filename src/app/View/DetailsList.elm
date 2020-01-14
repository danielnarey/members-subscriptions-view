module View.DetailsList exposing (detailsList)


import Dict
import Html exposing (Html)

import Types exposing (Model, Msg)
import Utils.Try as Try
import View.Styled exposing (styled)
import View.DetailsItem exposing (detailsItem)


detailsList : Model -> List (Html msg)
detailsList model =
  let
    idMatches int =
      Dict.fromList
        >> Try.getValue "id"
        >> Try.matchesInt int
        
    noneSelectedMsg =
      Html.text "Click on a subscriber for details"
        |> List.singleton
        |> styled Html.li 
          [ "pl-1b"
          , "text-medium-red"
          ]
        
  in
    model.indexedData
      |> List.filter (idMatches model.selected)
      |> List.head 
      |> Maybe.map (List.map detailsItem)
      |> Maybe.withDefault [noneSelectedMsg]
