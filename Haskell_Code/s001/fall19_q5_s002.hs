

countOnes :: [Char]->Int
countOnes []     = 0
countOnes (c:cs) = if c == '1' then 1+ countOnes cs else countOnes cs

countOnes' :: [Char]->Int
countOnes' []     = 0
countOnes' ('1':cs) = 1+ countOnes' cs 
countOnes' (_:cs)   = countOnes' cs

countOnes'' :: [Char]->Int
countOnes'' []     = 0
countOnes'' (c:cs) 
    |  c== '1'   = 1+ countOnes'' cs 
    |  otherwise = countOnes'' cs

countOnes''' :: String -> Int
countOnes''' cs = sum $ map (\c -> if c == '1' then 1 else 0 ) cs

countOnes'''' :: String -> Int
countOnes'''' cs = length ( filter (=='1') cs)

countOnes''''' :: String -> Int
countOnes'''''  = length.( filter (=='1') )

countOnes'''''' cs = foldr (\c rest-> (if c=='1' then 1 else 0) +rest  ) 0 cs

countOnesX cs = foldr f 0 cs
    where
        f c rest= (if c=='1' then 1 else 0) +rest  

countOnesLC cs = sum [ 1 | c<-cs , c=='1']

compress cs = foldr (\ c rest -> if null rest then [c] else f c rest  ) [] cs
    where
        f c rest = if c ==  head rest then rest else c:rest

compress' cs = [cs!!i | i <-[0..length cs -2], cs!!i /= cs!!(i+1)  ] ++ [last cs]

compress'' [] = []
compress'' [c] = [c]
compress'' (c1:c2:cs)
    | c1 == c2 = compress'' (c2:cs)
    | otherwise = c1: compress'' (c2:cs)

compress''' [] = []
compress''' xs = map fst (filter (\(x,y)->x/=y) (zip xs $ tail xs)) ++[last xs]