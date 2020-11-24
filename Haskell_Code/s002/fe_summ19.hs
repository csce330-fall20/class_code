
f x y = [x,y]

q7 = ( ( 2 , "legit") , "Kim" )

nor :: Bool -> Bool -> Bool
nor False False = True
nor _     _     = False

maxOr0:: Float -> Float -> Float
maxOr0 x y 
    | x > 0 && x>y = x
    | y > 0 && x<=y = y
    | otherwise     = 0

addFirst2 :: Num a => [a] -> [a]
addFirst2 = (\ (x1:x2:xs)->(x1+x2):xs )

midItem :: [a] -> a
midItem = (\ xs -> xs !! ((length xs  +1)`div` 2  -1) )

noVowels :: String -> String
noVowels cs = [c | c<-cs, (not.v) c ]
    where
        v 'a' = True
        v 'e' = True
        v 'i' = True
        v 'o' = True
        v 'u' = True
        v _   = False

noVowels' cs = [c | c<-cs, not (elem c ['a','e','i','o','u']) ]

redact :: [a] -> String
redact cs = ['X' | _<-cs]

isEvenLength :: [a] -> Bool
isEvenLength [] = True
isEvenLength [_] = False
isEvenLength (_:_:xs) = isEvenLength xs

type Pos = (Float,Float)
type Circle = ( Pos , Float)

data List a = Nil  | Cons (List a) deriving Show

revcat :: [String] -> String
revcat css = concat (map reverse css )

revcat' css = foldr (++) [] (map reverse css )

revcat'' css = foldr (\ cs rest-> reverse cs ++ rest) [] css

revcat''' :: [String] -> String
revcat''' = foldr (\ cs rest-> reverse cs ++ rest) []

revcat'''' = concat.(map reverse)
