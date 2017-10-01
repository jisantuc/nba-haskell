module PlayerGameLogParams where

import qualified Data.Text as T

import Control.Lens
import Network.Wreq (Options, defaults, param)

import ParameterTypes

data PlayerGameLogParams = PlayerGameLogParams {
  playerID :: Integer,
  season :: Season,
  seasonType :: SeasonType
  }

instance Optionable PlayerGameLogParams where
  toOptions pglp = defaults
    & param "playerID" .~ [T.pack $ show (playerID pglp)]
    & param "season" .~ [toText (season pglp)]
    & param "seasonType" .~ [toText (seasonType pglp)]
