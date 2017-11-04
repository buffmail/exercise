;;; -*- lexical-binding: t; -*-

(require 'cl)
(require 'cl-lib)
(require 'names)
(define-namespace leetcode-18-4Sum

(defun get-sub-list (elems n)
  (let ((elems-len (length elems))
        (x (car elems))
        (xs (cdr elems)))
    (cond ((= n 1) (mapcar (lambda (x) (list x)) elems))
          ((< elems-len n) nil)
          ((= elems-len n) (list elems))
          (t (append
              (mapcar (lambda (elem) (cons x elem))
                      (get-sub-list xs (- n 1)))
              (get-sub-list xs n))))))

(let ((source '(1 0 -1 0 -2 2))
      (select-num 4)
      (target 0))
  (cl-remove-if-not (lambda (sublist)
                      (= target (apply #'+ sublist)))
   (get-sub-list source select-num))
  )

); leetcode-18-4Sum
