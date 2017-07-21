(setq uva_100_log nil)

(defun uva_100_get_depth (number tables)
  "Search number from depth tables, and if not exist, calc depth and add it to tables."
  (let* ((get_nextnumber (lambda (n) (if (= (mod n 2) 0)
                                         (/ n 2)
                                       (+ (* n 3) 1))))
         (next_num (funcall get_nextnumber number))
         (curr_depth (assoc number (eval tables))))
    (if curr_depth
        (progn
          (if uva_100_log
              (message "%d cached! %d" next_num (cdr curr_depth)))
          (cdr curr_depth)
          )
      (let* ((next_depth (uva_100_get_depth next_num tables))
             (depth (+ next_depth 1)))
        (add-to-list tables `(,number . ,depth))
        (if uva_100_log
            (message "%d depth : %d" number depth))
        depth
        )
      )
    )
  )

(let* ((depth_caches '((1 . 1)))
       (samples '((1 10)(100 200)(201 210)(900 1000)))
       (get_depth (lambda (x)
                        (uva_100_get_depth x 'depth_caches))))
  (mapcar
   (lambda (range)
     (let* ((begin (nth 0 range))
            (end (nth 1 range))
            (num_seq (number-sequence begin end))
            (depth_list (mapcar get_depth num_seq))
            (max_depth (apply 'max depth_list)))
       (message "%d %d %d" begin end max_depth)
       )
     )
   samples
   )
  )
