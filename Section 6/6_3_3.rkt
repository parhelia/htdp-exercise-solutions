;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 6_3_3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct star (last first instrument sales))

(define (increment-sales a-star)
  (make-star (star-last a-star)
             (star-first a-star)
             (star-instrument a-star)
             (+ (star-sales a-star) 20000)))

;(define jw (make-star 'walker 'johnny 'voice 22))
;(increment-sales jw)

(define-struct warplane (designation acceleration top-speed range))

(define (within-range warplane distance)
  (cond
    [(<= distance (warplane-range warplane)) "within range"]
    [(> distance (warplane-range warplane)) "outside range"]))

(define (reduce-range a-plane)
  (make-warplane (warplane-designation a-plane)
                 (warplane-acceleration a-plane)
                 (warplane-top-speed a-plane)
                 (* 0.80 (warplane-range a-plane)))) 
                  
;(define f22 (make-warplane 'f22 10 10 10))
;(within-range f22 9)