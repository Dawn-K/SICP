#lang scheme
;取平均值
;这一个之前写成 2/(x+y) 了
(define 
    (average x y)
    (/   (+ x y)
         2))

;guess与x/guess取平均值
(define 
    (improve guess x)
    (average guess 
        (/ x guess)))

; 判断是否已经达到预期精度
(define 
    (good-enough? guess x)
    (< 
        (abs 
            (- (* guess guess) 
               x)) 
        0.001))

; 采用相对误差判断精度
(define (new-good-enough? guess x)
    (< (/ (abs (- (* guess guess) x))
          x)
       0.001))

; (1-6)新if
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

; 迭代计算 guess
(define 
    (sqrt-iter guess x)
    (if 
        (new-good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) 
                   x)))

; 本模块入口,用以计算√x
(define (sqrt x)
    (sqrt-iter 1.0 x))


; 测试代码
(sqrt 2)
; 1.4142156862745097
(sqrt 10000000000000000000000000000000000000000)
; 对于很大的数并没有看出什么异常
; 1e40 也能正确开出来 1e+020
(sqrt 0.00000001)