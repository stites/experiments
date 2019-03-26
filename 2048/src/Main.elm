module Main exposing (..)

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Html.App


-- MODEL


type alias Model = {...}


-- initModel : ( Model, Cmd Msg )
-- initModel =
--     ( "Hello World", Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | Reset
    | ...



-- VIEW


view : Model -> Html Msg
view model =
  ...
    -- div []
    --     [ text model ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> ...
        Reset -> ...



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never
main =
    Html.App.program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
