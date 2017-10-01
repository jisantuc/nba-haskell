module ShootingSplitsQueryParameters where

import qualified Data.Text as T

import Control.Lens
import Network.Wreq (defaults, param)

import ParameterTypes

data ShootingSplitsParams = ShootingSplitsParams {
  measureType :: MeasureType,
  perMode :: PerMode,
  plusMinus :: YesNoBool,
  paceAdjust :: YesNoBool,
  rank :: YesNoBool,
  season :: Season,
  seasonType :: SeasonType,
  playerID :: Integer,
  outcome :: Outcome,
  location :: Location,
  month :: Integer,
  seasonSegment :: SeasonSegment,
  dateFrom :: SimpleDate,
  dateTo :: SimpleDate,
  opponentTeamID :: Integer,
  vsConference :: Conference,
  vsDivision :: Division,
  gameSegment :: GameSegment,
  period :: Integer,
  lastNGames :: Integer
  }

instance Optionable ShootingSplitsParams where
  toOptions ssp =
    defaults
    & param "measureType" .~ [toText (measureType ssp)]
    & param "perMode" .~ [toText (perMode ssp)]
    & param "plusMinus" .~ [toText (plusMinus ssp)]
    & param "paceAdjust" .~ [toText (paceAdjust ssp)]
    & param "rank" .~ [toText (rank ssp)]
    & param "season" .~ [toText (season ssp)]
    & param "seasonType" .~ [toText (seasonType ssp)]
    & param "playerID" .~ [T.pack $ show (playerID ssp)]
    & param "outcome" .~ [toText (outcome ssp)]
    & param "location" .~ [toText (location ssp)]
    & param "month" .~ [T.pack $ show (month ssp)]
    & param "seasonSegment" .~ [toText (seasonSegment ssp)]
    & param "dateFrom" .~ [toText (dateFrom ssp)]
    & param "dateTo" .~ [toText (dateTo ssp)]
    & param "opponentTeamID" .~ [T.pack $ show (opponentTeamID ssp)]
    & param "vsConference" .~ [toText (vsConference ssp)]
    & param "vsDivision" .~ [toText (vsDivision ssp)]
    & param "gameSegment" .~ [toText (gameSegment ssp)]
    & param "period" .~ [T.pack $ show (period ssp)]
    & param "lastNGames" .~ [T.pack $ show (lastNGames ssp)]
