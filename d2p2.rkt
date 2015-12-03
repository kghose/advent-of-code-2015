#| Advent of code 2015 D2P2
|#
#lang racket


;; Read in data file and parse the present list
(define (read-santas-list in [l `()])
  (define line (read-line in))
  (if (eof-object? line)
      l
      (read-santas-list in (append l (list (map string->number (string-split line "x")))))))

;;For a single gift, figure out how much wrapping paper we need
(define (ribbon-for-gift gift-dim)
  (define f1 (* 2 (+ (first gift-dim) (second gift-dim))))
  (define f2 (* 2 (+ (first gift-dim) (third gift-dim))))
  (define f3 (* 2 (+ (third gift-dim) (second gift-dim))))
  (define bow (* (first gift-dim) (second gift-dim) (third gift-dim)))
  (+ (min f1 f2 f3) bow))

;; Recurse through the list, pulling out tuples and computing the 
(define (sum-ribbon gift-dim-list)
  (cond
    [(eq? gift-dim-list `()) 0]
    [else (+ (ribbon-for-gift (car gift-dim-list)) (sum-ribbon (cdr gift-dim-list)))]))
  
(display (sum-ribbon (read-santas-list (open-input-file "d2p1.data.txt"))))