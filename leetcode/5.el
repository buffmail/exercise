;;; -*- lexical-binding: t; -*-

(defun palindromicp (xs cache)
  (let ((len (safe-length xs)))
    (cond
     ((= 0 len) t)
     ((= 1 len) t)
     ((gethash xs (symbol-value cache)) t)
     (t (let* ((first_elem (car xs))
               (last_elem (car (last xs)))
               (middle_list (cdr (butlast xs 1))))
        (when (and (= first_elem last_elem) (palindromicp middle_list cache))
          (puthash xs t (symbol-value cache))
          t))))))

(defun check_elem (elem_list head_num)
  (let ((sublist (unless (< (safe-length elem_list) head_num)
                   (subseq elem_list 0 head_num))))
    (if (null sublist)
        nil
      (cons sublist (check_elem (cdr elem_list) head_num)))))

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
       (num_seq (number-sequence '1 input_len))
       (seq_hash (make-hash-table :test 'equal))
       (all-sub-list
        (mapcan (lambda (head_num) (check_elem input head_num))
                num_seq)))
  (print (remove-if (lambda (elem) (unless (palindromicp elem 'seq_hash) t))
          all-sub-list)))
