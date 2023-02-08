#lang racket/base

(require "beer-song.rkt")

(module+ test
  (require rackunit rackunit/text-ui))

(module+ test

  (define suite
    (test-suite
     "beer-song tests"

     (test-equal? "verse 8"
                  (verse 8)
                  (string "8 bottles of beer on the wall, 8 bottles of beer.\n"
                          "Take one down and pass it around, 7 bottles of beer on the wall.\n"))

     (test-equal? "verse 2"
                  (verse 2)
                  (string "2 bottles of beer on the wall, 2 bottles of beer.\n"
                          "Take one down and pass it around, 1 bottle of beer on the wall.\n"))

     (test-equal? "verse 1"
                  (verse 1)
                  (string "1 bottle of beer on the wall, 1 bottle of beer.\n"
                          "Take it down and pass it around, no more bottles of beer on the wall.\n"))

     (test-equal? "verse 0"
                  (verse 0)
                  (string "No more bottles of beer on the wall, no more bottles of beer.\n"
                          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"))

     (test-equal? "song 8-6"
                  (song 8 6)
                  (string "8 bottles of beer on the wall, 8 bottles of beer.\n"
                          "Take one down and pass it around, 7 bottles of beer on the wall.\n\n"
                          "7 bottles of beer on the wall, 7 bottles of beer.\n"
                          "Take one down and pass it around, 6 bottles of beer on the wall.\n\n"
                          "6 bottles of beer on the wall, 6 bottles of beer.\n"
                          "Take one down and pass it around, 5 bottles of beer on the wall.\n"))

     (test-equal? "song 3-0"
                  (song 3 0)
                  (string "3 bottles of beer on the wall, 3 bottles of beer.\n"
                          "Take one down and pass it around, 2 bottles of beer on the wall.\n\n"
                          "2 bottles of beer on the wall, 2 bottles of beer.\n"
                          "Take one down and pass it around, 1 bottle of beer on the wall.\n\n"
                          "1 bottle of beer on the wall, 1 bottle of beer.\n"
                          "Take it down and pass it around, no more bottles of beer on the wall.\n\n"
                          "No more bottles of beer on the wall, no more bottles of beer.\n"
                          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"))))

  (run-tests suite))
