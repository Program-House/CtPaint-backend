module Register.Button exposing (view)

import Html exposing (Html)
import Register.Model exposing (Problem(..))
import Register.Message exposing (RegisterMsg(..))
import Main.Message exposing (Msg(..))
import Main.Components exposing (button)


view : List Problem -> Html Msg
view problems =
    button "Register" (no problems) (RegisterWrapper Register)


no : List Problem -> Bool
no =
    List.isEmpty