;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 9_5_7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; version 1
;(define (contains-doll? a-list-of-symbols)
;  (cond
;    [(empty? a-list-of-symbols) false]
;    [else (cond
;            [(symbol=? (first a-list-of-symbols) 'doll) true]
;            [else (contains-doll? (rest a-list-of-symbols))])]))

;; version 2
;; Exercise 9.3.2
;; Destructuring lists. Incorporate the base case into the test
(define (contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [(symbol=? (first a-list-of-symbols) 'doll) true]
    [else (contains-doll? (rest a-list-of-symbols))]))

;; Exercise 9.3.3
;; Consume a symbol and a list of symbols to determine if the symbol is
;; within the list
(define (contains? a-symbol a-list-of-symbols)
  (cond
    [(empty? a-symbol)(error 'contains? "requires a symbol and a list of symbols")]
    [(empty? a-list-of-symbols) false]
    [(symbol=? (first a-list-of-symbols) a-symbol) true]
    [else (contains? a-symbol (rest a-list-of-symbols))]))

;; test cases for Exercise 9.3.2
;(contains-doll? empty) ;false
;(contains-doll? (cons 'ball empty)) ;false
;(contains-doll? (cons 'arrow (cons 'doll empty))) ;true
;(contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty)))) ;false

;; test cases for Exercise 9.3.3
;(contains? empty (cons empty empty))
;(contains? 'arrow (cons 'ball empty)) ;false
;(contains? 'doll (cons 'arrow (cons 'doll empty))) ;true
;(contains? 'doll (cons 'bow (cons 'arrow (cons 'ball empty)))) ;false

;; sum : list-of-numbers -> number
;; to compute the sum of the numbers on a-list-of-nums

(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums)(sum (rest a-list-of-nums)))]))

;; test cases for sum
;(sum empty)
;(sum (cons 1.00 empty))
;(sum (cons 17.05 (cons 1.22 (cons 2.59 empty))))

;; Exercise 9.5.2
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [(boolean=? (empty? (first a-list-of-symbols)) true) 0] ;test if first is empty
    [else (+ 1 (how-many-symbols (rest a-list-of-symbols)))]))

;; test cases for how-many-symbols
;(how-many-symbols empty) ;0
;(how-many-symbols (cons empty empty)) ;0
;(how-many-symbols (cons empty (cons empty empty))) ;0
;(how-many-symbols (cons 'ball empty)) ;1
;(how-many-symbols (cons 2 empty)) ;1
;(how-many-symbols (cons 'arrow (cons 'doll empty))) ;2
;(how-many-symbols '(arrow ball)); 2
;(how-many-symbols '(arrow 2)); 2
;(how-many-symbols (cons 'bow (cons 'arrow (cons 'ball empty)))) ;3

(define (how-many-numbers a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [(boolean=? (number? (first a-list-of-nums)) false) (how-many-numbers (rest a-list-of-nums))]
    [else (+ 1 (how-many-numbers (rest a-list-of-nums)))]))

;; test cases for how-many-numbers
;(how-many-numbers empty) ;0
;(how-many-numbers (cons empty empty)) ;0
;(how-many-numbers (cons empty (cons empty empty))) ;0
;(how-many-numbers (cons 1 empty)) ;1
;(how-many-numbers (cons '1 empty)) ;1
;(how-many-numbers (cons 'apple (cons 1 empty))) ;1
;(how-many-numbers (cons '1 (cons '2 empty))) ;2
;(how-many-numbers (cons 1 (cons 2 empty))) ;2
;(how-many-numbers '(1 2 3)) ;3


;; Exercise 9.5.3
(define (dollar-store? threshold a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) true]
    [(> threshold (first a-list-of-prices))
     (dollar-store? threshold (rest a-list-of-prices))]
    [else false]))

;; test cases for dollar-store?
;(dollar-store? empty empty) ;true
;(dollar-store? 1 empty) ;true
;(dollar-store? 1 (cons 0.75 (cons 1.95 (cons .25 empty)))) ;false
;(dollar-store? 2 (cons 0.75 (cons 1.95 (cons .25 empty)))) ;true
;(dollar-store? 2 '(0.75 1.95 .25)) ;true


;; Exercise 9.5.7
(define (check-list a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) true]
    [(empty? (first a-list-of-prices)) (error 'check-list "Empty list")]
    [(symbol? (first a-list-of-prices)) false]
    [(negative? (first a-list-of-prices)) false]
    [(struct? (first a-list-of-prices)) false]
    [else (check-list (rest a-list-of-prices))]))

(define (total-price a-list-of-prices)
  (and (check-list a-list-of-prices)
       (cond
         [(empty? a-list-of-prices) 0]
         [else (+ (first a-list-of-prices) (total-price (rest a-list-of-prices)))])))

(define (average-price a-list-of-prices)
  (/ (total-price a-list-of-prices) (how-many-numbers a-list-of-prices)))


;; test cases for check-list
;(check-list (cons empty empty)) ;error
;(check-list '(empty))
;(check-list '(0)) ;true
;(check-list '(0 1)) ;true
;(check-list '(1 2 3)) ;true
;(check-list '(a b c)) ;false

;; test cases for average-price
;(average-price '(0))
;(average-price '(0 1))
;(average-price '(1))
;(average-price '(1 2 3))
;(average-price '(a b c))