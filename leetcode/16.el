;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-16-3sum-closest

(defun get-pair-list (elems)
  (let ((x (car elems))
        (xs (cdr elems)))
    (if (null xs) nil
      (append (mapcar (lambda (elem) (list x elem)) xs)
              (get-pair-list xs)))))

(defun get-triple-list (elems)
  (let* ((x (car elems))
         (xs (cdr elems))
         (pair-list (get-pair-list xs)))
    (if (null pair-list) nil
      (append (mapcar (lambda (pair) (apply '+ (cons x pair)))
                      pair-list)
              (get-triple-list xs)))))

(let ((input '(-1 2 1 -4))
      (target 1))
  (car (sort (get-triple-list input)
             (lambda (a b) (< (abs (- a target))
                              (abs (- b target)))))))

); leetcode-16-3sum-closest
