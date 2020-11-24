c2str:: Char -> String
c2str = (\c->[c])

smallLs:: [a] -> [[a]]
smallLs xs = [ [x] | x<-xs]

reverse' :: [a] -> [a]
reverse' xs = [ xs !! i | i<-[l -1, l -2.. 0] ]
    where
        l = length xs

countDown:: Int -> Int -> [Int]
countDown x y
    | x < y  = []
    | x == y = [x]
    | otherwise = x : countDown (x-1) y