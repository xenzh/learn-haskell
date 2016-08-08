-- Haskell self-learn file #1
-- functions
-- lists
-- tuples
-- list comprehensions

-- http://learnyouahaskell.com


--
-- Introduction to functions
--

-- Functions are defined like this:
doubleme x = x * 2
doubleus x y = x * 2 + y * 2

doubleus2 x y = doubleme x + doubleme y

-- if statement return a value
doublesmall x = if x > 100 then x else x * 2

-- "'" is usual char, used in functions to denote modified version of smth
doublesmall' x = (if x > 100 then x else x * 2) + 1

-- funtions can't begin with uppercase letters
-- welcome ho haskell: variable is const and is a function!
conano'brien = "It's a-me, Conan O'Brien"

-- in ghci, use let x = .. to do the same as above


--
-- Introduction to lists
--

-- lists are defined with []
-- lists are homogenous
lostNumbers = [4, 8, 15, 16, 32, 42]

-- list concatenation
-- strings like "str" are lists as well
listConcat = [1, 2, 3, 4] ++ [0, 9, 8, 7]
strConcat = "hello " ++ ['w', 'o', 'r', 'l', 'd']

-- '++' takes O(N) at least since lists are single-linked
-- append to head takes O(1) -- ":" called cons operator
headAppend = 'A' : " SMALL CAT"

-- lists are actually syntactic sugar for cons operator
consOp = 1:2:3:[]
consOpTest = consOp == [1, 2, 3]

-- access by index
indexAccess = "back in black" !! 8

-- comparisons are in lexicographical order
comp1 = [3, 2, 1] > [2, 1, 0] -- True
comp2 = [3, 2, 1] > [2, 10, 100] -- True
comp3 = [3, 4, 2] > [3, 4] -- True
comp4 = [3, 4, 2] > [2, 4] -- True
comp5 = [3, 4, 2] == [3, 4, 2] -- True

-- basic list operation functions
lHead = head [5, 4, 3, 2, 1] -- 5
lTail = tail [5, 4, 3, 2, 1] -- [4, 3, 2, 1]
lLast = last [5, 4, 3, 2, 1] -- 1
lInit = init [5, 4, 3, 2, 1] -- [5, 4, 3, 2]

-- haskell just crash on out-of-bound access
-- head []

lLength = length [5, 4, 3, 2, 1]
lNull1 = null [1, 2, 3] -- False
lNull2 = null [] -- True

lReverse = reverse [5, 4, 3, 2, 1] -- [1, 2, 3, 4, 5]

-- take extracts n elements from list head
lTake1 = take 3 [5, 4, 3, 2, 1] -- [5, 4, 3]
lTake2 = take 1 [3, 9, 3] -- [3]
lTake3 = take 5 [1, 2] -- [1, 2]
lTake4 = take 0 [6, 6, 6] -- []

-- drop drops n elements from list head
lDrop1 = drop 3 [8, 4, 2, 1, 5, 6] -- [1, 5, 6]
lDrop2 = drop 0 [1, 2, 3, 4] -- [1, 2, 3, 4]
lDrop3 = drop 9 [1, 2, 3, 4] -- []

lMinimum = [2, 4, 1, 5] -- 1
lMaximum = [2, 4, 1, 5] -- 5

lSum1 = sum [5, 2, 1, 6, 3, 2, 5, 7] -- 31
lProd1 = product [1, 3, 5, 7] -- 105
lProd2 = product [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] -- 0

-- infix form, demo for elem (test if item is present in the list)
lElem1 = 4 `elem` [3, 4, 5, 6] -- True
lElem2 = 10 `elem` [3, 4, 5, 6] -- False

-- Ranges
-- syntax: [a..b]
-- are applicable for things that can be enumerated, like ints or chars
rInts = [1..20]
rChars = ['a'..'z']
rCharsU = ['K'..'Z']

-- Step can be specified for the range. [first, second .. end]
rStep1 = [2, 4 .. 10]
rStep2 = [3, 6 .. 20]
rStep3 = [20, 19 .. 1]

-- Float ranges are dangerous (because of precision) => not recommended
rFloat = [0.1, 0.3 .. 1]

-- infinite lists. Haskell is lazy, therefore  they are possible
rInfinite = take 24 [13, 26 .. ]

-- infinite lists can be produced
rInfinite2 = take 10 (cycle [1, 2, 3])
rInfinite3 = take 12 (cycle "LOL ")
rInfinite4 = take 10 (repeat 5)
rReplicate = replicate 10 5

-- List comprehensions
-- S = { 2 * x | x belongs to N, x <= 10 } -- just like sets in math
-- 2 * x - output function
-- x - variable
-- N - input set
-- x <= 10 - predicate

lc1 = [x * 2 | x <- [1..10]]
lc2 = [x * 2 | x <- [1..10], x * 2 >= 12]
lc3 = [x | x <- [50..100], x `mod` 7 == 3]

-- as soon as predicates are applied, it is called filtering
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- several predicates
lc4 = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]

-- combining input from several lists
lc5 = [x * y | x <- [2, 5, 8], y <- [8, 10, 11]]
lc6 = [x * y | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50]

lcNouns = ["hobo", "frog", "pope"]
lcAdj = ["lazy", "grounchy", "scheming"]
lc7 = [adj ++ " " ++ noun | adj <- lcAdj, noun <- lcNouns]

-- length: convert all list elements to 1 and sum them. _ is "don't care"
length' xs = sum [1 | _ <- xs]

-- Operations on strings
removeLowercase st = [c | c <- st, c `elem` ['A'..'Z']]
lc8 = removeLowercase "Hahaha, Ahaha!"
lc9 = removeLowercase "IdontLIKEFROGS"

-- Remove even numbers from the list without flattening it
xxs = [[1, 3, 5, 2, 3, 1, 2, 4, 5], [1, 2, 3, 4, 5, 6, 7, 8], [9, 8, 7, 6, 4]]
lc10 = [ [ x | x <- xs, even x] | xs <- xxs ]

-- Tuples
-- fixed size, not homogenous, empty tuple () has single () value

-- fst and snd operate only on binary pairs
tp1 = fst (8, 11)
tp2 = snd ("Wow", 42)

-- zip combines two lists into list of tuples
tp3 = zip [1, 2, 3, 4, 5] "abcde"

-- it produces number of elements equal to shorter list length
tp4 = zip [1, 2, 3, 4, 5, 6] ["one", "two", "three"]

-- therefore can zip with infinite lists
tp5 = zip [1..] ["apples", "oranges"]

-- problem: find right triangles, all sides are int, < 10 and perimeter is 24
-- 1. try to generate input set
triangles = [ (a, b, c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
rightTriangles = [ (a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]
rightTriangles' = [ (a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a + b + c == 24 ]

-- it's a common pattern in functional programming
-- 1 to make an input set
-- 2 to apply transformations to get a result
