--q6
f1 :: (Ord a, Num a) => a -> Bool
f1 x = if x <= x*x then True else False

isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True 
isVowel 'o' = True
isVowel 'u' = True
isVowel  _  = False

--q17
noVowels :: String -> String
noVowels cs = filter (not.isVowel) cs

--q18
oddCubes :: [Int] -> [Int]
oddCubes = (map (^3)).(filter odd)