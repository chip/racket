#lang racket

(provide song verse)

(define last-verse "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n")

(define (no-more n)
  (if (= n 0) "no more" n))

(define (singular-plural n)
  (if (= n 1) "bottle" "bottles"))

(define (bottles n)
  (format "~a ~a" (no-more n) (singular-plural n)))

(define of-beer "of beer")

(define of-beer-on-the-wall (format "~a on the wall" of-beer))

(define (verse-part-1 n)
  (let ([s (bottles n)])
    (format "~a ~a, ~a ~a" s of-beer-on-the-wall s of-beer)))

(define (it-or-one n)
  (if (= n 1) "it" "one"))

(define (take-1-down n)
  (format "Take ~a down and pass it around," (it-or-one n)))

(define (compose-verse n)
  (format "~a.\n~a ~a ~a.\n"
          (verse-part-1 n)
          (take-1-down n)
          (bottles (sub1 n)) 
          of-beer-on-the-wall))

(define (verse n)
  (if (= n 0)
    last-verse
    (compose-verse n)))

(define (song start [end 0])
  (string-join (map (lambda (n) (verse n)) (inclusive-range start end -1)) "\n"))
