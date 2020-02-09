(defun mylistLength (listOne)
 (cond
     ((null listOne) 0)
     ((+ 1 (mylistLength (cdr listOne))))
 )
)

(defun reachable (transition start final input)
    ;(setq nextState (funcall 'fooTransitions start (car input)))
    (cond ;if length of input = 0
        ((equal (length input) 0)
              (cond ;nested if, if start == end return true (t), else return false (nil)
                  ((equal final start) t)
                  (t nil)
              )
        )

    ) ;end of cond



    ; (setq nextState (funcall 'fooTransitions start (car input)))
    ; (funcall #'reachable '(transition) '(nextState) '(final) (cdr input))
    (setq nextState (funcall 'fooTransitions start (car input)))
    (print nextState)




)

(defun fooTransitions (state input)
    ;;  * 0 -a-> 1
	;;  * 0 -a-> 2
	;;  * 1 -b-> 3
	;;  * 2 -c-> 3

    (cond
    ((and (eq state 0) (eq input 'A ))  (list 1 2))
    ((and (eq state 0) (eq input 'B ))  (list 2))
    ((and (eq state 1) (eq input 'B ))  (list 3))
    ((and (eq state 2) (eq input 'c ))  (list 3))
    (t (list nil))
    )
)

(print (reachable 'fooTransitions 0 3 '(A B)))
