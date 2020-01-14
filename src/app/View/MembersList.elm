module View.MembersList exposing (membersList)


import Html exposing (Html)

import Types exposing (Model, Msg)
import Utils.Try as Try
import View.Styled exposing (styled)
import View.MembersItem exposing (membersItem)
import View.AveragePrice exposing (averagePrice)


membersList : Model -> List (Html Msg)
membersList model =
  let
    nameContains substr =
      Try.getValue "name"
        >> Try.containsString (substr, True)

  in
    model.keyedData
      |> List.filter (nameContains model.filterBy)
      |> List.map (membersItem model.selected)
      |> (::) (averagePrice model.keyedData)
