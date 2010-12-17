;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; f : number  ->  number
(define (f x)
  (+ (* 3 (* x x)) 
     (+ (* -6 x)
        -1)))

;; tabulate-f : number -> list
;; 
;; return a list of a-nums in descending order    
;; [else (cons a-num (tabulate-f (sub1 a-num)))]))
;;
;; return a list of (f a-nums) in descending order
;; [else (cons (f a-num) (tabulate-f (sub1 a-num)))]))
;;
;; now combine the concepts
;; [else (cons a-num (cons (f a-num) (tabulate-f (sub1 a-num))))]))

(define (tabulate-f a-num)
  (cond
    [(equal? a-num -1) empty]
    [else (cons a-num (cons (f a-num) (tabulate-f (sub1 a-num))))]))

;; test cases
;(f 0) = -1
;(f 1) = -4
;(f 2) = -1
;(f 3) = 8
;(f 4) = 23

;(tabulate-f 4)
;Expected output
;(cons 4 (cons 23 (cons 3 (cons 8 (cons 2 (cons -1 (cons 1 (cons -4 (cons 0 (cons -1 empty)))))))))) 