(defun min-mean-max (xs)
    (cond
      ((null xs) 0)
     )
    (list (minn xs)   (/ (apply '+ xs) (length xs)) (maxx xs))
)

(defun minn (nlist)
    (cond
        ( (equal (length nList) 1) (car nList))
        ( (> (car nList) (minn (cdr nList))  )  (minn (cdr nList)))
        ( (< (car nList) (minn (cdr nList))  ) (car nList) )
        ( (equal (car nList) (minn (cdr nList)) ) (car nList) )
    )
)

(defun maxx (nlist)
    (cond
        ((equal (length nList) 1) (car nList))
        ( (< (car nList) (maxx (cdr nList))  )  (maxx (cdr nList)))
        ( (> (car nList) (maxx (cdr nList))  ) (car nList) )
        ( (equal (car nList) (maxx (cdr nList)) ) (car nList) )
    )
)
