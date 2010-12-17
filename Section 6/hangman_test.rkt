;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname hangman_test) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(start 300 300)

(define (draw-next-part part)
  (cond
    [(symbol=? 'right-leg part) (draw-right-leg (make-posn 150 175) (make-posn 225 225))]
    [(symbol=? 'left-leg part) (draw-left-leg (make-posn 150 175) (make-posn 75 225))]
    [(symbol=? 'left-arm part) (draw-left-arm (make-posn 150 100) (make-posn 75 75))]
    [(symbol=? 'right-arm part) (draw-right-arm (make-posn 150 100) (make-posn 225 75))]
    [(symbol=? 'body part) (draw-body (make-posn 150 60)(make-posn 150 175))]
    [(symbol=? 'head part) (draw-head my-head)]
    [(symbol=? 'noose part) (draw-noose my-noose)]))

(define (draw-right-leg posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-left-leg posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-body posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define-struct noose (circle1 line1 line2))
(define-struct circle1 (posn radius color))
(define-struct line1 (posn-start posn-end))
(define-struct line2 (posn-start posn-end))

(define-struct a-head (circle2 left-eye right-eye))
(define-struct circle2 (posn radius color))

(define my-noose
  (make-noose (make-circle1
               (make-posn 150 50) 10 'black)
              (make-line1
               (make-posn 10 10) (make-posn 150 10))
              (make-line2
               (make-posn 150 10) (make-posn 150 40))))

;> (circle1-posn (noose-circle1 my-noose))
;(make-posn 15 50)

(define my-head
  (make-a-head (make-circle2
                (make-posn 170 50) 30 'red)
               (make-posn 185 45)
               (make-posn 165 39)))

(define (draw-noose a-noose)
  (and (draw-circle (circle1-posn (noose-circle1 a-noose))
                    (circle1-radius (noose-circle1 a-noose))
                    (circle1-color (noose-circle1 a-noose)))
       (draw-solid-line (line1-posn-start (noose-line1 a-noose)) (line1-posn-end (noose-line1 a-noose)))
       (draw-solid-line (line2-posn-start (noose-line2 a-noose)) (line2-posn-end (noose-line2 a-noose)))))

(define (draw-left-arm posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-right-arm posn-start posn-end)
  (draw-solid-line posn-start posn-end))

(define (draw-eye posn1)
  (and 
   (draw-solid-line
    (make-posn (- (posn-x posn1) 5) (+ (posn-y posn1) 5))
    (make-posn (+ (posn-x posn1) 5) (- (posn-y posn1) 5)))
   
   (draw-solid-line
    (make-posn (- (posn-x posn1) 5) (- (posn-y posn1) 5))
    (make-posn (+ (posn-x posn1) 5) (+ (posn-y posn1) 5)))))

(define (draw-head a-head)
  (and (draw-circle (circle2-posn (a-head-circle2 a-head))
                    (circle2-radius (a-head-circle2 a-head))
                    (circle2-color (a-head-circle2 a-head)))
       (draw-eye (a-head-left-eye a-head))
       (draw-eye (a-head-right-eye a-head))))

(define-struct word (letter1 letter2 letter3))
(define-struct status (letter1 letter2 letter3))

(define current-status
  (make-status '_ '_ '_))

(define (change-status a-status l1 l2 l3)
  (make-word l1 l2 l3))


(define (reveal word status letter)
  (cond
    [(symbol=? letter (word-letter1 word))
     (cond
       [(symbol=? letter (word-letter2 word))
        (change-status status letter letter (word-letter3 status))] ;1st and 2nd same
       [(symbol=? letter (word-letter3 word))
        (change-status status letter (word-letter2 status) letter)] ;1st and 3rd same
       [else (change-status status letter (word-letter2 status) (word-letter3 status))])]
    
    [(symbol=? letter (word-letter2 word))
     (cond
       [(symbol=? letter (word-letter1 word))
        (change-status status letter letter (word-letter3 status))] ;1st and 2nd same
       [(symbol=? letter (word-letter3 word))
        (change-status status (word-letter1 status) letter letter)] ;2nd and 3rd same
       [else (change-status status (word-letter1 status) letter (word-letter3 status))])]
    
    [(symbol=? letter (word-letter3 word))
     (cond
       [(symbol=? letter (word-letter1 word))
        (change-status status letter (word-letter2 status) letter)] ;1st and 3rd same
       [(symbol=? letter (word-letter2 word))
        (change-status status (word-letter1 status) letter letter)] ;2nd and 3rd same
       [else (change-status status (word-letter1 status) (word-letter2 status) letter)])]
    
    
    [else (change-status status (word-letter1 status) (word-letter2 status) (word-letter3 status))]))