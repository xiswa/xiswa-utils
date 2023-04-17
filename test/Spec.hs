module Main (main) where

import Test.Hspec
import Xiswa.Utils

spec :: Spec
spec = do
  describe "camelToSnakeCase" $ do
    it "correctly handles prefixes" $ do
      camelToSnakeCase "somePrefix" "somePrefixThatIsLong" `shouldBe` "that_is_long"
      camelToSnakeCase ""           "aCamelCaseName"       `shouldBe` "a_camel_case_name"

main :: IO ()
main = hspec spec
