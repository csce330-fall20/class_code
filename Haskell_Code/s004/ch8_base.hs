nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))


data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n) 

multlc x y = sum [ y | _ <- [1..x] ] 

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ m) n = add n (mult m n)


data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr deriving Show

folde :: (Int->Int) -> (Int->Int->Int) -> (Int->Int->Int) -> Expr -> Int
folde vf _ _   (Val i) = i
folde vf af mf (Add x y) = af (fe x) (fe y)
    where 
        fe = folde vf af mf
folde vf af mf (Mul x y) = mf (fe x) (fe y)
    where 
        fe = folde vf af mf


data Tree a = Nil 
            | Leaf a
            | Node (Tree a) a (Tree a) deriving Show

complete :: Tree a -> Bool
complete Nil            = True
complete (Leaf _)       = True
complete (Node lt _ rt) = size lt == size rt && complete lt && complete rt

size :: Tree a -> Int
size Nil            = 0
size (Leaf _)       = 1
size (Node lt _ rt) = 1+ size lt + size rt

slide21 = Node (Node (Leaf 1)3(Leaf 4) ) 5 (Node (Leaf 6)7(Leaf 9))

slide21incomplete = Node (Node (Leaf 1)3 Nil ) 5 (Node (Leaf 6)7(Leaf 9))e 