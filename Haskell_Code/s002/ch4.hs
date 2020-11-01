--null'
--null' :: [a] -> Bool

--null' cond
null' :: [a] -> Bool
null' xs = if (length xs == 0) then True else False

--null'' pattern
null'' [] = True
null'' _ = False

--null''' guarded
null''' xs 
   | xs == [] = True
   | otherwise = False


--safetail
--safetail cond
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

--safetail pattern
safetail' [] = []
safetail' xs = tail xs

--safetail guarded
safetail'' xs
   | null xs = []
   | otherwise = tail xs 

(||) :: Bool -> Bool -> Bool
--explicit
{- True || True = True
False || True = True
True || False = True
False || False = False -}
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
--(&&) a b = if a == True then if b==True then True else False else False
--above, again, with slightly different logic
(&&) a b = if a == True then b  else False



