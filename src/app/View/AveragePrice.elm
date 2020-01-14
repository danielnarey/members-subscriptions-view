module View.AveragePrice exposing (averagePrice)


import Dict exposing (Dict)
import Json.Encode exposing (Value)
import Html exposing (Html)

import Utils.Try as Try
import View.Styled exposing (styled)


averagePrice : List (Dict String Value) -> Html msg
averagePrice members =
  let
    totalSubscribers =
      List.length members
    
    totalDollars =
      members
        |> List.map (Try.getValue "subscription_price" >> Try.int 0)
        |> List.sum
    
    averageDollars =
      (toFloat totalDollars) / (toFloat totalSubscribers)
        |> round
    
    subscribersDiv =
      (String.fromInt totalSubscribers) ++ " subscribers"
        |> Html.text
        |> List.singleton
        |> styled Html.div 
          [ "font-semibold"
          , "text-base"
          ]
    
    averageDiv =
      "Average $" ++ (String.fromInt averageDollars)
        |> Html.text
        |> List.singleton
        |> styled Html.div 
          [ "px-1b"
          , "bg-dark-red"
          , "border"
          , "rounded-1b"
          , "text-lighter"
          ]
  
  in
    [ subscribersDiv
    , averageDiv
    ]
      |> styled Html.li 
        [ "flex"
        , "justify-between"
        , "mb-1b"
        , "py-quarter-b"
        , "px-half-b"
        , "leading-sm-narrow"
        ]
