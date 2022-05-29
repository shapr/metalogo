module MetaLogo where

hi :: IO ()
hi = print "hi"

{-
stack based language where
  -}
data MetaLogo
  = Pentagon
  | Square
  | Caret
  | PenUp
  | PenDown
  | Octagon
  | TurnRight
  | TurnLeft
  | Quote
  | UnQuote
  | Triangle

eval :: MetaLogo -> Text

eval
