;;; -*- lexical-binding: t; -*-
(require 'names)
(define-namespace leetcode-6

(defun create-tictoc (base a b)
  (let ((counter nil)
        (total base)
        added)
    #'(lambda ()
        (if (not (numberp counter)) (progn
                                      (setq counter 0)
                                      total)
          (setq added (if (or (eql a 0) (eql b 0)) (+ a b)
                        (if (oddp counter) a b)))
          (setq counter (1+ counter))
          (setq total (+ total added))
          total))))

(defun get-row-string (tictoc input-string input-string-length)
  (let ((curr-index (funcall tictoc)))
    (if (>= curr-index input-string-length) ""
      (concat (substring input-string curr-index (1+ curr-index))
              (get-row-string tictoc input-string input-string-length)))))

(let* ((input-string "PAYPALISHIRING")
       (row-number 4)
       (input-string-length (length input-string)))
  (apply #'concat
         (mapcar (lambda (curr_row)
                   (let* ((max_delta (* 2 (- row-number 1)))
                          (delta_a (* 2 (1- curr_row)))
                          (delta_b (- max_delta delta_a))
                          (tictoc (create-tictoc (1- curr_row) delta_a delta_b)))
                     (get-row-string tictoc input-string input-string-length)))
                 (number-sequence 1 row-number))))

); leetcode-6
