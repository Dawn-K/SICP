#lang scheme
;取平均值
;这一个之前写成 2/(x+y) 了
(define 
    (average x y)
    (/   (+ x y)
         2))

; 采用求立方根的迭代方法
(define 
    (improve y x)
    (/ 
        (+ (/ x (* y y)) 
           (* y 2))
        3))

; 判断是否已经达到预期精度,注意使用三次方
(define 
    (good-enough? guess x)
    (< 
        (abs 
            (- (* guess guess guess) 
               x)) 
        0.001))

; 采用相对误差判断精度 注意使用三次方
(define (new-good-enough? guess x)
    (< (/ (abs (- (* guess guess guess) x))
          x)
       0.001))


; 迭代计算 guess
(define 
    (cube-iter guess x)
    (if 
        (good-enough? guess x)
        guess
        (cube-iter (improve guess x) 
                   x)))

; 本模块入口,用以计算x^(1/3)
(define (cube x)
    (cube-iter 1.0 x))


; 测试代码
(cube 2)
(cube 3)
(cube 4)
(cube 5)
; 1.259933493449977
; 1.4422497895989996
; 1.5874096961416333
; 1.7100597366002945

; >>> 2**(1/3)
; 1.2599210498948732
; >>> 3**(1/3)
; 1.4422495703074083
; >>> 4**(1/3)
; 1.5874010519681994
; >>> 5**(1/3)
; 1.7099759466766968

; 使用了python进行了验算,基本上正确


;(cube 10000000000000000000000000000000000000000)
; 似乎死循环了

(cube 0.00000001)