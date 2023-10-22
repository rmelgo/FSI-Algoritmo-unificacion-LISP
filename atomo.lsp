(defun atomo(var) ;;se utiliza la sentencia cond que evalua multiples condiciones
	(cond ((atom var) T) ;;en primer lugar si la funcion atom de LISP da true entonces se devuelve true
		((eq(first var) '?) T) ;;en segundo lugar, si la funcion atom de LISP no da true (si no hubieramos salido al evaluar la primera condicion) entonces se extrae el primer elemento de var (al no ser un atomo se entiende que es una lista) y se compruebasi es igual a ?. Si son iguales se devuelve true
		(T NIL))) ;;si no se cumplen ninguna de las 2 condiciones entonces se devuelve NIL (recordamos que con t marcamos la opcion por defecto (default de c))
 
