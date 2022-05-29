{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import MetaLogo
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec

main :: IO ()
main = do
  hspec metalogoParseSpec

-- hspec compileSpec

metalogoParseSpec :: Spec
metalogoParseSpec = do
  describe "parsing" $
    it "works" $
      (parse pLogo "" "|" `shouldParse` Multiplicity 2)

-- compileSpec ::
--   Spec
-- compileSpec = do
--   describe "compile" $
--     it "works" $
--       compile [Caret] `shouldBe` "forward 6.28"
