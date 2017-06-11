module Model exposing (..)

import Material


type alias Model =
    { mdl : Material.Model
    , selectedDialog : Int
    }


model : Model
model =
    { mdl = Material.model
    , selectedDialog = 1
    }


type Msg
    = Mdl (Material.Msg Msg)
    | SelectedDialog Int


type alias DialogSettings =
    { viewCs : String
    , titleCs : String
    , contentCs : String
    , actionsCs : String
    }


type alias ModalDialog =
    { dialogSettings : DialogSettings
    , dialogTitleText : String
    , dialogBtnText : String
    }
