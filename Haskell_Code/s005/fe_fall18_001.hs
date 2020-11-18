
g :: Num a => a ->a ->a -> a
g x y z = x+y*z 

f (x,y) = x == y

h = [('1',"3"),('c',"chili")]                  

mid :: (a,b,c) -> b
mid = (\ (_,x ,_) -> x)

indexEnd :: [a] -> Int -> a
indexEnd = (\ xs i -> xs !! ( length xs - i -1))

indexEnd' = (\xs i -> reverse xs !! i)

bitFlip :: String -> String
bitFlip cs = [ (\c->if c=='0' then '1' else '0') c | c<-cs]

doubleEverything :: [a] -> [a]
doubleEverything xs = concat [ [x,x] | x<- xs]

doubleEverything' xs = [ xs !! (i  `div` 2) | i<-[0..2*length xs -1] ]

evenSquareds :: [Int] -> [Int]
evenSquareds ns = map (\n->n^2) (filter even ns)

evenSquareds' ns = map (^2) (filter even ns)

evenSquareds'' = (map (^2) ).(filter even) 

evenSquareds''' xs = foldr (\ x rest-> x^2 : rest) [] xs 

addTicks :: String -> String -> String
addTicks ""     cs    = cs
addTicks (c:cs) ticks = c: addTicks cs ticks

addTicks' = (++)

--kind of a misnomer...
evenPowersOf3 :: Num a => [a]
evenPowersOf3 = map (3^) [0,2..]

evenPowersOf3' = map (3^) (filter even [0..])

type Event = (String, Double)

type SampleSpace = [Event]

prob :: Event -> Double
prob (_,p) = p

prob' = snd

heads = ("heads",0.5)
tails = ("tails",0.5)
fair_coin = [heads,tails]

moreLikely :: Event -> Event -> Bool
moreLikely a b = prob a > prob b

valid :: SampleSpace -> Bool
valid es = foldr (\ e rest -> snd e+rest) 0 es == 1

valid' es = sum ( map prob es) ==1 