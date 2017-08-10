;;; -*- lexical-binding: t; -*-
(require 'cl)
(require 'generator)

(defun palindromicp (xs cache)
  (let ((len (safe-length xs)))
    (cond
     ((= 0 len) t)
     ((= 1 len) t)
     ((gethash xs cache) t)
     (t (let* ((first_elem (car xs))
               (last_elem (car (last xs)))
               (middle_list (cdr (butlast xs 1))))
        (when (and (= first_elem last_elem) (palindromicp middle_list cache))
          (puthash xs t cache)
          t))))))

(defun check_elem (elem_list head_num)
  (let ((sublist (unless (< (safe-length elem_list) head_num)
                   (cl-subseq elem_list 0 head_num))))
    (if (null sublist)
        nil
      (cons sublist (check_elem (cdr elem_list) head_num)))))

(iter-defun iter_num_seq (input num_seq)
  (while num_seq
    (let* ((head_num (car num_seq))
           (elem_list (check_elem input head_num)))
      (while elem_list
        (iter-yield (car elem_list))
        (setq elem_list (cdr elem_list)))
      (setq num_seq (cdr num_seq)))))

(let* ((input '(1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1
                1 2 3 3 2 1 2 1 2 2 1))
       (input_len (safe-length input))
       (num_seq (reverse (number-sequence '1 input_len)))
       (seq_hash (make-hash-table :test 'equal))
       (iter (iter_num_seq input num_seq))
       (iter_val (iter-next iter)))
  (while (unless (palindromicp iter_val seq_hash) t)
    (setq iter_val (iter-next iter)))
  (print iter_val)
  iter_val)
