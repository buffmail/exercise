;;; -*- lexical-binding: t; -*-

(require 'names)
(define-namespace leetcode-17-letter_combination

(defun make-combination (curr-string input-seq letter-codes)
  (let* ((curr-char (car input-seq))
         (curr-candidates (alist-get curr-char letter-codes)))
    (if (null curr-char) curr-string
      (mapcar (lambda (elem)
                (make-combination
                 (if (null curr-string) (list elem) (append curr-string (list elem)))
                 (cdr input-seq)
                 letter-codes))
              curr-candidates))))

(let ((letter-codes '((2 . (a b c))
                     (3 . (d e f))
                     (4 . (g h i))
                     (5 . (j k l))
                     (6 . (m n o))
                     (7 . (p q r s))
                     (8 . (t u v))
                     (9 . (w x y z))))
      (input-seq '(2 3 2)))
  (make-combination nil input-seq letter-codes))

); leetcode-17-letter_combination
