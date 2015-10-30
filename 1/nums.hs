{-# LANGUAGE OverloadedStrings #-} 
import Turtle
import qualified Control.Foldl as Fold

main :: IO ()
main = fold computation Fold.nub >>= mapM_ (echo . format (""%s%""))

computation :: Shell Text
computation = do
        x <- select [1..68]
        let point = repr (getMeasurePoint x)
        return $ head $ cut (char '.') point

getMeasurePoint :: Int -> Double
getMeasurePoint n = exp (logBase (exp 1) (128*1024)/68)^n
