-- Haskell self-learn file #04
-- recursion
-- http://learnyouahaskell.com


-- partial specializations for recursion (like 0, 1 for fibonacci)
-- are called edge conditions

-- recursive flavor of max function
-- (remember, no loops in fx programming)
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum called on empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum' xs

-- max function to ease things:
maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum called on empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)

-- another example, replicate
-- generates a list of repeated values of certain length
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | x <= 0    = []
    | otherwise = x:replicate' (n - 1) x

-- take. cuts a number from list by value
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ []   = []
take' n (x:xs) = x : take' (n - 1) xs
