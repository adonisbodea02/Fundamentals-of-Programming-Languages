import Algorithm (g)
import Sort (quicksort)

main = do 
		putStrLn "First list: "
		c1 <- getLine
 		let list1 = read c1 :: [Integer]
		putStrLn "Second list: "
		c2 <- getLine
		let list2 = read c2 :: [Integer]
		let sortList1 = quicksort list1
		let sortList2 = quicksort list2
		putStrLn "The pair with the smallest difference is: "
		print (g sortList1 sortList2)