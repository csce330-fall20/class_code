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

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ m) n = add n (mult m n)

data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr deriving Show

folde :: (Int->Int) -> (Int->Int->Int) -> (Int->Int->Int) -> Expr -> Int
folde valf           _ _ (Val x) = valf x
folde valf addf mulf (Add le re) = addf vleft vright
    where
        vleft  = folde valf addf mulf le 
        vright = folde valf addf mulf re
folde valf addf mulf (Mul le re) = mulf vleft vright
    where
        vleft  = folde valf addf mulf le 
        vright = folde valf addf mulf re
        


data Tree a = Nil 
            | Leaf a
            | Node (Tree a) a (Tree a) deriving Show

complete :: Tree a -> Bool
complete Nil = True
complete (Leaf _) = True
complete (Node lsubt _ rsubt) =
    size lsubt == size rsubt && complete lsubt && complete rsubt


size :: Tree a -> Int
size Nil = 0
size (Leaf _) = 1
size (Node lsubt _ rsubt) = size lsubt + 1 + size rsubt

slide21 = Node (Node (Leaf 1)3(Leaf 4) ) 5 (Node (Leaf 6)7(Leaf 9))

slide21incomplete = Node (Node (Leaf 1)3 Nil ) 5 (Node (Leaf 6)7(Leaf 9))