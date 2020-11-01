pyths :: Int -> [(Int,Int,Int)]
pyths n = [ (x,y,z) | x <-[1..n], y<-[1..n], z<-[1..n], x^2 +y^2 == z^2] 

pyths' n = ordered_ps ++ rev_ps
   where
      ps n = [ (x,y,z) | x <-[1..n], y<-[x+1..n], z<-[y+1..n], x^2 +y^2 == z^2]
      ordered_ps = ps n
      rev_ps = [ (y,x,z) | (x,y,z)<-ordered_ps ]

factors :: Int -> [Int]
factors n =
   [x | x <- [1..n], n `mod` x == 0]

prime :: Int -> Bool
prime n = factors n == [1,n]

perfect :: Int -> Bool
perfect n = sum ( factors n ) == 2*n

perfects :: Int -> [Int]
perfects n = [ x | x<-[2..n], perfect x]

perfects' n = [ x | x<-[2..n], x== sum (init ( factors x)) ] 

sp :: Num a => [a] -> [a] -> a
sp as bs = sum [ as !! i * bs !! i | i<-[0.. length as -1]]

sp' as bs = sum [ a*b | (a,b)<- zip as bs]


sp'' []         [] = 0
sp'' (a:as) (b:bs) = a*b + sp'' as bs


