module Main exposing (..)

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Html.App


-- MODEL


type alias Model =
    String


initModel : ( Model, Cmd Msg )
initModel =
    ( "Hello World", Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



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
