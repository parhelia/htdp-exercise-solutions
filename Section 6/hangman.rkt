;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname hangman) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(start 300 300)

(define (draw-next-part part)
  (cond
    [(symbol=? 'right-leg part) (draw-right-leg (make-posn 150 175) (make-posn 225 225))]
    [(symbol=? 'left-leg part) (draw-left-leg (make-posn 150 175) (make-posn 75 225))]
    [(symbol=? 'left-arm part) (draw-left-arm (make-posn 150 100) (make-posn 75 75))]
    [(symbol=? 'right-arm part) (draw-right-arm (make-posn 150 100) (make-posn 225 75))]
    [(symbol=? 'body part) (draw-body (make-posn 150 60)(make-posn 150 175))]
    [(symbol=? 'head part) (and (draw-head) (draw-noose))]))

(define (draw-right-leg posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-left-leg posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-body posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define draw-noose
  (and (draw-circle (make-posn 150 50) 10 'black)
       (draw-solid-line (make-posn 10 10) (make-posn 150 10))
       (draw-solid-line (make-posn 150 10) (make-posn 150 40))))

(define (draw-left-arm posn-start posn-end)
  (draw-solid-line posn-start posn-end))
;  (draw-solid-line (make-posn 150 100) (make-posn 75 75)))

(define (draw-right-arm posn-start posn-end)
  (draw-solid-line posn-start posn-end))
;  (draw-solid-line (make-posn 150 100) (make-posn 225 75)))

(define (draw-eye posn1)
  (and 
   (draw-solid-line
    (make-posn (- (posn-x posn1) 5) (+ (posn-y posn1) 5))
    (make-posn (+ (posn-x posn1) 5) (- (posn-y posn1) 5)))
   
   (draw-solid-line
    (make-posn (- (posn-x posn1) 5) (- (posn-y posn1) 5))
    (make-posn (+ (posn-x posn1) 5) (+ (posn-y posn1) 5)))))

(define draw-head
  (and (draw-circle (make-posn 170 50) 30 'red)
       (draw-eye (make-posn 185 45))
       (draw-eye (make-posn 165 39))))