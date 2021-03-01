module Compress where
    import Data.List

    -- compress "aaaabccaadeeee" == [(4,'a'), (1,'b'), (2,'c'), (2,'a'), (1,'d'), (4,'e')]
    -- compress "oh hello!!"     == [(1,'o'),(1,'h'),(1,' '),(1,'h'),(1,'e'),(2,'l'),(1,'o'),(2,'!')]
    -- compress ""               == []
    compress :: Eq a => [a] -> [a]
    compress [] = []
    compress lst = compress_acc  lst []


    getLength [] = []
    getLength (x:y:xs)
      |  x == y         = x : getLength (y:xs) 
      | otherwise       = [x]


    compress_acc [] acc =  acc
    compress_acc [x] acc = (x:acc)
    compress_acc (x:xs) acc
        | x == (head xs)   = compress_acc xs acc
        | otherwise        = compress_acc xs (x:acc)