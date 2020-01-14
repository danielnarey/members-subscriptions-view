module View.MembersItem exposing (membersItem)


import Dict exposing (Dict)
import Json.Encode exposing (Value)
import Html exposing (Html)
import Html.Events as Events

import Types exposing (Msg(..))
import Utils.Try as Try
import View.Styled exposing (styled, styledWithAttrs)


membersItem : Int -> Dict String Value-> Html Msg
membersItem selected member =
  let
    memberId =
      member
        |> Try.getValue "id"
        |> Try.int -1

    isSelected =
      member
        |> Try.getValue "id"
        |> Try.matchesInt selected
        
    tagColor =
      case (member |> Try.getString "subscription_name") of
        "Platinum" -> "bg-light-blue-green"
        "Gold" -> "bg-light-yellow-orange"
        "Silver" -> "bg-light"
        _ -> "bg-transparent"

    nameDiv = 
      member 
        |> Try.getString "name"
        |> Html.text
        |> List.singleton
        |> styled Html.div
          [ "font-semibold"
          , "hover_underline"
          ]
        
    subscriptionDiv =
      [ member |> Try.getString "subscription_name"
      , " $"
      , member |> Try.getString "subscription_price"
      ]
        |> String.concat
        |> Html.text
        |> List.singleton
        |> styled Html.div 
          [ "px-1b"
          , "border"
          , "border-medium"
          , "rounded-1b"
          , tagColor
          ]
  
  in 
    [ nameDiv
    , subscriptionDiv
    ]
      |> styledWithAttrs Html.button
        [ Events.onClick (Select memberId) ]
        [ "w-full"
        , "flex"
        , "justify-between"
        , "mb-quarter-b"
        , "py-quarter-b"
        , "px-half-b"
        , "rounded"
        , "leading-sm-narrow"
        , if isSelected
          then "bg-medium-light-red-orange"
          else "bg-transparent"
        ]
      |> List.singleton
      |> Html.li []
