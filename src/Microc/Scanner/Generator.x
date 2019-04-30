{
module Microc.Scanner.Generator where
import Microc.Ast

}

%wrapper "basic"

$alpha = [a-zA-Z]
$digit = 0-9
$newline = [\r\n]

tokens :-
 $white+  ;
 "/*" ( $newline | [^\*] | \*+ ($newline | [^\/]) )* "*/" ;
 "//" [^$newline]* $newline ;
 \(       { const LPAREN   }
 \)       { const RPAREN   }
 \{       { const LBRACE   }
 \}       { const RBRACE   }
 \;       { const LSemi    }
 \,       { const LComma   }
 \+       { const LAdd     }
 \-       { const LSub     }
 \*       { const LMul     }
 \/       { const LDiv     }
 \=       { const LAssign  }
 \=\=     { const LEqual   }
 \!\=     { const LNeq     }
 \<       { const LLess    }
 \<\=     { const LLeq     }
 \>       { const LGreater }
 \>\=     { const LGeq     }
 \&\&     { const LAnd     }
 \|\|     { const LOr      }
 \!       { const LNot     }
 \&       { const LBitAnd  }
 \|       { const LBitOr   }
 \*\*     { const LPow     }
 \.       { const LDot     }
 \-\>     { const LArrow   }
 "if"     { const LIf      }
 "else"   { const LElse    }
 "for"    { const LFor     }
 "while"  { const LWhile   }
 "return" { const LRet     }
 "int"    { const $ LType TyInt   }
 "float"  { const $ LType TyFloat }
 "bool"   { const $ LType TyBool  }
 "void"   { const $ LType TyVoid  }
 "struct" { const LStruct }
 "true"   { const $ LBool True    }
 "false"  { const $ LBool False   }
 "NULL"   { const (LInt 0)}
 $digit+  { \s -> LInt (read s) }
 $digit+ \. $digit* ( [eE] [\+\-]? $digit+ )? { \s -> LFloat (read s) }
 $alpha [$alpha $digit \_]* { \s -> LId s }

{
data Lexeme = LInt Int
            | LFloat Double
            | LId String
            | LType Type
            | LStruct
            | LBool Bool
            | LRet
            | LAssign
            | LComma
            | LSemi
            | LPAREN
            | RPAREN
            | LBRACE
            | RBRACE
            | LBRACK
            | RBRACK
            | LFor
            | LWhile
            | LIf
            | LElse
            | LAdd
            | LSub
            | LMul
            | LDiv
            | LEqual
            | LNeq
            | LLess
            | LLeq
            | LGreater
            | LGeq
            | LAnd
            | LOr
            | LNot
            | LBitAnd
            | LBitOr
            | LPow
            | LDot
            | LArrow
            }
