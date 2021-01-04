#lang scheme
(define 
    (max3 x y z)
    (max x 
        (max y z)))

(max3 2 1 3)