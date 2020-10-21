n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

last' xs = xs !! (length xs -1)

last'' xs = head (reverse xs)

last''' = head.reverse

last'''' xs = drop (length xs -1) xs !! 0 

last''''' [x] = x
last''''' (x:xs) = last''''' xs

init' xs = reverse (drop 1 (reverse xs))

init'' xs = reverse(tail(reverse xs))

init''' = reverse.tail.reverse

init'''' [x] = []
init'''' (x:xs) = x:init'''' xs