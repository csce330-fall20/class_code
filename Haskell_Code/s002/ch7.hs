mapfilter p f xs = map f (filter p xs)

map' f xs = foldr (\x xs -> f x : xs ) [] xs

map'' f xs = [ f x | x<-xs]


filter' p xs = foldr (\ x xs -> if p x then x:xs else xs ) [] xs