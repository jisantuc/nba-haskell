module Main where

import Control.Lens
import Network.Wreq

import ParameterTypes
import PlayerGameLogParams

main :: IO ()
main = do
  params <- return $ PlayerGameLogParams 123123 (Season 2016) RegularSeason
  resp <- getWith (toOptions params) "http://stats.nba.com/stats/playergamelog/"
  putStrLn $ show $ resp ^. responseStatus . statusCode
