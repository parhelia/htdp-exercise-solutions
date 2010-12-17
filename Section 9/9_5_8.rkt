;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 9_5_8) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define width 300)
(define height 300)
(start width height)

(define (draw-circles p a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) true] ;do nothing, return true
    [(and (number? (first a-list-of-nums)) 
          (positive? (first a-list-of-nums)))
     (and (draw-circle p (first a-list-of-nums) 'red)
          (draw-circles p (rest a-list-of-nums)))]
    [else (error 'draw-circles "invalid list of nums")]))

;; test cases
;(draw-circles (make-posn 150 150) '(empty)) ;error
;(draw-circles (make-posn 150 150) (cons 'arrow (cons 'doll empty))) ;error
;(draw-circles (make-posn 150 150) (cons 10 empty))
;(draw-circles (make-posn 150 150) (cons 10 (cons 20 empty)))
;(draw-circles (make-posn 150 150) (cons 10 (cons 20 (cons 30 empty))))
;(draw-circles (make-posn 150 150) '(10 20 30))