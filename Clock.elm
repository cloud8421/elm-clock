import Html exposing (div, button, text, h1)
import Html.Events exposing (onClick)
import Time exposing (every, second)
import Date exposing (fromTime)
import Date.Op exposing (format)

model =
  { currentTime = 0 }

clockSignal =
  every second
        
formatTime d =
  format "H:m:s" d
         
toHumanReadableTime t =
  t |> fromTime |> formatTime
    
view model =
  div []
    [ h1 [] [(model.currentTime |> toHumanReadableTime |> text)]]

update newTime =
  { model | currentTime <- newTime }
  |> view

main =
  Signal.map update clockSignal
