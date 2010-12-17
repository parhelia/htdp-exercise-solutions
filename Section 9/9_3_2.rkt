;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 9_3_2) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
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

(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [(boolean=? (empty? (first a-list-of-symbols)) true) 0] ;test if first is empty
    [else (+ 1 (how-many-symbols (rest a-list-of-symbols)))]))

;; test cases for how-many-symbols
(how-many-symbols empty) ;0
(how-many-symbols (cons empty empty)) ;0
(how-many-symbols (cons empty (cons empty empty))) ;0
(how-many-symbols (cons 'ball empty)) ;1
(how-many-symbols (cons 'arrow (cons 'doll empty))) ;2
(how-many-symbols '(arrow ball)); 2
(how-many-symbols (cons 'bow (cons 'arrow (cons 'ball empty)))) ;3