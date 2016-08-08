-- Haskell self-learn file #03
-- pattern matching
-- http://learnyouahaskell.com


-- Pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!11"
lucky x = "Sorry, you're out of luck, pal"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- exhaustive catch is not required, but heavily recommended
-- wthis below will throw an expetion if called with 'd'
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- can be used on tuples
addv :: (Num a) => (a, a) -> (a, a) -> (a, a)
addv a b = (fst a + fst b, snd a + snd b)

-- and now with pattern matching, destructuring tuples
addv' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addv' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- _ in pattern matches works as in list comprehensions
first :: (a, b, c) -> a
first (x, _, _) = x
second :: (a, b, c) -> b
second (_, y, _) = y
third :: (a, b, c) -> c
third(_, _, z) = z

-- you can even match in list comprehensions:
-- element is ignored if pattern match fails
xs = [ (1, 3), (4, 3), (6, 9) ]
pm1 = [ a + b | (a, b) <- xs ]

-- lists can participate in pattern amtching, by chopping off
-- the head, just like in C++ variadic templates recursion
head' :: [a] -> a
head' [] = error "can't get head from empty list"
head' (x:_) = x

-- the same but with Show typeclass and no exceptions
tell :: (Show a) => [a] -> String
tell [] = "empty"
tell (x:[]) = "single element: " ++ show x
tell (x:_) = "longer than one element, which is " ++ show x

-- list length on recursion and pattern matching
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- sum. the same, but no placeholders
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- patterns: bind a pattern match to a name and reference
-- the whole thing represented by the pattern
capital :: String -> String
capital "" = "Empty string, yo"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- guard conditions are to evaluate something to Bool
-- otherwise is defined as "otherwise = True"
bmi :: (RealFloat a) => a -> String
bmi i
    | i <= 18.5 = "underweight"
    | i <= 25.0 = "just normal"
    | i <= 30.0 = "overweight"
    | otherwise = "obese"

bmi2 :: (RealFloat a) => a -> a -> String
bmi2 weight height
    | weight / height ^ 2 <= 18.5 = "underweight"
    | weight / height ^ 2 <= 25.0 = "just normal"
    | weight / height ^ 2 <= 30.0 = "overweight"
    | otherwise                   = "obese"

-- guards can be placed inline
max' :: (Ord a) => a -> a -> a
max' a b | a > b = a | otherwise = b

-- compare impl. defined infix!
mycomp :: (Ord a) => a -> a -> Ordering
a `mycomp` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

-- where clause can be used to calculate smth for guards and bind it to the name
what' :: (Integral a) => a -> String
what' num
    | idx == 42 = "Thanks for the fish"
    | otherwise = "Nope, don't know"
    where idx = num `mod` 100

-- or even bind rhs values:
whatx' :: (Integral a) => a -> String
whatx' num
    | idx == hhgtg = "Thanks for the fish!"
    | otherwise = "Nope, don't know"
    where idx = num `mod` 100
          hhgtg = 42

-- and guess what, you can pattern match in where clause
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

-- can also define functions in where clause
bmis :: (RealFloat a) => [(a, a)] -> [a]
bmis xs = [ bmi w h | (w, h) <- xs ]
    where bmi weight height = weight / height ^ 2
