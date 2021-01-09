#lang scheme
; 这个答案出乎意料

; 用这种方式表达全局数组
(define (firstdenomination kind)
    (cond ((= kind 1) 1)
          ((= kind 2) 5)
          ((= kind 3) 10)
          ((= kind 4) 25)
          ((= kind 5) 50)))

; 迭代计算找零钱数
; dp(i,j) 是用 j种硬币换i美元的方法数
; dp(i,j) = dp(i,j-1)+dp(i-a[j],j);
(define (change-iter amount kinds)
    (cond 
        ( (= amount 0) 1)
        ( (or ( = kinds 0 ) (< amount 0) )
               0)
        (else
               (+ (change-iter amount (- kinds 1))
                  (change-iter (- amount 
                                  (firstdenomination kinds)) 
                               kinds)))))
(define (change amount)
    (change-iter amount 5) )

(change 100)