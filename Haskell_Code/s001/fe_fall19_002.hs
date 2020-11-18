f x y = x*y `mod` 7

abcd = [ ( 2 , "legit") , ( 2 , "quit") ]

f1 :: (Num a, Ord a) => a -> Bool
f1 x = if x > x^2 then  True else False

all3Equal:: Eq a => a -> a -> a -> Bool
all3Equal x y z 
    | x == y && y == z = True
    | otherwise        = False

isVowel :: Char -> Bool
isVowel 'a' = True
isVowel 'e' = True
isVowel 'i' = True
isVowel 'o' = True
isVowel 'u' = True
isVowel _  = False

firstLast :: Eq a => [a] -> Bool
firstLast = (\ xs -> xs !! 0 == xs !! (length xs -1) )

firstLast' :: Eq a => [a] -> Bool
firstLast' = (\ xs -> head xs == last xs )

firstLast'' :: Eq a => [a] -> Bool
firstLast'' = (\ (x:xs) -> x == last xs )

abgtc :: (Ord a, Num a) => a -> a -> a -> Bool
abgtc = (\ x y z -> x*y>z)

numQs:: String -> Int
numQs cs = length [ c | c<-cs, (\ d -> d=='?') c ]

numQs' cs = length [ c | c<-cs, c=='?'  ]

numQs'' cs = sum [ 1 | c<-cs, c=='?'  ]

numQs''' cs = sum [1 | c<-cs, isQ c]
    where isQ c = (c=='?')

oddCubes:: [Int] -> [Int]
oddCubes ns = [ n^3 | n<-ns , odd n ]

elem' _ [] = False
elem' x (y:ys) 
    | x == y = True
    | otherwise  = elem x ys

intersects:: Eq a => [a] -> [a] -> Bool
intersects [] _ = False
intersects (x:xs) ys
    | elem x ys = True
    | otherwise = intersects xs ys

type Person = (String,String,Int) 

data Nat = Zero | Succ Nat deriving Show

positive:: Nat -> Bool
positive Zero = False
positive _    = True

sub :: Nat->Nat->Nat
sub n1          Zero    = n1
sub (Succ n1) (Succ n2) = sub n1 n2

noVowels :: String -> String
noVowels cs = filter (not.isVowel) cs 

noVowels' cs = filter (not.isVowel) cs 

oddCubes' ns = map (^3) ( filter odd ns )