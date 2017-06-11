module Components.DialogOne exposing (myDialogOne, contentDialogOne)

import Html exposing (..)
import Material.Options as Options exposing (..)

import Model exposing (..)


dialogSettings : DialogSettings
dialogSettings =
    { viewCs = "dialog-one__view"
    , titleCs = "dialog-one__title"
    , contentCs = "dialog-one__content"
    , actionsCs = "dialog-one__actions"
    }


myDialogOne : ModalDialog
myDialogOne =
    { dialogSettings = dialogSettings
    , dialogTitleText = "Dialog One"
    , dialogBtnText = "Close Dialog 1"
    }


contentDialogOne : Html Msg
contentDialogOne =
    Options.div []
        [ Options.div [ cs "poem" ]
            [ p [] [ text "Tell me not, in mournful numbers," ]
            , p [] [ text "Life is but an empty dream!" ]
            , p [] [ text "For the soul is dead that slumbers," ]
            , p [] [ text "And things are not what they seem." ]
            ]
        , Options.div [ css "margin-top" "25px" ] []
        , Options.div [ cs "poem" ]
            [ p [] [ text "Life is real! Life is earnest!" ]
            , p [] [ text "And the grave is not its goal;" ]
            , p [] [ text "Dust thou art, to dust returnest," ]
            , p [] [ text "Was not spoken of the soul." ]
            ]
        , Options.div [ cs "poem-author" ] [ text "A Psalm of Life by Henry Wadsworth Longfellow"]
        ]
