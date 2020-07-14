import Data.IORef

numLongChains :: Int -> Int -> Counter -> IO Int -- define the function which calculates the number of numbers which have a longer chain than the given bound, NIS = 1
numLongChains chainLimit n counter = do
                                      let length' :: [Int] -> Int -- define our length function which computes the length of list, NIS = 2
                                          length' xs = sum [1 | _ <- xs]
                                          isLong :: [Int] -> Bool -- define the function which checks if the length is bigger than the given bound, NIS = 2
                                          isLong xs = length' xs > n
                                          in let chain :: Int -> [Int] -- define the function which creates the chain as list given a number, NIS = 3
                                                 chain 1 = [1]
                                                 chain n  
                                                     | even n =  n:chain (n `div` 2)
                                                     | odd n  =  n:chain (n*3 + 1)
                                                 length' [] = 0 -- redefine the function length to calculate the length of a list differently, NIS = 3
                                                 length' (_:xs) = 1 + (length' xs)
                                                 in let filter' _ [] = []  -- define the filter function which eliminates elements given a predicate, NIS = 4
                                                        filter' p (x:xs)
                                                             | p x       = x : filter' p xs  
                                                             | otherwise = filter' p xs
                                                        in counter (length' (filter' isLong (map chain [1..chainLimit]))) --all together: 
                                                        --we generate the chains from 1 to the the upper bound by mapping the chain function to each number from 1 to the upper bound - map chain [1..chainLimit]
                                                        --we filter the resulting list based on the isLong predicate - filter' isLong (map chain [1..chainLimit])
                                                        --we calculate the length of remaining valid chains using the last definition of length - length' (filter' isLong (map chain [1..chainLimit]))
                                                        --we add the result to our simulated "global variable"

type Counter = Int -> IO Int

makeCounter :: IO Counter --define the function which creates simulated "global variables" using IORef, NIS = 1
makeCounter = do
   r <- newIORef 0
   return (\i -> do modifyIORef r (+i)
                    readIORef r)

main = do --main function, NIS 1
        counter <- makeCounter --global variable/function which acts as a accumulator between different calls of the numLongChains function
        lastValue <- makeCounter --global variable/function used in the logic of printing meaningful content to the user
        let loop = do --loop functionality for the sole purpose of demonstrating the use of our simulated "global variables", NIS 2
                putStrLn "Upper bound: "
                c1 <- getLine
                let n = read c1 :: Int
                putStrLn "Minimum chain length: "
                c2 <- getLine
                let m = read c2 :: Int
                putStrLn "The number of numbers smaller than the given bound for which the chain is longer than the limit specified is: "
                a <- numLongChains n m counter
                -- program logic for printing meaningful content to the user
                -- since counter "keeps" a sum of all the values returned by the numLongChains function, 
                -- we "store" in lastValue the last sum in order to show the user the result he is interested by making a simple difference 
                b <- lastValue 0
                let c = a-b
                print c
                lastValue (-b)
                lastValue a
                putStrLn "Wanna try again? (Yes/No) "
                response <- getLine
                if response == "Yes"  
                    then do
                        loop
                    else putStrLn "Bye"
        loop
        