and' :: [Bool] -> Bool
and' [] = True
and' (False: _) = False
and' (True:bools) = and' bools

and'' [] = True
and'' (bool: bools) 
    | bool      = and'' bools
    | otherwise = False

and''' bools 
    | null bools = True
    | head bools  = and''' (tail bools)
    | otherwise  = False

concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

replicate' 0 _ = []
replicate' n x = [x] ++ replicate' (n-1) x

replicate'' 0 _ = []
replicate'' n x = x : replicate'' (n-1) x

replicate''' n x = take n (repeat x)

replicate'''' n x = take n $ repeat x

(!!) :: [a] -> Int -> a
(!!) (x:xs)  0 = x
(!!) (_:xs)  n = (Main.!!) xs  (n-1)

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys)
    | x == y    = True
    | otherwise = elem' x ys

merge :: Ord a => [a] -> [a] -> [a]
merge [] bs = bs
merge as [] = as
merge (a:as) (b:bs) 
    | a <= b    = a : merge as (b:bs)
    | otherwise = b: merge (a:as) bs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge sas sbs
    where
        half = length xs `div` 2
        as = take half xs
        bs = drop half xs
        sas = msort as
        sbs = msort bs