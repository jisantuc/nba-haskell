module ParameterTypes where

import Data.List (intersperse)

import qualified Data.Text as T
import Network.Wreq (Options)

class Textable a where
  toText :: a -> T.Text

class Optionable a where
  {-# MINIMAL toOptions #-}
  toOptions :: a -> Options

data MeasureType = Base
  | Advanced
  | Misc
  | FourFactors
  | Scoring
  | Opponent
  | Usage
  deriving (Show)

instance Textable MeasureType where
  toText x = T.pack . show $ x

data PerMode = Totals
  | PerGame
  | MinutesPer
  | Per48
  | Per40
  | Per36
  | PerMinute
  | PerPossession
  | PerPlay
  | Per100Possessions
  | Per100Plays
  deriving (Show)

instance Textable PerMode where
  toText x = T.pack . show $ x

data SeasonType = RegularSeason
  | PreSeason
  | Playoffs
  deriving (Show)

instance Textable SeasonType where
  toText RegularSeason = T.pack "Regular Season"
  toText PreSeason = T.pack "Pre Season"
  toText Playoffs = T.pack "Playoffs"

data SeasonSegment = PostAllStar
  | PreAllStar
  deriving (Show)

instance Textable SeasonSegment where
  toText PostAllStar = T.pack "Post All-Star"
  toText PreAllStar = T.pack "Pre All-Star"

data Conference = Eastern | Western deriving (Show)

instance Textable Conference where
  toText Western = T.pack "West"
  toText Eastern = T.pack "East"

data Outcome = W | L deriving (Show)

instance Textable Outcome where
  toText x = T.pack . show $ x

data Location = Home | Away deriving (Show)

instance Textable Location where
  toText x = T.pack . show $ x

data YesNoBool = N | Y deriving (Eq, Show)

instance Textable YesNoBool where
  toText x = T.pack . show $ x

data SimpleDate = SimpleDate Integer Integer Integer

instance Textable SimpleDate where
  toText (SimpleDate year month day) =
    T.pack . concat . intersperse "-" . map show $ [year, month, day]

data Division = Pacific
  | Atlantic
  | Central
  | Northwest
  | Southeast
  | Southwest
  | East
  | West
  deriving (Show)

instance Textable Division where
  toText x = T.pack . show $ x

data Season = Season Integer

instance Textable Season where
  toText (Season y) = T.pack . concat $
    [show y, "-", show $ y - 2000]

data GameSegment = FirstHalf
  | SecondHalf
  | Overtime

instance Textable GameSegment where
  toText FirstHalf = T.pack "First Half"
  toText SecondHalf = T.pack "Second Half"
  toText Overtime = T.pack "Overtime"
