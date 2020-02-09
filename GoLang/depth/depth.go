package depth

import "hw2/expr"
import "fmt"


// Depth returns the maximum number of AST nodes between the
// root of the tree and any leaf (literal or variable) in the tree.
func Depth(e expr.Expr) uint {
	// TODO: implement this function
	switch e := e.(type) {
	case expr.Literal:
		return 1

	case expr.Var:
		return 1

	case expr.Unary:
	  return(1 + Depth(e.X))

	case expr.Binary:
		a:= Depth(e.X)
		b:= Depth(e.Y)
		if(a > b){
			return 1 + Depth(e.X)
		} else{
			return 1 + Depth(e.Y)
		}



	default:
		panic(fmt.Sprintf("unknown Expr: %T", e))
	}

}
