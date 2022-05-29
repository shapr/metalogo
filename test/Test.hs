{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import MetaLogo
import Test.Hspec
import Test.Hspec.Megaparsec
import Text.Megaparsec

main :: IO ()
main = do
  hspec multiplicitySpec
  hspec compileSpec

multiplicitySpec :: Spec
multiplicitySpec = do
  describe "multiplicity" $
    it "works" $
      parse pMult "" "|" `shouldParse` Stroke

compileSpec ::
  Spec
compileSpec = do
  describe "compile" $
    it "works" $
      compile [Forward] `shouldBe` "forward (2* pi)"
