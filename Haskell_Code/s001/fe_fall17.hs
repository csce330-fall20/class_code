xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _     _    = False

additiveInverse :: Int -> Int -> Bool
additiveInverse x y 
    | x+y == 0  = True
    | otherwise = False

isIsogram :: String -> Bool
isIsogram [] = True
isIsogram (c:cs)
    | elem c cs = False
    | otherwise = isIsogram cs

isSorted :: Ord a => [a] -> Bool
isSorted []  = True
isSorted [_] = True
isSorted (x1:x2:xs)
    | x1 <= x2 = isSorted (x2:xs)
    | otherwise = False

pwrs2_10 = take 10 [ 2^p | p<-[1..] ]

pwrs2 n = take n [ 2^p | p<-[1..] ]


isIsogram' cs = null [ i | i <-[1..length cs], elem ( cs !! (i-1)) (drop i cs)]

isIsogram'' cs = any (\cs->length cs >= 2) [ [ d | d<-cs, d==c]  | c<-cs ]

absVec ::  Num a => [a] -> [a]
absVec ns = map abs ns

absVec' ::  Num a => [a] -> [a]
absVec' = map abs

absVec'' :: Num a => [a] -> [a]
absVec'' ns = foldr (\ n rest -> abs n : rest ) [] ns 

l1norm :: Num a => [a] -> a
l1norm ns = foldr (\n rest-> abs n + rest) 0 ns

l2norm :: Floating a => [a] -> a
l2norm ns = sqrt $ foldr (\n rest-> n*n + rest) 0 ns