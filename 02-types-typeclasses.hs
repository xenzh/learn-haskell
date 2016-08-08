-- Haskell self-learn file #02
-- types, type inference
-- typeclasses
-- http://learnyouahaskell.com


-- Types
-- In ghci, one can test type by :t <expression>

-- Functions have types too.
-- Declaring function type beforehand is a good style
removeLowercase :: [Char] -> [Char]
removeLowercase st = [ c | c <- st, c `elem` ['A'..'Z'] ]

-- No distinction between parameters and result in signature
-- except that result is always last
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- common types
-- Int is 32-bit integer -- default choice
-- Integer is not bounded integer (for big values)
factorial :: Integer -> Integer
factorial n = product [1..n]
t1 = factorial 50

-- Float - single precision, Double - double precision
circumference :: Float -> Float
circumference r = 2 * pi * r
t2 = circumference 4.0

circumference' :: Double -> Double
circumference' r = 2 * pi * r
t3 = circumference' 4.0

-- Bool, only 2 values: True and False
-- Char - character, denoted by single quotes, 'c'. List of Chars is a string


-- Type variables aka generics
-- :t head -- head :: [a] -> a
-- a is a type variable (template parameter). Note it's lowercase and types are uppercase

-- :t fst -- fst :: (a, b) -> a
-- that's why it works only on binary tuples


-- Typeclasses
-- The same as Rust's traits - some interface-like constraints placed on a type
-- :t (==) -- (==) :: (Eq a) => a -> a -> Bool
-- Basic ones:
-- Eq - test for equality. Provides == and /=.
-- Ord - types that can be ordered. Provides >, <, >=, <=
--       compare returns type Ordering, values are GT, LT, EQ
tcl1 = 5 `compare` 3

-- Show - members can be presented as a string using show function
tcl2 = show True

-- Read - members can be read from string
tcl3 = read "True" || False

-- Note that it works because read's return type is inferred from out context
-- simple read "True" won't compile.
-- use type annotations to avoid:
tcl4 = read "True" :: Bool
tcl5 = read "[1, 2, 3, 4]" :: [Int]

-- Enum - members are sequentially ordered types. One can use Enum types in list ranges
tcl6 = ['a' .. 'e']
tcl7 = [LT .. GT]
tcl8 = succ 'B' -- successor, next element

-- Bounded - members have upper and lower bounds
--           take type annotation as an argument, like polymorphic constants
tcl9 = minBound :: Int
tcl10 = maxBound :: (Bool, Int, Char)

-- Num - typeclass for all the numbers. Works the same way
tcl11 = 20 :: Int
tcl12 = 20 :: Double

-- operators use it as a constraint
-- :t (*) -- (*) :: (Num a) => a -> a -> a
-- Num type should be Show and Eq
-- Integral includes Int and Integer
-- Floating includes Float and Double

-- :t fromIntegral
-- fromIntegral :: (Num b, Integral a) => a -> b
-- needed to convert between integral types
tcl13 = fromIntegral (length [1, 2, 3, 4]) + 3.2
