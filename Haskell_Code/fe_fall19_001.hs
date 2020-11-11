f :: Num a => a -> a -> a
f x y = x*y + 7

q5 = ( [ "quit" , "legit", "fred"] , [ 2 , 3] )

--q6
--conditional
not' :: Bool -> Bool
not' b = if b == True then False else True


--pattern matching
not'' :: Bool -> Bool
not'' True = False
not'' False = True

--q7
abgtc:: (Num a, Ord a) => a -> a -> a -> Bool
abgtc a b c 
    | a*b > c = True
    | otherwise =False

milSpeak :: Char -> String
milSpeak 'a' = "Alpha"
milSpeak 'b' = "Bravo"
milSpeak 'c' = "Charlie"
milSpeak _ = "Nope"

c2str :: Char -> String
c2str = (\c -> [c])

nthOdd ::  Int -> Int
nthOdd = (\n -> if n<0 then -1 else 2*n+1)

smallLs :: [a] -> [[a]]
smallLs xs = [ [x] | x<-xs ]

smallLs' :: [a] -> [[a]]
smallLs' =  map (\x -> [x])

smallLs'' :: [a] -> [[a]]
smallLs'' = foldr (\x rest-> [x]:rest) []

reverse' :: [a] ->[a]
reverse' xs = [ xs !! (i-1) | let l = length xs, i<-[l,(l-1) .. 1]] 

reverse'' :: [a] -> [a]
reverse'' xs = [ xs!! i | i<-indices]
    where
        l = length xs
        indices = [l-1,(l-2) .. 0]

countDown :: Int -> Int -> [Int]
countDown s f = [s,s-1 .. f]

countDown' :: Int -> Int -> [Int]
countDown' s f
    | s < f = []
    | otherwise = s : countDown' (s-1) f

countDown'' :: Int -> Int -> [Int]
countDown'' s f = if s<f then [] else (s : countDown'' (s-1) f )

-- order: make model year 
type Car = (String,String,Int)

make :: (String,String,Int) -> String
make (m,_,_) = m

model :: (String,String,Int) -> String
model (_,m,_) = m
 
year :: (String,String,Int) -> Int
year (_,_,y) = y

data List a = Cons a (List a) | Nil

head' :: List a -> a
head' (Cons x _ ) = x

--q17 above (smallLs )

--q18
allPositive :: (Num a, Ord a) => [a] -> Bool
allPositive = foldr (\x rest -> x > 0 && rest ) True

allPositive' xs = all (>0) xs

allPositive'' xs = foldr (&&) True (map (>0) xs )