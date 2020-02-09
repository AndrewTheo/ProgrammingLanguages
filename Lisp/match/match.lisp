(defun mylistLength (listOne)
 (cond
     ((null listOne) 0)
     ((+ 1 (mylistLength (cdr listOne))))
 )
)

(defun match (pattern assertion)
  (setq questionMark '(?))
  (setq exclamation '(!))
  (cond
      ((null pattern)
         (cond
             ((null assertion) t)
             (t nil)

         )
      )

      ((null assertion)
          (cond
              ((null pattern) t)
              (t nil)

          )
      )

      ((eql (car pattern) (car assertion))
         (match (cdr pattern) (cdr assertion))
      )


      ((eql (car pattern) (car questionMark))
         (match (cdr pattern) (cdr assertion))
      )



      ((eql (car pattern) (car exclamation))
          (cond
              ((eql (mylistLength pattern) 1) t)
              (t (match (cdr pattern) (cdr assertion)))
          )
      )


  )

)
