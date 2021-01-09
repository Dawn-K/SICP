#lang scheme
(define (fib num)
    (cond ( (= num 1) 1)
          ( (= num 0) 0)
          ( else      (+ (fib (- num 1))
                         (fib (- num 2))))))

(fib 3)



(define (fib-iter num a b)
    (if (= num 0) b
        (fib-iter (- num 1) (+ a b)  a)))
(define (fib-iter-shell num)
    (fib-iter num 1 0))
(fib-iter-shell 3)