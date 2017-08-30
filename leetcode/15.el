;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-15-3sum

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
      (delq nil
            (append (mapcar (lambda (pair)
                              (let ((answer (cons x pair)))
                                (if (= (apply '+ answer) 0) (sort answer '<)
                                  nil)))
                            pair-list)
                    (get-triple-list xs))))))

(delete-dups (get-triple-list '(-1 0 1 2 -1 -4)))
;  [-1, 0, 1]
;  [-1, -1, 2]

); leetcode-15-3sum
