mapfilter f p xs = map f (filter p xs)

mapfilter' f p = (map f).(filter p )

mapfilterWrong f p = (filter p ).(map f)

map' f xs = foldr (\x xs ->  f x : xs ) [] xs

filter' p xs =  foldr (\x xs-> if p x then x:xs else xs) [] xs