package rewrite

import (
	"bytes"
	"go/ast"
	"go/format"
	"go/parser"
	"go/token"
)


import "strconv"
import "hw2/expr"
import "hw2/simplify"


// rewriteCalls should modify the passed AST
func rewriteCalls(node ast.Node) {
	//TODO Write the rewriteCalls function
	ast.Inspect(node, func (node ast.Node) bool {
			switch v := node.(type) {
				//Find CallExpr
			case *ast.CallExpr:
				switch fun := v.Fun.(type) {
					//Find the Selector Expr since expr.ParseAndEval
				case *ast.SelectorExpr:
					if fun.Sel.Name == "ParseAndEval" {
						//fmt.Println(len(v.Args))
						//Make sure the CallExpr has the two arguments
						if len(v.Args) != 2 {
							return false
						}
						//v.Args[0] is first argument
						lit, ok := v.Args[0].(*ast.BasicLit)
						//IF first argument is a BasicLit and is a String Literal
						if ok && lit.Kind == token.STRING {
							//lit = type of BasicLit
							u := lit.Value
							//Unquote the arguments value
							u, _ = strconv.Unquote(u)
							// a is now an expr after the parse
							a, error := expr.Parse(u)
							// if no errors in the parsing
							if error == nil {
								//Simplify a using the simplify created earlier
								a = simplify.Simplify(a, expr.Env{})
								//a is equal to the resulting expr.Expr
								// Need to change a from expr.Expr back to a string
								c := expr.Format(a)
								// c is now the string
								//Put Quotes back onto the string
								c = strconv.Quote(c)
								//Change the argument value to the simplified string
							  lit.Value = c
								//return true since we successfully changed the argument

								return true

							}
							return false


						}
					}
				}
			}

  return true
	})

}

func SimplifyParseAndEval(src string) string {
	fset := token.NewFileSet()
	f, err := parser.ParseFile(fset, "src.go", src, 0)
	if err != nil {
		panic(err)
	}

	rewriteCalls(f)

	var buf bytes.Buffer
	format.Node(&buf, fset, f)
	return buf.String()
}
