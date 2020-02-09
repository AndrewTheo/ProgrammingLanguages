


(defun getFirst (m)
  (cond
      ((null m) '())
      (t (cons (car (car m)) (getFirst (cdr m))))
  )
)


(defun removeFirstElements (m)
  (cond
      ((null m) '())
      (t (cons (cdr (car m)) (removeFirstElements (cdr m))))
  )
)


(defun matrix-add (m1 m2)
  (cond
      ((null m1) '())
      (t  (cons (mapcar #'+ (car m1) (car m2)) (matrix-add (cdr m1) (cdr m2))    )    )
  )
)


(defun helper (x y)
  (cond
      ((null y) '())
      ((null x) '()) ;added later
      (t (cons (dotproduct x (car y)) (helper x (cdr y))))
  )
)

;helper for removeFlist
(defun removeF (a)
    (cdr a)
)

;removes first element from each list in list
(defun removeFlist (a)
    (cond
        ((null a) '())
        (t (cons (removeF (car a)) (removeFlist(cdr a)) ))
    )


)

(defun dotproduct(a b)
    (cond
        ((and (null a) (null b)) 0)
        (t (+ (* (car a) (car b) ) (dotproduct (cdr a) (cdr b))))
    )
)

;returns first number in each row
(defun getCol (x)
  (cond
      ((null x) '())
      (t (cons (car(car x)) (getCol (cdr x))))
  )
)



(defun listofCol (a)
  (cond
      ((null (car a)) '())
      (t (cons (getCol a) (listofCol (removeFlist a))))
  )
)



(defun matrix-multiplyHelper (a b)
    (cond
        ((null b) '())
        (t (cons (dotproduct (car a) (car b)) (matrix-multiplyHelper a (cdr b))))
    )

)

(defun matrix-multiply (a b)
  (cond
      ((null a) '())
      (t (cons (matrix-multiplyHelper a (listofCol b)) (matrix-multiply (cdr a) b)))
  )
)

(defun matrix-transpose (m)
  (cond
      ((null (car m)) '())
      (t (cons (getFirst m) (matrix-transpose (removeFirstElements m))))
  )
)
