;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-11

(defun get-size (x)
  (let ((first-elem (car x))
        (last-elem (car (last x)))
        (elem-dist (- (length x) 1)))
    (cond
     ((or (null first-elem) (null last-elem)) 0)
     (t (max (* (min first-elem last-elem) elem-dist)
             (get-size (if (> first-elem last-elem) (last x elem-dist)
                         (cdr x))))))))

(get-size '(1 2 4 3 4 1 2))

); leetcode-11
