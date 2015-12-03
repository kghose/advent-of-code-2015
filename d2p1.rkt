#| Advent of code 2015 D2P1
|#
#lang racket


;; Read in data file and parse the present list
(define (read-santas-list in [l `()])
  (define line (read-line in))
  (if (eof-object? line)
      l
      (read-santas-list in (append l (list (map string->number (string-split line "x")))))))

;;For a single gift, figure out how much wrapping paper we need
(define (wrapping-paper-for-gift gift-dim)
  (define s1 (* (first gift-dim) (second gift-dim)))
  (define s2 (* (first gift-dim) (third gift-dim)))
  (define s3 (* (third gift-dim) (second gift-dim)))
  (define extra (min s1 s2 s3))
  (+ (* 2 s1) (* 2 s2) (* 2 s3) extra))

;; Recurse through the list, pulling out tuples and computing the 
(define (sum-wrapping-paper gift-dim-list)
  (cond
    [(eq? gift-dim-list `()) 0]
    [else (+ (wrapping-paper-for-gift (car gift-dim-list)) (sum-wrapping-paper (cdr gift-dim-list)))]))
  
(display (sum-wrapping-paper (read-santas-list (open-input-file "d2p1.data.txt"))))