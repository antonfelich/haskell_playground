-- datatypes start with capital letters (I)nteger (L)ist
x :: Integer
x = 99

f :: (Integer) -> Integer
f r = r + 10

-- ff and fff, ffff, fffff are the same, you also don't need the brackets around the arguments
ff :: Integer -> (Integer -> Integer)
ff a b = (a + b) * 2

-- lambda expressions (λ aka backslash)
fff :: Integer -> (Integer -> Integer)
fff = \a b -> (a + b) * 2

ffff = \a -> \b -> (a + b) * 2
fffff a = \b -> (a + b) * 2

-- you can build your own operators by ensuring the function name starts with a-z and surround with backticks
add a b = a + b
-- 4 `add` 5

-- Generic types are always lowercase, they won't compile otherwise
-- sortBananas :: List Bananas -> List Bananas
-- sortOranges :: List Oranges -> List Oranges
-- sort :: List a -> List a 

-- Unspecified type (object, is called parametric polymorphism in haskell <p>)
-- g :: p -> p
g x = x

-- h :: p1 -> p2 -> p1
h x y = x

-- shape is abstract, circle, rectangle and triangle are sealed
data Shape = 
  Circle Integer 
  | Square Integer
  | Rectangle Integer Integer 
  | Triangle Integer Integer Integer
  deriving (Eq, Show) -- Show is .ToString and Eq is equality checking
-- :t Circle :: Integer -> Shape

pie :: Integer
pie = 3

-- Pattern matching with case
perimeter :: Shape -> Integer
perimeter = \s -> case s of
                            Circle r -> r * 2 * pie
                            Rectangle w h -> (w + h) * 2
                            Triangle a b c -> a + b + c
                            Square s -> s * 4

-- :set -fwarn-incomplete-patterns or :set -Wall
perimeteragain :: Shape -> Integer
perimeteragain (Circle r) = r * 2 * pie
perimeteragain (Rectangle w h) = (w + h) * 2
perimeteragain (Triangle a b c) = a + b + c
perimeteragain (Square s) = s * 4

hh :: (Integer -> Integer) -> Integer
hh w = 1 + w 88
-- hh (\x -> perimeter (Rectangle 6 x))
-- run hh where w is a function runs perimeter rectangle 6 88

-- Type class definition (function Interface)
class Equal a where 
    (===) :: a -> a -> Bool

-- Implementation
{-
instance Equal Shape where
    -- (===) :: Shape -> Shape -> Bool
    (===) s1 s2 =
      case s1 of
        -- If they are both circles, and their radi are the same then they are equal
        Circle r1 -> case s2 of
          Circle r2 -> r1 == r2
          _ -> False
        _ -> False
-}

instance Equal Shape where
  (===) (Circle r1) (Circle r2) = r1 == r2
  (===) (Rectangle w1 h1) (Rectangle w2 h2) = (w1 == w2) && (h1 == h2)
  (===) (Square s1) (Square s2) = s1 == s2 
  (===) _ _ = False