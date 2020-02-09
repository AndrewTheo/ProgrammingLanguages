


 (defun mylistLength (listOne)
  (cond
      ((null listOne) 0)
      ((+ 1 (mylistLength (cdr listOne))))
  )
)

(defun lessThan (n xs)
  (cond
      ((null xs) '())
      ( (> n (car xs)  )  (cons (car xs) (lessThan n (cdr xs))    )    )

      ( (< n (car xs)  )  (lessThan n (cdr xs))        )
      ( (eql n (car xs)  )  (lessThan n (cdr xs))        )
  )
)



(defun greaterThan (n xs)
  (cond
      ((null xs) '())
      ( (< n (car xs)  )  (cons (car xs) (greaterThan n (cdr xs))    )    )

      ( (> n (car xs)  )  (greaterThan n (cdr xs))        )
      ( (eql n (car xs)  )  (cons (car xs) (greaterThan n (cdr xs)))        )
  )
)

; (print (lessThan 8 (list 9)))
; (print (greaterThan 8 (list 9)))




(defun pivot (n xs)
  (list (lessThan n xs) (greaterThan n xs))
)

;(print (pivot 6 '(6 9 5 3 8)))
;
; (print (car (car (pivot 3 '(2 2 3)))))
(defun mycombine (x y)
  (cond
      ((null x) y)
      (t (cons (car x) (mycombine (cdr x) y)))

  )
)


(defun quicksort (xs)
  (cond ;if list is length 1 return the list
      ((null xs) xs)
      ((eql 1 (mylistLength xs)) (list(car xs)))
      (t
          (setq result (pivot (car xs) (cdr xs)))
          (setq left (car result))
          (setq right (car(cdr result)))

          (setq middle (list (car xs)))

          (setq a (mycombine
            (quicksort left)
            (list (car xs))
          ))

          (mycombine a (quicksort right))




      )
  )







)


(print (quicksort '(6 9 5 3 8)))
