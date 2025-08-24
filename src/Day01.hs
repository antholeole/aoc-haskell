module Day01 where

import Paths_aoc2024 (getDataFileName)
import Data.List (sort)
import qualified Data.Map as Map



part1 :: [(Int, Int)] -> Int
part1 input =
    let
        fs = sort (map fst input)
        ss = sort (map snd input)
     in
        sum . map abs $ zipWith (-) fs ss

part2 :: [(Int, Int)] -> Int
part2 input =
    let
        freqs = Map.fromListWith (+) . flip zip (repeat 1) $ map snd input
        getFreq = flip (Map.findWithDefault 0) freqs
     in
        sum $ map ((\a -> getFreq a * a) . fst) input

day01 :: IO ()
day01 = do
  inputLines <- lines <$> (getDataFileName "day01-input.txt" >>= readFile)
  putStrLn "This is what I read from input:"
  putStrLn $ unlines inputLines
  putStrLn "TODO: implement Day 01"
