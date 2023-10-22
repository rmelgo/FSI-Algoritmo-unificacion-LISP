(defun comprobaciones (e1 e2) ;esta funcion realiza todas las comprobaciones necesarias en el caso de que e1 o e2 sean un atomo (lineas 2-12 del algoritmo)
	(prog ()	
		(when (equalp e1 e2) ;se comprueba si e1 y e2 son iguales
			(return-from comprobaciones '(0)) ;si e1 y e2 son iguales devolvemenos nada que en este caso lo representamos con una lista con un 0
		)						
		(when (listp e1) ;comprobamos si e1 es una variable. Si e1 no es una lista entonces es imposible que sea una variable
			(when (equalp(first e1) '?) ;comprobamos si el pirmer elemento de e1 es un ?. En caso afirmativo, e1 es una variable
				(when (listp e2) ;comprobamos si e2 es una lista. Si no lo es, es imposible que e1 este contenido en e2
					(if (esmiembro e1 e2) ;comprobamos si e1 esta incluido dentro de e2 
					;para ello utilizamos la funcion esmiembro que verifica que el primer argumento forme parte del segundo y devuelve lo que queda de la lista (similar a member)
						(return-from comprobaciones NIL) ;si e1 esta incluido en e2 (la funcion esmiembro no devuelve NIL) entonces devolvemos fallo								
						(return-from comprobaciones (append (list e2) '(/) (list e1))) ;si e1 no esta incluido en e2 (la funcion esmiembro devuelve NIL) entonces devolvemos e2 / e1			
					)
				)			
				(return-from comprobaciones (append (list e2) '(/) (list e1))) ;si e1 no esta incluido en e2 (la funcion esmiembro devuelve NIL) entonces devolvemos e2 / e1					
			)
		)
		(when (listp e2) ;comprobamos si e2 es una variable. Si e2 no es una lista entonces es imposible que sea una variable
			(when (equalp(first e2) '?) ;comprobamos si el pirmer elemento de e2 es un ?. En caso afirmativo, e2 es una variable
					(return-from comprobaciones (append (list e1) '(/) (list e2))) ;si e2 es una variable devolvemos e1 / e2	
			)				
		)
		(return-from comprobaciones NIL) ;si no hemos tenido exito en ninguna de las comprobaciones anteriores devolvemos fallo
	)
)

(defun esmiembro (e1 e2) ;funcion que recibe un elemento y una lista y verifica que el primer argumento forme parte del segundo y devuelve lo que queda de la lista (similar a member)
	(prog ()	
		(unless (listp e2) ;comprobamos que e2 es una lista	
			(return-from esmiembro NIL) ;en el caso de que e2 no sea lista, devolvemos fallo
		)
		
		(when (endp e2) ;si e2 se vacia y no hemos encotrado ningun elemento de e2 que coicida con e1 se devuelve fallo
			(return-from esmiembro NIL) 
		)
		
		(if (equalp e1 (first e2)) ;comprobamos si el primer elemento de la lista e2 es igual a e1
			(return-from esmiembro e2) ;si el primer elemento de e2 es igual que e1, devolvemos e2
			(return-from esmiembro (esmiembro e1 (rest e2))) ;si el primer elemento de e2 no es igual que e1, llamamos recursivamente a esmiembro con e1 y el resto de elementos de e2 (que aun no hemos comprobado) y devolvemos el resultado
		)		
	)
)

