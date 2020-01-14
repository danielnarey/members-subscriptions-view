module Init exposing (init)


import Dict
import Json.Encode exposing (Value)

import Types exposing (Model)
import Utils.Try as Try


init : Value -> (Model, Cmd msg)
init jsArray =
  let
    indexedData =
      jsArray 
        |> Try.list 
        |> List.map Try.keyValueList
        
    keyedData =
      indexedData
        |> List.map Dict.fromList
        |> List.sortBy (Try.getValue "subscription_price" >> Try.int -1)
        |> List.reverse
  
  in 
    { indexedData = indexedData
    , keyedData = keyedData 
    , filterBy = ""
    , selected = -1
    }
      |> \model -> (model, Cmd.none)
