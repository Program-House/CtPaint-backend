module Main.Init exposing (model, cmd)

import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Main.Message exposing (Msg(..))
import User.Model as User
import Api.PublicKey as PublicKey
import Ports


model : Model
model =
    { page = UsersPage User.init
    , usernameField = ""
    , passwordField = ""
    , loggedIn = False
    }


cmd : Cmd Msg
cmd =
    Cmd.batch
        [ PublicKey.get
        , Ports.requestSessionToken ()
        , Ports.requestPublicKey ()
        ]
