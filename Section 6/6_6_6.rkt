;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 6_6_6) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
;#lang racket

;; structure definition and data definition for representing colored circles
;; a circle has 3 pieces of information: center, radius and color of its
;; perimeter. The first is a posn structure, second a number, third a color
;; symbol.

(define-struct a-circle (center radius color))
;;Expected output
;;(define my-circle (make-a-circle (make-posn 30 30) 2 'red))
;;(a-circle-color my-circle) ;output: 'red
;;(a-circle-center my-circle) ;output: (make-posn 30 30)

;; develop the template fun-for-circle, which outlines a function that consumes
;; circles. Its result is undetermined.

(define my-circle (make-a-circle (make-posn 30 30) 30 'red))

(start 300 300)
;(draw-circle (make-posn 30 30) 3 'red)
;(define my-circle (make-a-circle (make-posn 30 30) 30 'red))

(define (draw-my-circle this-circle)
  (draw-circle
   (a-circle-center this-circle)
   (a-circle-radius this-circle)
   (a-circle-color this-circle)))

;;calculate the Euclidean distance between two points
(define (distance posn1 posn2)
  (sqrt
   (+ (sqr (- (posn-x posn1) (posn-x posn2)))
      (sqr (- (posn-y posn1) (posn-y posn2))))))

(define (in-circle? this-circle posn)
  (cond
    [(> (distance posn (a-circle-center this-circle)) (a-circle-radius this-circle)) "not in circle"]
    [else "within circle"]))

;;this translate function is more flexible by moving the circle by delta, which is a posn
(define (translate-xy this-circle delta)
  (make-a-circle
   (make-posn
    (+ (posn-x (a-circle-center this-circle)) (posn-x delta))
    (+ (posn-y (a-circle-center this-circle)) (posn-y delta)))
   (a-circle-radius this-circle)
   (a-circle-color this-circle)))

(define (translate-circle this-circle delta)
  (make-a-circle
   (make-posn
    (+ (posn-x (a-circle-center this-circle)) delta)
    (posn-y (a-circle-center this-circle)))
   (a-circle-radius this-circle)
   (a-circle-color this-circle)))


;test
;(define delta (make-posn 30 30))
;(translate my-circle delta)

;;we assume the background is white
(define (clear-a-circle this-circle)
  (draw-circle (a-circle-center this-circle)
               (a-circle-radius this-circle)
               'white))

;(draw-my-circle my-circle) ;draw the circle
;(sleep-for-a-while 2) ;pause, as required by Exercise 6.6.6
;(clear-a-circle my-circle) ;clear the circle, as required by Exercise 6.6.6

;; move-circle : number circle -> circle
;; to draw and clear a circle, translate it by delta pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

(define (draw-and-clear-circle a-circle)
  (and (draw-my-circle a-circle)
       (sleep-for-a-while 0.5)
       (clear-a-circle a-circle)))

(draw-my-circle 
 (move-circle 10
              (move-circle 10
                           (move-circle 10
                                        (move-circle 10
                                                     (move-circle 10 my-circle))))))

