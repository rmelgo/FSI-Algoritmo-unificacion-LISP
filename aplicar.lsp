(defun aplicar (lista_sustituta lista_sustituida) ;funcion que aplica las susticiones que se encuetran en lista_sustituta en los elementos de lista_sustituida
	(prog (lista_temp lista_salida primer_elemento)
			
		(when (endp lista_sustituida) ;comprobamos si la lista donde se van a realizar las sustituciones esta vacia
			(return-from aplicar '()) ;en el caso de que la lista donde se van a realizar las sustituciones esta vacia devolvemos la lista vacia
		)
		
		(setf primer_elemento (first lista_sustituida)) ;extraemos el primer elemento a sustituir y lo almacenamos en una variable local

		(when (listp primer_elemento) ;comprobamos si el primer elemento a sustituir es una lista
			(unless (equalp (first primer_elemento) '?) ;comprobamos si el primer elemento a sustituir es una variable (ya que en nuestra implementacion es una lista)
				(setf primer_elemento (aplicar lista_sustituta primer_elemento)) 
				;si el primer elemento a sustituir es una lista, llamamos recursivamente a aplicar utilizando como parametro este primer elemento (que es una lista)
			)
		)
			
		(setf lista_temp (esmiembro primer_elemento (reverse lista_sustituta))) ;comprobamos si el primer elemento esta en la lista de sustituciones

		(when (equalp lista_temp NIL) ;comprobamos si existe alguna sustitucion para el primer elemento
			(setf lista_salida (cons primer_elemento (aplicar lista_sustituta (rest lista_sustituida)))) 
			;si no existe ninguna sustitucion para el elemento lo añadimos a la lista de salida y lo concatenamos con el resto de elementos "aplicados" llamando recursivamente a aplicar excluyendo el primer elemento de la lista donde se realizan las sustituciones
		)
				
		(if (equalp (first (rest lista_temp)) '/) ;si el primer elemento esta en la lista de sustituciones entonces comprobamos si es un sustituto o un sustituido
			(setf lista_salida (cons (first (rest (rest lista_temp))) (aplicar lista_sustituta (rest lista_sustituida))))
			;si es un sustituido entonces existe una sustitucion para el elemento. De esta manera, añadimos su sustitucion a la lista de salida y lo concatenamos con el resto de elementos "aplicados" llamando recursivamente a aplicar excluyendo el primer elemento de la lista donde se realizan las sustituciones
			(setf lista_salida (cons primer_elemento (aplicar lista_sustituta (rest lista_sustituida)))) 
			;si es un sustituto entonces no existe ninguna sustitucion para el elemento. De esta manera, lo añadimos a la lista de salida y lo concatenamos con el resto de elementos "aplicados" llamando recursivamente a aplicar excluyendo el primer elemento de la lista donde se realizan las sustituciones
		)
			
		(return-from aplicar lista_salida) ;devolvemos la lista de salida (con las sustituciones realizadas)	
	)
)
