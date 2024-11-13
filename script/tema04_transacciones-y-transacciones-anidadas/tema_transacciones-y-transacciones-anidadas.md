# Transacciones en Bases de Datos

## ¿Qué son las transacciones?

Las transacciones en bases de datos son operaciones que garantizan la **integridad y consistencia de los datos**. Consisten en una o más instrucciones que se ejecutan de forma secuencial y se consideran una unidad **atómica**, es decir, **la transacción completa o no se realiza en absoluto**.

SQL Server y otros sistemas de gestión de bases de datos relacionales implementan el modelo **ACID** (Atomicidad, Consistencia, Aislamiento y Durabilidad) para asegurar el manejo confiable de las transacciones. Este modelo asegura que los datos se mantengan íntegros incluso en caso de errores o fallos del sistema.

## ¿Qué nos ofrece una transacción?

Una transacción garantiza que todas las operaciones **se completen o se reviertan en su totalidad**. Esto es particularmente útil en operaciones complejas que involucran múltiples instrucciones, ya que, si una instrucción falla, la transacción completa puede revertirse usando la instrucción **ROLLBACK**. Esto asegura que los datos no queden en un estado intermedio o inconsistente.

## ¿Cómo se escriben las transacciones en T-SQL?

En **Transact-SQL (T-SQL)**, se inicia una transacción con `BEGIN TRANSACTION`, se confirma con `COMMIT` y, si ocurre un error, se revierte con `ROLLBACK`. Este enfoque es ampliamente utilizado para **operaciones de inserción, actualización o eliminación de datos** en varias tablas que dependen unas de otras.

## ¿Qué son las transacciones anidadas?

Las **transacciones anidadas** son transacciones dentro de otra transacción. En T-SQL, las transacciones anidadas permiten realizar **múltiples operaciones agrupadas en varios niveles de transacciones**. Cada `BEGIN TRANSACTION` anidado incrementa un contador de nivel de transacción, pero solo la primera transacción iniciada puede realizar un `COMMIT` definitivo.

> **Nota:** Si una transacción anidada interna realiza un `ROLLBACK`, la transacción externa también debe revertirse, garantizando así la consistencia de los datos.

### Ventajas

- Las transacciones aseguran que las operaciones complejas se realicen completamente o no se realicen en absoluto.
- Las transacciones anidadas permiten manejar sub-operaciones dentro de una transacción principal, ofreciendo mayor control y manejo de errores.

### Desventajas

- Las transacciones anidadas pueden dificultar la **depuración** y el manejo de errores en sistemas complejos.
- Un `ROLLBACK` en una transacción anidada provoca la reversión de toda la transacción, lo cual puede no ser siempre el comportamiento deseado.

## Conclusión

Las **transacciones** y las **transacciones anidadas** son herramientas cruciales en el manejo de la consistencia de los datos. El uso adecuado de estas técnicas depende del contexto y de la naturaleza de las operaciones de la base de datos.
