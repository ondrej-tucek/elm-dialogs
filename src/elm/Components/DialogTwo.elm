module Components.DialogTwo exposing (myDialogTwo, contentDialogTwo)

import Html exposing (..)
import Material.Options as Options exposing (..)

import Model exposing (..)


dialogSettings : DialogSettings
dialogSettings =
    { viewCs = "dialog-two__view"
    , titleCs = "dialog-two__title"
    , contentCs = "dialog-two__content"
    , actionsCs = "dialog-two__actions"
    }


myDialogTwo : ModalDialog
myDialogTwo =
    { dialogSettings = dialogSettings
    , dialogTitleText = "Dialog Two"
    , dialogBtnText = "Close Dialog 2"
    }


contentDialogTwo : Html Msg
contentDialogTwo =
    Options.div []
        [ Options.div [ cs "poem" ]
            [ p [] [ text "To see a world in a grain of sand," ]
            , p [] [ text "and a heaven in a wild flower," ]
            , p [] [ text "to hold infinity in the palm of your hand," ]
            , p [] [ text "and Eternity in an hour." ]
            ]
        , Options.div [ cs "poem-author" ] [ text "Auguries of Innocence by William Blake"]
        ]
