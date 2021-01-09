#lang scheme

(define (f num)
    (cond ((< num 3) num)
          (else   (+ (f (- num 1))
                     (* (f (- num 2)) 2)
                     (* (f (- num 3)) 3)))))

( format "begin f" )
(f  0)
(f  1)
(f  2)
(f  3)
(f  4)
(f  5)
; a          b   c
; a+2b+3c    a   b

; f(3)  f(2) f(1)
; 找到了一些规律,就是所有的特判都是在 迭代里面判断的,源程序不需要判断
; 这样就能结构简单,逻辑优雅
(define (f-iter num a b c)
    (cond ((= num 0) c)
          ((= num 1) b)
          ((= num 2) a)
          (else (f-iter (- num 1)
                        (+ a
                           (* 2 b)
                           (* 3 c))
                        a
                        b))))
(define (f-iter-shell num)
          (f-iter num  2 1 0))

(format "begin f-iter")
(f-iter-shell 0)
(f-iter-shell 1)
(f-iter-shell 2)
(f-iter-shell 3)
(f-iter-shell 4)
(f-iter-shell 5)