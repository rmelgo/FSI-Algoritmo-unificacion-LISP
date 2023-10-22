(defun unificar(e1 e2)
	(prog (f1 f2 t1 t2 g1 g2 z1 z2) 
		
		(when (or (atomo e1) (atomo e2)) ;Comprobamos si e1 o e2 es un atomo		
			(if (atomo e1) ;Si e1 o e2 es un atomo comprobamos si e1 es un atomo para decidir si hay que intercambiar e1 con e2 o no
				(return-from unificar (comprobaciones e1 e2)) ;En el caso de que e1 sea atomo no hay que intercambiar e1 con e2 y llamamos a la funcion de comprobar
				(return-from unificar (comprobaciones e2 e1)) ;En caso de que e1 no sea un atomo entonces e2 lo es y hay que intercambiar por lo que llamamos a la funcion de comprobar con los parametros intercambiados 
			)					
		)
				
		(setf f1 (first e1)) ;Obtenemos el primer elemento de e1
		(setf t1 (rest e1))  ;Obtenemos el resto de e1
		(setf f2 (first e2)) ;Obtenemos el primer elemento de e2
		(setf t2 (rest e2))  ;Obtenemos el resto de e2
		
		(setf z1 (unificar f1 f2)) ;llamada recursiva a unificar
		(when (equalp z1 NIL) ;comprobamos si z1 es fallo 
			(return-from unificar NIL) ;si es asi devolvemos fallo
		)
				
		(setf g1 (aplicar z1 t1)) ;aplicamos z1 sobre t1
		(setf g2 (aplicar z2 t2)) ;aplicamos z2 sobre t2
		
		(setf z2 (unificar g1 g2)) ;llamada recursiva a unificar
		(when (equalp z2 NIL) ;comprobamos si z2 es fallo ;
			(return-from unificar NIL) ;si es asi devolvemos fallo
		)
				
		(return-from unificar (componer z1 z2)) ;realizamos la composicion de z1 y z2 y devolvemos su resultado
	)
)



