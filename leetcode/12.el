;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-12

(let ((input_number 1231))
  (concat
   (nth (/ input_number 1000)
        '("" "M" "MM" "MMM"))
   (nth (/ (mod input_number 1000) 100)
        '("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"))
   (nth (/ (mod input_number 100) 10)
        '("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"))
   (nth (mod input_number 10)
        '("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX"))))

); leetcode-12
