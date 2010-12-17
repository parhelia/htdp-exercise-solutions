;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 10_1_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (euro->dollar euro)
  (* 1.22 euro))

(define (euro->dollar-1 rate euro)
  (* rate euro))

(define (convert-euro alon)
  (cond
    [(empty? alon) empty]
    [else (cons (euro->dollar (first alon)) (convert-euro (rest alon)))]))

;; takes 2 lists and mutiplies both of them
;; we assume they are of equal length
(define (convert-euro-1 alo-rates alo-euros)
  (cond
    [(empty? alo-rates) empty]
    [else (cons (euro->dollar-1 (first alo-rates) (first alo-euros))
                (convert-euro-1 (rest alo-rates) (rest alo-euros)))]))


;; test cases
(convert-euro empty)
(convert-euro '(0))
(convert-euro '(0 1 2 3))

(convert-euro-1 '(1.22 1.322 1.4) '(10 10 10))
(convert-euro-1 '(0 1.22) '(10 10))