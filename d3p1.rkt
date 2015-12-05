#|
Advent of Code 2015 day 3 problem 1

Algorithm: Hashtable

|#
#lang racket
(require racket/block)

; A house coordinate address 
(struct pos (x y) #:inspector #f)


;; Return next-house
(define (visit-next-house h move-instr)
  (match move-instr
    [#\^ (struct-copy pos h [y (- (pos-y h) 1)])]
    [#\v (struct-copy pos h [y (+ (pos-y h) 1)])]
    [#\< (struct-copy pos h [x (- (pos-x h) 1)])]
    [#\> (struct-copy pos h [x (+ (pos-x h) 1)])]))


;; move-santa List -> Int
(define (move-santa current-house instr-list [visited-houses-hash (make-hash)])
  (cond
    [(eq? instr-list `()) (hash-count visited-houses-hash)]
    [else
     (block
      (hash-set! visited-houses-hash current-house 1)
      (move-santa  (visit-next-house current-house (car instr-list))
                   (cdr instr-list) visited-houses-hash))]))

(display (move-santa (pos 0 0) (string->list (read-line (open-input-file "d3p1.data.txt")))))
