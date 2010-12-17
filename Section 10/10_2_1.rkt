;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 10_2_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct ir (name price))

;; contains-doll? : inventory -> boolean
;; to determine whether an-inv contains a record for 'doll
(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) false]
    [(symbol=? (ir-name (first an-inv)) 'doll) true]
    [else (contains-doll? (rest an-inv))]))

; list containing structures
(define my-list (cons (make-ir 'doll 17.95) empty))
(define my-list-2 (cons (make-ir 'plane 20.35) empty))

; test cases for contains-doll?
(contains-doll? my-list) ;true
(contains-doll? my-list-2) ;false

;; contains? : symbol inventory -> boolean
;; to determine whether an inv contains a record for a-symbol
(define (contains? a-symbol an-inv)
  (cond
    [(empty? an-inv) false]
    [(symbol=? (ir-name (first an-inv)) a-symbol) true]
    [else (contains? a-symbol (rest an-inv))]))

;; test cases for contains?
(contains? 'doll my-list) ;true
(contains? 'plane my-list-2) ;true
(contains? 'duck my-list) ;false