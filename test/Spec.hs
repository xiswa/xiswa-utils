module Main (main) where

import Test.Hspec

import Xiswa.Utils.Helper

spec :: Spec
spec = do
  describe "camelToSnakeWithPref" $ do
    it "correctly handles prefix" $ do
      camelToSnakeWithPref "somePrefix" "somePrefixThatIsLong" `shouldBe` "that_is_long"

  describe "camelToSnake" $ do
    it "correctly converts to snake case" $ do
      camelToSnake "aCamelCaseName" `shouldBe` "a_camel_case_name"

main :: IO ()
main = hspec spec
