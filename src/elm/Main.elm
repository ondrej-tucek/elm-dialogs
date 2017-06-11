module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Material
import Material.Color as Color
import Material.Button as Button
import Material.Dialog as Dialog
import Material.Elevation as Elevation
import Material.Options as Options exposing (..)

import Model exposing (..)
import Components.DialogOne exposing (myDialogOne, contentDialogOne)
import Components.DialogTwo exposing (myDialogTwo, contentDialogTwo)


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            Material.update Mdl msg_ model

        SelectedDialog num ->
            { model | selectedDialog = num } ! []


-- VIEW

view : Model -> Html Msg
view model =
    let
        dialogView =
            case model.selectedDialog of
                1 -> dialog model myDialogOne
                2 -> dialog model myDialogTwo
                _ -> Options.div [] [text "Something wrong happened."]
    in
        Options.div
            [ css "margin-top" "30px"
            , css "text-align" "center"
            , cs "container"
            ]
            [ dialogView
            , Options.div [ cs "row" ]
                [ Options.div [ cs "col-xs-12" ]
                    [ Options.div [ cs "jumbotron" ]
                        [ Options.img [] [ src "static/img/elm.jpg" ]
                        , p [] [ text "Elm Webpack Starter" ]
                        ]
                    ]
                ]
            , Options.div []
                [ Button.render Mdl [1] model.mdl
                    [ Elevation.e6
                    , Options.onClick (SelectedDialog 1)
                    , Dialog.openOn "click"
                    ]
                    [ text "Open dialog 1" ]
                , Options.span [ css "margin" "20px" ] []
                , Button.render Mdl [2] model.mdl
                    [ Elevation.e6
                    , Options.onClick (SelectedDialog 2)
                    , Dialog.openOn "click"
                    ]
                    [ text "Open dialog 2" ]
                ]
            ]


dialog : Model -> ModalDialog -> Html Msg
dialog model modal =
    let
        contentDialog =
            case model.selectedDialog of
                1 -> contentDialogOne
                2 -> contentDialogTwo
                _ -> Options.div [] [text "Something wrong happened."]
    in
        Dialog.view
            [ cs modal.dialogSettings.viewCs ]
            [ Dialog.title [ cs modal.dialogSettings.titleCs ]
                [ text modal.dialogTitleText ]
            , Dialog.content [ cs modal.dialogSettings.contentCs ]
                [ contentDialog ]
            , Dialog.actions [ cs modal.dialogSettings.actionsCs ]
                [ Button.render Mdl [0] model.mdl
                    [ Elevation.e6
                    , Color.background (Color.color Color.Indigo Color.S400)
                    , Color.text (Color.white)
                    , Dialog.closeOn "click" ]
                    [ text modal.dialogBtnText ]
                ]
            ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
