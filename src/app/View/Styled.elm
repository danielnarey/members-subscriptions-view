module View.Styled exposing 
  ( styled
  , styledWithAttrs
  )


import Html exposing (Html, Attribute)
import Html.Attributes as Attrs


type alias HtmlElement msg =
  List (Attribute msg) -> List (Html msg) -> Html msg


-- INTERNAL --

concat : List String -> Attribute msg
concat =
  String.join " "
    >> Attrs.class


-- EXPOSED --

styled : HtmlElement msg -> List String -> List (Html msg) -> Html msg
styled elem classList =
  elem [concat classList]


styledWithAttrs : HtmlElement msg -> List (Attribute msg) -> List String -> List (Html msg) -> Html msg
styledWithAttrs elem attrs classList =
  elem ((concat classList) :: attrs)
