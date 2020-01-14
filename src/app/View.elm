module View exposing (view)


import Html exposing (Html)

import Types exposing (Model, Msg)
import View.Styled exposing (styled)
import View.Panel exposing (panel)
import View.AddHeader exposing (addHeader)
import View.MembersList exposing (membersList)
import View.DetailsList exposing (detailsList)


-- APP ROOT --

view : Model -> Html Msg
view model =
  [ membersList model
    |> styled Html.ul 
      [ "font-barlow-semi"
      , "text-sm"
      ]
    |> List.singleton
    |> addHeader "Subscriptions"
    |> panel "red-orange"
      
  , detailsList model
    |> styled Html.ul 
      [ "font-source-code"
      , "text-xs"
      ]
    |> List.singleton
    |> addHeader "Member Details"
    |> panel "blue-green"

  ]
    |> styled Html.div 
      [ "wrap"
      , "justify-center"
      ]

