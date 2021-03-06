# 第一章

[toc]

## 1.1

@import "../../src/Ch01/1-1.scm" {as="scheme"}

## 1.2

``` scheme
(/ (+ 5 4 (- 2 
             (- 3 
                (+ 6 
                   (/ 4 5)))))
    (* 3 
       (- 6 2)
       (- 2 7)))
```

## 1.3

@import "../../src/Ch01/1-3.scm" {as="scheme"}

## 1.4

if表达式作为运算符, 当 b>0时, 第二行变为 (+ a b), 否则为(- a b) 以此实现 a+abs(b)的效果.

## 1.5

@import "../../src/Ch01/1-5.scm" {as="scheme"}
此程序死循环.

* 如果是正则序的话, 程序会在求值前展开所有的表达式至基础单元.
* 如果是应用序的话, 则因为x是0, 则不会去求第二项的值, 所以就会直接得到0.

  
综上, racket解释器是正则序.

## 1.6

将源程序中的if替换为new-if后会发生死循环. 目前原因未知.

## 1.7

``` scheme
; 绝对误差

;2    =>  1.4142156862745097

;1e40 =>  1e+020
; 未发现异常

;1e-8 =>  0.03125010656242753
; 对于很小的数x=1e-8  
; guess平方与x有1e-3的误差也就意味着guess本身值为sqrt(1e8+1e3);
;这个结果显然失真

; 采用相对误差
(define (new-good-enough? guess x)
    (< (/ (abs (- (* guess guess) x))
          x)
       0.001))
;2    =>     1.4142156862745097
;1e40 =>     1.0000149206922578e+020
;1e-8 =>     0.00010000040611237676
```

## 1.8

@import "../../src/Ch01/1-8.scm" {as="scheme"}

## 1.9

为方便讨论, 我们令题中的+为f, 下文中的+是真的 `+1`

``` scheme
(f a b)
(+ 1 (f (- a 1) b))
(+ 1 (+ 1 (f (- (- a 1) 1) b)))
```

可见第一种方式是递归计算的

``` scheme
(f a b)
(f (- a 1) (+ b 1))
(f (- (- a 1) 1) (+ (+ b 1) 1))
```

可见第二种方式是迭代计算的

## 斐波那契

@import "../../src/Ch01/fib.scm" {as="scheme"}

## 找零钱

书上代码
@import "../../src/Ch01/change.scm" {as="scheme"}

尝试改进代码(未成功)
@import "../../src/Ch01/change_faster.scm" {as="scheme"}

## 1.11

@import "../../src/Ch01/1-11.scm" {as="scheme"}

## 1.12

@import "../../src/Ch01/1-12.scm" {as="scheme"}
