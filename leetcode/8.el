;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-8

(defun digitp (x) (<= ?0 x ?9))

(defun get-digit (prev-value sign x)
  (if (= (length x) 0) (* (if sign sign 1) prev-value)
    (let* ((elem_char (elt x 0))
           (elem_num (- elem_char ?0)))
      (cond
       ((digitp elem_char) (get-digit (+ (* 10 prev-value) elem_num)
                                      (if sign sign 1)
                                      (substring x 1)))
       ((= elem_char ?-) (if sign (* sign prev-value)
                           (get-digit prev-value -1 (substring x 1))))
       ((= elem_char ?+) (if sign (* sign prev-value)
                           (get-digit prev-value 1 (substring x 1))))
       (t (* (if sign sign 1) prev-value))))))

(let ((inputs '("121" "1278" "-121" "+234" "--122" "+-121" "11.13" "12.34")))
  (mapcar
   (lambda (input_number)
     (cons input_number (get-digit 0 nil input_number)))
   inputs))

); leetcode-8
