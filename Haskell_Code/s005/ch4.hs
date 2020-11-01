--null'
null' :: [a] -> Bool

--null' cond
null' xs = if length xs == 0 then True else False

--null'' pattern
null'' [] = True
null'' _  = False

--null''' guarded
null''' xs 
   | length xs == 0 = True
   | otherwise      = False

null'''' xs = length xs == 0

--safetail
--safetail cond
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

--safetail pattern
safetail' [] = []
safetail' (_:xs) =  xs

--safetail guarded
safetail'' xs 
   | null xs   = []
   | otherwise = tail xs

(||) :: Bool -> Bool -> Bool
{- False || False = False
False || True  = True
True  || False = True
True  || True  = True -}

 --match both arguments
{- False || False = False
_     || _     = True -}

--match first arg only
False || b = b
_     || _ = True


-- && with cond
{- True && True = True
   _    && _    = False -}
(&&) :: Bool -> Bool -> Bool
--(&&) a b = if a then if b then True else False else False

--above, again, with slightly different logic
(&&) a b = if a then b else False



