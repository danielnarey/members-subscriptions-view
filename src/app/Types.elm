module Types exposing (KeyValueList, Model, Msg(..))


import Dict exposing (Dict)
import Json.Encode exposing (Value)


type alias KeyValueList =
  List (String, Value)


type alias Model =
  { indexedData : List KeyValueList
  , keyedData : List (Dict String Value)
  , filterBy : String
  , selected : Int
  }


type Msg
  = Select Int
