{-# LANGUAGE OverloadedStrings #-}

module MetaLogo where

import Control.Applicative hiding (many)
import Control.Monad
import Data.Text (Text)
import qualified Data.Text as T
import Data.Void
import Text.Megaparsec hiding (State)
import Text.Megaparsec.Char

{-
stack based language where
  -}
type Parser = Parsec Void Text

data MetaLogo
  = Caret -- forward 3.14
  | PenDown
  | PenUp
  | QuoteBegin
  | QuoteEnd
  | TurnLeft
  | TurnRight
  | Mult [Multiplicity]
  deriving (Eq, Ord, Show)

-- △ △ = 9

pLogo :: Parser MetaLogo
pLogo =
  Caret <$ string "^"
    <|> PenUp <$ string "○"
    <|> PenDown <$ string "⍉"
    <|> QuoteBegin <$ string "["
    <|> QuoteEnd <$ string "]"
    <|> TurnRight <$ string "⌈"
    <|> TurnLeft <$ string "⌉"

-- <|> Mult <$ (many pMult)

-- what about other primes that aren't here?
data Multiplicity
  = Stroke
  | Triangle
  | Square
  | Pentagon
  | Hexagon
  | Heptagon
  | Octagon
  deriving (Eq, Ord, Show)

mult :: [Multiplicity] -> Integer -> Integer
mult ms = (* (product $ map m ms))

m :: Num p => Multiplicity -> p
m Stroke = 2
m Triangle = 3
m Square = 4
m Pentagon = 5
m Hexagon = 6
m Heptagon = 7
m Octagon = 8

pMult :: Parser Multiplicity
pMult =
  Stroke <$ string "|"
    <|> Triangle <$ string "△"
    <|> Square <$ string "⌷"
    <|> Pentagon <$ string "⬠"
    <|> Hexagon <$ string "⎔"
    <|> Octagon <$ string "⯃"

-- eval :: MetaLogo -> Text
-- eval Caret = "forward 3.14"
-- eval Octagon = (4 *) -- is this gonna work?
-- eval PenDown = "pendown"
-- eval PenUp = "penup"
-- eval Pentagon = _wa
-- eval QuoteBegin = "["
-- eval QuoteEnd = "]"
-- eval Square = _wb
-- eval Triangle = _wk
-- eval TurnLeft = _wh
-- eval TurnRight = _wg

compile :: [MetaLogo] -> Text
compile [Caret] = "forward" <> (showt (2 * pi))

showt = T.pack . show
