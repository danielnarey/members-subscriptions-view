module Utils.Try exposing
  ( list
  , keyValueList
  , string
  , int
  , getValue
  , getString
  , containsString
  , matchesInt
  )


import Json.Encode as Encode exposing (Value)
import Json.Decode as Decode exposing (Decoder)
import Dict exposing (Dict)
import Regex


-- INTERNAL --

try : (Decoder a, a) -> Value -> a 
try (decoder, default) =
  Decode.decodeValue decoder
    >> Result.withDefault default


stringDecoders : List (Decoder String)
stringDecoders =
  [ Decode.string
  , Decode.int 
    |> Decode.map String.fromInt
  , Decode.float 
    |> Decode.map String.fromFloat
  , Decode.bool 
    |> Decode.map (\bool -> if bool then "true" else "false")
  ]


-- EXPOSED --

list : Value -> List Value
list =
  try (Decode.list Decode.value, [])


keyValueList : Value -> List (String, Value)
keyValueList =
  try (Decode.keyValuePairs Decode.value, [])


string : Value -> String
string =
  try (Decode.oneOf stringDecoders, "undefined")


int : Int -> Value -> Int
int default =
  try (Decode.int, default)


getValue : String -> Dict String Value -> Value
getValue key =
  Dict.get key
    >> Maybe.withDefault Encode.null


getString : String -> Dict String Value -> String
getString key =
  Dict.get key
    >> Maybe.map string
    >> Maybe.withDefault "undefined"


containsString : (String, Bool) -> Value -> Bool
containsString (substring, ignoreCase) =
  let
    options =
      { caseInsensitive = ignoreCase
      , multiline = False
      }
      
    contains =
      Regex.fromStringWith options
        >> Maybe.withDefault Regex.never
        >> Regex.contains
      
  in
    Decode.decodeValue (Decode.oneOf stringDecoders)
      >> Result.toMaybe
      >> Maybe.map (contains ("(" ++ substring ++ ")"))
      >> Maybe.withDefault False


matchesInt : Int -> Value -> Bool
matchesInt n =
  Decode.decodeValue (Decode.int)
    >> Result.toMaybe
    >> Maybe.map ((==) n)
    >> Maybe.withDefault False
  