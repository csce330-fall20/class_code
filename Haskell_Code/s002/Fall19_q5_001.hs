

allPos:: [Int]->Bool
allPos [] = True
allPos (x:xs)
    | x <=0 = False
    | otherwise = allPos xs

allPos' ns = and $ map (>=0) ns

allPos'' ns = all (>=0) ns

allPos''' ns =  null $ filter (<=0) ns