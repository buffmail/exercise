
(defun leetcode_3_show_uniq_char (xs char_table)
  (let ((x (car xs)))
    (cond
     ((null x) nil)
     ((gethash x char_table) (show_uniq_char (cdr xs) char_table))
     (t (progn
          (puthash x t char_table)
          (cons x (leetcode_3_show_uniq_char (cdr xs) char_table)))))))

(let ((inputs '((a b c a b c b b) (b b b b b) (p w w k e w))))
  (mapcar (lambda (input)
            (leetcode_3_show_uniq_char input (make-hash-table)))
          inputs))
