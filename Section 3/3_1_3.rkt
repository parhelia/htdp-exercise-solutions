;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 3_1_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; profit : number -> number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; revenue: number -> number
;; to compute the revenue, given ticket-price
(define (revenue ticket-price)
  (* (attendees ticket-price)
     ticket-price))

;; fixed cost
(define fixed-cost 180)

;; variable cost per person
(define cost-per-person 0.04)

;; cost: number -> number
;; to compute the costs, given ticket-price
(define (cost ticket-price)
  (+ fixed-cost
     (* cost-per-person (attendees ticket-price))))
   
(define base-ticket-price 5.00)

(define base-attendees 120)

;; attendees: number -> number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ base-attendees
   (* 15
    (/ (- base-ticket-price ticket-price) 0.1 ))))