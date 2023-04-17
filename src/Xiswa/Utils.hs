{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE TypeApplications      #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE LambdaCase            #-}
module Xiswa.Utils (
    Has(..)
  , grab
  , camelToSnakeCase
  ) where

import Control.Monad.Reader
import Data.Char (isUpper, toLower)

class Has field env where
  obtain :: env -> field

grab :: forall field env m . (MonadReader env m, Has field env) => m field
grab = asks $ obtain @field
{-# INLINE grab #-}

camelToSnakeCase :: String -> String -> String
camelToSnakeCase = 
  let toSnakeCase' =
        foldr (\c z -> if isUpper c then '_':toLower c:z else c:z) []
   in \case
        []   -> toSnakeCase'
        pref -> tail . toSnakeCase' . drop (length pref)
