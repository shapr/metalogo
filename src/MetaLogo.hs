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

data Control = PenDown | PenUp | QuoteBegin | QuoteEnd deriving (Eq, Ord, Show)

data MetaLogo
  = Caret Int -- forward 1 -> 'forward 6.28'
  | Meta Control
  | TurnLeft Int -- 1 is turn left, -1 is turn right
  | Multiplicity Integer
  | Reciprocal
  deriving (Eq, Ord, Show)

-- lexer
pLogo :: Parser MetaLogo
pLogo =
  Caret 1 <$ string "^"
    <|> Meta PenUp <$ string "○"
    <|> Meta PenDown <$ string "⍉"
    <|> Meta QuoteBegin <$ string "["
    <|> Meta QuoteEnd <$ string "]"
    <|> TurnLeft (-1) <$ string "⌈"
    <|> TurnLeft 1 <$ string "⌉"
    <|> Multiplicity <$> pMult

pMult :: Parser Integer
pMult =
  2 <$ string "|"
    <|> 3 <$ string "△"
    <|> 4 <$ string "⌷"
    <|> 5 <$ string "⬠"
    <|> 6 <$ string "⎔"
    <|> 8 <$ string "⯃"

-- simplify :: [MetaLogo] -> [MetaLogo]
-- simplify [

{- convert metalogo to actual logo -}

-- eval :: MetaLogo -> ActualLogo
-- eval (Caret i) = Forward (fromIntegral i)
-- eval (Meta c) = Actual c

-- eval TurnLeft dir = _

-- data ActualLogo
--   = Forward Float -- "|^" -> fmap (*2) Forward 6.28
--   | Actual Control

-- compile :: [ActualLogo] -> Text
-- compile [Caret] = "forward " <> (showt (2 * pi))

-- showt = T.pack . show
