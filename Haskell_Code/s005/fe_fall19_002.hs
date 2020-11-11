--q18
oddCubes:: [Int] -> [Int]
oddCubes ns = map (^3) (filter odd ns)

--q8
isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True
isVowel  _  = False

--q17
noVowels :: String -> String
noVowels = filter (not.isVowel)

--q13
intersects:: Eq a => [a] -> [a] -> Bool
intersects [] _ = False
intersects (x:xs) ys 
    | elem x ys = True
    | otherwise = intersects xs ys

--q12 
oddCubes':: [Int] -> [Int]
oddCubes' ns = [ n^3 | n<-ns, odd n]

--q11
numQs:: String -> Int
numQs cs = length [ c | c<-cs, c=='?']

numQs':: String -> Int
numQs' cs = sum [ 1 | c<-cs, c=='?']

--w/filter, like first one
numQs'':: String -> Int
numQs'' cs = length (filter (=='?') cs)