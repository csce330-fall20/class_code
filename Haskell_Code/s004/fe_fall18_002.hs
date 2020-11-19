g (x,y) s = (x*s , y*s) 

q7 = ( [ "Kale" , "chili"] , "Jim" )

fst' :: (a,b) -> a
fst' ( x, _) = x

even' :: Integral a => a -> Bool
even' n = if n `mod` 2 == 0 then True else False

second :: [a] -> a
second = ( \ xs -> xs !! 1)

second' = ( \ (_:x:xs) -> x )

nthEven :: Int -> Int
nthEven = (\n -> 2*n)

justOnes :: String -> String
justOnes cs = [ c | c<-cs, c=='1']

justOnes' cs = concat [ if c =='1' then ['1'] else [] | c<-cs]

justOnes'' cs = filter (=='1') cs

nthMultiple :: Num a => a -> Int -> a
nthMultiple x y = sum [x | _<-[1..y] ]

bwAnd :: String -> String -> String
bwAnd [] []         = []
bwAnd (b:bs) (c:cs) 
    | b=='1' && c==b = '1': bwAnd bs cs
    | otherwise      = '0' : bwAnd bs cs

bwAnd' as bs = map ( \(b1,b2)-> if b1==b2 then b1 else '0') (zip as bs)

bwAnd'' as bs = [ f (as!!i) (bs!!i) | i<-[0.. length as -1] ]
    where
        f b1 b2 = if b1=='1' && b2 == '1' then '1' else '0'

dupSepBy1 :: Eq a => [a] -> Bool
dupSepBy1 [] = False
dupSepBy1 [_] = False
dupSepBy1 [_,_] = False
dupSepBy1 (a:b:c:cs) 
    | a==c = True
    | otherwise = dupSepBy1 (b:c:cs)

type Student = (String, String, Int)

type NumDate = (Int,Int,Int)

fname :: Student -> String
fname (fn,_,_) = fn

isWaldoThere :: [String] -> Bool
isWaldoThere ss = filter (\s -> s=="Waldo") ss /= []

isWaldoThere' ss =  (length $ filter (=="Waldo") ss ) > 0

isWaldoThere'' ss = or ( map (=="Waldo")  ss )

isWaldoThere''' ss = foldr (\s rest-> s=="Waldo" || rest )  False ss

bitFlip :: String -> String
bitFlip bs = map (\b -> if b=='0' then '1' else '0') bs

bitFlip' bs = foldr (\ b rest-> f b : rest ) [] bs
    where f b = if b=='0' then '1' else '0'