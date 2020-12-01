price_table :: [ (String,Float)]
price_table = [ ("nut",3.0), ("bolt",5.25), ("widget",9.99), ("screw",7.00), ("nail",2.05)]  

price :: String -> [(String, Float)] -> Float
price name pt = snd (head (filter (\tup->fst tup == name) pt) )

recip1 :: [ (String,Int)]
recip1 = [ ("nut",2), ("bolt",2), ("widget",1) ] 

priceRecipe :: [(String, Float)] -> [(String, Int)] -> Float
priceRecipe pt recipe = sum ( map (\(name,n)-> fromIntegral n*price name pt) recipe )

priceRecipe' :: [(String, Float)] -> [(String, Int)] -> Float
priceRecipe' pt recipe = foldr (\(name,n) rest-> fromIntegral n*price name pt + rest) 0 recipe 