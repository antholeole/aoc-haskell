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

readInt :: String -> Int
readInt = read

day01 :: IO ()
day01 = do
  inputLines <- lines <$> (getDataFileName "day01-input.txt" >>= readFile)
  let tuplify wds = (readInt $ head wds, readInt $ last wds)
  let asTuples = map (tuplify . words) inputLines

  putStrLn "Part 1:"
  print $ part1 asTuples

  putStrLn "Part 2:"
  print $ part2 asTuples
