(defun componer (lista1 lista2) ;funcion que compone las listas e1 y e2 en una lista e1e2
	(prog (lista_salida)
		(when (equalp lista1 '(0)) ;se evalua si en la lista1 no haya nada
			(return-from componer lista2) ;en el caso de que en la lista1 no haya nada, el resultado de la composicion es la lista2 por lo que la devolvemos directamente
		)
		
		(when (equalp lista2 '(0)) ;se evalua si en la lista2 no haya nada
			(return-from componer lista1) ;en el caso de que en la lista2 no haya nada, el resultado de la composicion es la lista1 por lo que la devolvemos directamente
		)
		
		(setf lista_salida (componer_paso1 lista1 lista2)) ;llamamos al primer paso de la composicion
		(return-from componer (componer_paso2 lista2 lista_salida)) ;llamamos al segundo paso de la composicion y devolvemos el resultado de la composicion
	)
)

(defun componer_paso1 (lista1 lista2) ;funcion que aplica z2 sobre los sustitutos de z1 y añade el resultado en z1z2
	(prog (sustituto lista_temp lista_salida)
		
		(when (endp lista1) ;se comprueba si la lista1 esta vacia
			(return-from componer_paso1 '()) ;en el caso de que la lista1 este vacia, se devuelve la lista vacia
		)
		
		(setf sustituto (first lista1)) ;se extrae el primer elemento de la lista1
		(setf lista_temp (rest (rest (rest lista1)))) ;se extrae la primera sustitucion de la lista1
			
		(setf lista_salida (append (aplicar lista2 (list sustituto)) (append (list (first (rest lista1))) (list (first (rest (rest lista1)))))))
		;se aplica lista2 sobre el sustituto de lista1 y se añade la primera sustitucion a z1z2
			
		(componer_paso1 lista_temp lista2) ;se llama recursivamente a componer_paso1 excluyendo la primera sustitucion de la lista1
		
		(return-from componer_paso1 lista_salida) ;delvolvemos la lista de salida con el resultado del paso1 de la composicion
	)
)

(defun componer_paso2 (lista2 lista12) ;funcion que recorre los sustituidos de z2 y si ya estan en z1z2 los ignora y si no estan los añade
	(prog (sustituido lista_temp lista_salida)
		
		(when (endp lista2) ;se comprueba si la lista2 esta vacia
			(return-from componer_paso2 lista12) ;en el caso de que la lista2 este vacia, se devuelve la lista12
		)
		
		(setf sustituido (first (rest (rest lista2)))) ;se extrae el primer sustituido de la lista2
		(setf lista_temp (rest (rest (rest lista2)))) ;se extrae la primera sustitucion de la lista2
		(setf lista_salida lista12) ;se establece la lista12 como lista de salida
		
		(unless (esmiembro sustituido lista12) ;se comprueba si el sustituido se encuentra en la lista12
			(setf lista_salida (append lista12 (list (first lista2)) (list (first (rest lista2))) (list (first (rest (rest lista2)))))) 
			;en el caso de que el sustituido no se encuentra en la lista12, se añade la sustitucion en lista12
		)
			
		(return-from componer_paso2 (componer_paso2 lista_temp lista_salida)) ;se llama recursivamente a componer_paso2 excluyendo la primera sustitucion de la lista2 y con la nueva lista12 (en el caso de que haya cambiado) ;delvolvemos el resultado del paso2 de la composicion
	)
)
