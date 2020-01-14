module Update exposing (update)


import Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Select id ->
      ( { model | selected = id }
      , Cmd.none 
      )
