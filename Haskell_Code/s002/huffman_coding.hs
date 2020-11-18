data HTree = CNode Double Char
        |    INode Double HTree HTree deriving Show

freq :: HTree -> Double
freq (CNode f _ )   = f
freq (INode f _ _ ) = f

merge :: HTree -> HTree ->HTree
merge l r = INode (freq l + freq r) l r