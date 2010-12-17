;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 9_5_7_test) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define (how-many-numbers a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    ;uncomment the following line to allow the function to continue (tolerate symbols)
    ;[(boolean=? (number? (first a-list-of-nums)) false) (how-many-numbers (rest a-list-of-nums))]
    [(boolean=? (number? (first a-list-of-nums)) false) (error 'how-many-numbers "Invalid input")]
    
    [else (+ 1 (how-many-numbers (rest a-list-of-nums)))]))

;(define (total-price a-list-of-prices)
;       (cond
;         [(empty? a-list-of-prices) 0]
;         [else (+ (first a-list-of-prices) (total-price (rest a-list-of-prices)))]))

;(define (total-price a-list-of-prices)
;  (cond
;    [(empty? a-list-of-prices) 0]
;    [(and(number? (first a-list-of-prices))
;         (positive? (first a-list-of-prices)))
;         (+ (first a-list-of-prices) (total-price (rest a-list-of-prices)))]
;    [else (error 'average-price "wrong")]))


(define (total-price a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) 0]
    [(boolean=? (number? (first a-list-of-prices)) false)
     (total-price (rest a-list-of-prices))]
    [else (+ (first a-list-of-prices) (total-price (rest a-list-of-prices)))]))



(define (average-price a-list-of-prices)
  (/ (total-price a-list-of-prices) (how-many-numbers a-list-of-prices)))


;; test cases for average-price

(average-price '(0)) ;0
(average-price '(0 1)) ;0.5
(average-price '(0 1 0 0)) ;0.25
(average-price '(1)) ;1
(average-price '(1 2 3)) ;2
(average-price '(2.5 3.5 4.5)) ;3.5
;(average-price '(a b c)) ;error
;(average-price '(empty)) ;error
;(average-price (cons empty (cons empty empty))) ;error