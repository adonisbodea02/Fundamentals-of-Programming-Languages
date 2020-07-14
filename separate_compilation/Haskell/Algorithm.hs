module Algorithm(g) 

where

f :: [Integer] -> [Integer] -> Integer -> (Integer,Integer) -> (Integer, Integer)
f [] _ d p = p
f _ [] d p = p
f (x:xs) (y:ys) d p
					| (abs(x - y) < d) && (x < y) = f xs (y:ys) (abs (x - y)) (x,y)
					| (abs(x - y) < d)            = f (x:xs) ys (abs (x - y)) (x,y)
					| x < y                       = f xs (y:ys) d p
					| otherwise                   = f (x:xs) ys d p






g :: [Integer] -> [Integer] -> (Integer, Integer)
g xs ys = f xs ys 99999 (0,0)