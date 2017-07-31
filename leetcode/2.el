(setq lc_2_log nil)

(defun lc_2_get_sum_list (xs ys overflow)
  (if (or (null xs) (null ys))
      (if (= overflow 0) nil (list overflow))
    (let* ((sum (+ (car xs) (car ys) overflow))
           (sum_digit (% sum 10))
           (sum_overflow (/ sum 10)))
      (if lc_2_log
          (message "sum %d, overflow %d" sum_digit sum_overflow))
      (cons sum (lc_2_get_sum_list (cdr xs) (cdr ys) sum_overflow)))))

(let* ((x '(2 4 3))
       (y '(5 6 4)))
  (print (lc_2_get_sum_list x y 0)))
