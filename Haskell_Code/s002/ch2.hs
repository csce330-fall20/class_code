n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

last' xs = xs !! (length xs - 1)

last'' xs = head ( reverse xs )

last''' [x] = x
last''' (x:xs) = last''' xs

last'''' xs = head  (drop (length xs -1 ) xs)

last''''' = head.reverse

init' [x] = []
init' (x:xs) = x: init' xs

init'' xs = take ( length xs -1 ) xs

init''' xs = reverse (tail (reverse xs) )

init''''  = reverse.tail.reverse