--OBTENER TODOS LOS VUELOS PROGRAMADOS PARA UNA FECHA EN ESPECIFICA PRIMERO
SELECT FECHA_SALIDA, FECHA_LLEGADA FROM VUELO 
WHERE (DAY(FECHA_SALIDA) = 17 AND MONTH(FECHA_SALIDA) = 05)
OR (DAY(FECHA_SALIDA) = 17 AND MONTH(FECHA_SALIDA) = 06)

--MOSTRAR TODOS LOS TRIPULANTES ASIGNADOS A UN VUELO DETERMINADO
SELECT *
FROM TRIPULANTE T JOIN VUELO V
ON T.COD_VUELO = V.COD_VUELO
WHERE T.COD_VUELO = 7


--ENCONTRAR TODOS LOS EQUIPAJES REGSTRADOS PARA UN PASAJERO EN PARTICULAR
--SIN RESULTADOS

--LISTAR TODOS LOS AVIONES DE UNA DETERMINADA MARCA
SELECT A.COD_AVION, M.COD_MARCA, M.DESCRIPCION
FROM AVION A, MARCA M
WHERE M.COD_MARCA = 5

SELECT A.COD_AVION, M.COD_MARCA, M.DESCRIPCION
FROM AVION A JOIN MARCA M 
ON A.COD_MARCA = M.COD_MARCA
WHERE M.COD_MARCA = 5


--MOSTRAR LA CAPACIDAD DE PASAJEROS DE TODOS LOS AVIONES
SELECT A.COD_AVION AS 'CODIGO_DEL_AVION', A.DESCRIPCION AS 'DESCRIPCION_DEL_AVION', A.PESO_CARGA_MAX AS 'CAPACIDAD_MAXIMA' 
FROM AVION A


--ENCONTRAR TODOS LOS BOLETOS EMITIDOS PARA UN VUELO EN PARTICUAL
SELECT V.COD_VUELO AS 'VUELOS', B.COD_BOLETO AS 'BOLETOS'
FROM VUELO V JOIN BOLETO B
ON V.COD_VUELO = B.COD_VUELO
WHERE V.COD_VUELO = 1


--OBTENER EL TOTAL DE FACTURAS GENERADAS EN UN PERIODO DE TIEMPO ESPECIFICO
SELECT COUNT(1) AS 'TOTAL_FACTURAS'
FROM FACTURA 
WHERE FECHA_FACTURA BETWEEN '2023-01-01' AND '2023-02-01'



--8MOSTRAR LOS DETALLES DE UNA FACTURA ESPECIFICA, INCLUYENDO LOS BOLETOS ASOCIADOS
SELECT * FROM FACTURA

DECLARE @NUMFACTURA INT = 1815200
SELECT F.COD_FACTURA AS 'FACTURA_CLIENTE', 
F.COD_CLIENTE AS 'COD_CLIENTE', 
F.FECHA_FACTURA AS 'FECHA_FACTURA', 
F.NIT AS 'NIT_CLIENTE', 
C.NOMBRE AS 'NOMBRE_CLIENTE', 
DF.COD_BOLETO AS 'BOLETO_CLIENTE',
DF.PRECIO AS 'PRECIO_BOLETO'
FROM DETALLE_FACTURA DF JOIN FACTURA F 
ON F.COD_FACTURA = DF.COD_FACTURA JOIN CLIENTE C ON C.COD_CLIENTE = F.COD_CLIENTE
WHERE F.COD_FACTURA = @NUMFACTURA


--9. Mostrar los empleados que no son tripulantes.
SELECT E.COD_EMPLEADO AS 'CODIGO_EMPLEADO',
E.DPI AS 'DPI_EMPLEADO',
E.FECHA_NACIMIENTO AS 'CUMPLEA�OS',
E.NOMBRE AS 'NOM_EMPLEADO',
E.TELEFONO AS 'TELEFONO',
E.CORREO AS 'CORREO',
E.PASAPORTE AS 'PASAPORTE',
E.SEGURO_SOCIAL AS 'SEGURO_SOCIAL'
FROM TRIPULANTE T RIGHT JOIN EMPLEADO E
ON T.COD_EMPLEADO = E.COD_EMPLEADO
WHERE T.COD_EMPLEADO IS NULL


--10. Listar todos los pa�ses donde opera la aerol�nea.
SELECT DISTINCT P.NOMBRE AS 'PAIS'
FROM PAIS P JOIN CIUDAD C ON P.COD_PAIS = C.COD_PAIS
JOIN AEROPUERTO A ON A.COD_CIUDAD = C.COD_CIUDAD
JOIN VUELO V ON V.COD_AEROPUERTO_ORIGEN = A.COD_AEROPUERTO


--11. Encontrar todas las ciudades donde hay terminales de la aerol�nea.
SELECT DISTINCT C.NOMBRE AS 'NOMBRE' 
FROM AEROPUERTO A JOIN CIUDAD C 
ON C.COD_CIUDAD = A.COD_CIUDAD
WHERE A.COD_TERMINAL IS NOT NULL


--12. Mostrar todos los vuelos que salen de una ciudad espec�fica.
DECLARE @NOMCIUDAD VARCHAR(50) = 'Astrakhan'
SELECT C.NOMBRE AS 'NOMBRE_CIUDAD', 
V.COD_VUELO AS 'VUELOS_SALIDA'
FROM CIUDAD C JOIN AEROPUERTO A ON C.COD_CIUDAD = A.COD_CIUDAD
JOIN VUELO V ON V.COD_AEROPUERTO_ORIGEN = A.COD_AEROPUERTO
WHERE C.NOMBRE LIKE @NOMCIUDAD

SELECT * FROM CIUDAD 

--13. Encontrar todos los pasajeros que han volado en una clase determinada.
DECLARE @CLASE VARCHAR(50) = 'BUSSINES'
SELECT * FROM PASAJERO P 
JOIN BOLETO B ON P.COD_PASAJERO = B.COD_PASAJERO
JOIN CLASE C ON B.COD_CLASE = C.COD_CLASE
WHERE C.TIPO = @CLASE

SELECT * FROM CLASE


--14. Obtener todos los boletos comprados por un cliente en particular.
DECLARE @CPARTICULAR INT = 103 
SELECT  C.COD_CLIENTE AS 'CLIENTE' ,B.COD_BOLETO AS 'BOLETOS_DEL_CLIENTE' FROM CLIENTE C 
JOIN PASAJERO P ON C.COD_CLIENTE = P.COD_CLIENTE
JOIN BOLETO B ON P.COD_PASAJERO = B.COD_PASAJERO
WHERE C.COD_CLIENTE = @CPARTICULAR


--15. Mostrar todos los vuelos programados para una terminal de salida espec�fica.
SELECT V.COD_AEROPUERTO_DESTINO AS 'VUELOS_SALIDA' FROM TERMINAL T 
JOIN AEROPUERTO A ON T.COD_TERMINAL = A.COD_TERMINAL
JOIN VUELO V ON A.COD_AEROPUERTO = V.COD_AEROPUERTO_DESTINO
WHERE T.COD_TERMINAL = 50


--16. Encontrar todos los vuelos que aterrizan en una pista espec�fica.
SELECT P.COD_PISTA, V.COD_AEROPUERTO_DESTINO, V.COD_VUELO FROM VUELO V 
JOIN AEROPUERTO A ON V.COD_AEROPUERTO_DESTINO = A.COD_AEROPUERTO
JOIN PISTA P ON A.COD_PISTA = P.COD_PISTA
WHERE P.COD_PISTA = 3351

--17. Obtener todos los equipajes que exceden un peso determinado.
SELECT * FROM EQUIPAJE
SELECT * FROM TIPO
SELECT * FROM ESTELA

SELECT * FROM FACTURA
SELECT * FROM DETALLE_FACTURA

--18. Mostrar todos los vuelos programados para una hora de salida espec�fica.
DECLARE @HORASAL INT = 17
SELECT * 
FROM VUELO 
WHERE DATEPART(HOUR, HORA_SALIDA) = @HORASAL


--19. Encontrar todos los vuelos que han sido operados por un tipo espec�fico de avi�n.
SELECT * FROM VUELO
SELECT * FROM AVION

SELECT V.COD_VUELO AS 'VUELOS', A.DESCRIPCION AS 'TIPO_AVION' FROM VUELO V 
JOIN AVION A ON V.COD_AVION = A.COD_AVION
WHERE A.COD_AVION = 2071

--20. Obtener todos los vuelos con estado "ON TIME".
SELECT * FROM VUELO
SELECT * FROM ESTADO
SELECT V.COD_VUELO AS 'VUELO', V.COD_ESTADO AS 'ESTADO' FROM VUELO V
JOIN ESTADO E ON V.COD_ESTADO = E.COD_ESTADO
WHERE V.COD_ESTADO = 2


--21. Encontrar todos los vuelos que llegan a una ciudad espec�fica.
SELECT V.COD_VUELO FROM VUELO V
JOIN AEROPUERTO A ON V.COD_AEROPUERTO_DESTINO = A.COD_AEROPUERTO
JOIN CIUDAD C ON A.COD_CIUDAD = C.COD_CIUDAD
WHERE C.NOMBRE = 'Astrakhan'


--22. Mostrar todos los pasajeros que han volado en un vuelo concreto.
SELECT V.COD_VUELO AS 'VUELO', P.COD_PASAJERO AS 'PASAJEROS' FROM VUELO V 
JOIN BOLETO B ON V.COD_VUELO = B.COD_VUELO
JOIN PASAJERO P ON B.COD_PASAJERO = P.COD_PASAJERO
WHERE V.COD_VUELO = 59

--23. Obtener todos los vuelos que salen de una terminal de salida en particular.
SELECT * FROM VUELO
SELECT * FROM AEROPUERTO
SELECT * FROM TERMINAL

SELECT V.COD_VUELO, T.COD_TERMINAL FROM VUELO V 
JOIN AEROPUERTO A ON V.COD_AEROPUERTO_ORIGEN = A.COD_AEROPUERTO
JOIN TERMINAL T ON A.COD_TERMINAL = T.COD_TERMINAL
WHERE T.COD_TERMINAL = 2927


--24. Encontrar todos los vuelos que llegan a una terminal de llegada en particular.
SELECT V.COD_VUELO, T.COD_TERMINAL FROM VUELO V 
JOIN AEROPUERTO A ON V.COD_AEROPUERTO_DESTINO = A.COD_AEROPUERTO
JOIN TERMINAL T ON A.COD_TERMINAL = T.COD_TERMINAL
WHERE T.COD_TERMINAL = 2927

--25. Mostrar todos los vuelos que han sido operados por un tripulante espec�fico.
SELECT * FROM TRIPULANTE
SELECT * FROM ACCESO
SELECT * FROM EMPLEADO
SELECT * FROM VUELO
SELECT * FROM AVION
SELECT * FROM TRIPULANTE

--pendiente


--26. Encontrar todos los vuelos que operan en un rango horario determinado.
SELECT *
FROM VUELO
WHERE HORA_SALIDA BETWEEN '02-11-00' AND '04-04-00'


--27. Obtener todos los vuelos que han sido cancelados.
SELECT * 
FROM VUELO
WHERE COD_ESTADO = 3


--28. Mostrar todos los tipos de fuselaje disponibles en la flota de aviones.
SELECT * FROM AVION, TIPO_FUSELAJE
SELECT * FROM TIPO_FUSELAJE
SELECT * FROM AVION

SELECT A.COD_AVION, A.DESCRIPCION, T.DESCRIPCION FROM AVION A
JOIN TIPO_FUSELAJE T ON A.COD_TIPO_FUSELAJE = T.COD_TIPO_FUSELAJE


--29. Encontrar todos los tipos de motor utilizados en los aviones.

SELECT A.DESCRIPCION, TM.DESCRIPCION FROM AVION A 
JOIN TIPO_MOTOR TM 
ON A.COD_TIPO_MOTOR = TM.COD_TIPO_MOTOR



--30. Obtener todos los tipos de tren de aterrizaje utilizados en los aviones.

SELECT A.COD_AVION AS 'NUM_AVION',
A.DESCRIPCION AS 'NOM_AVION',
TA.DESCRIPCION AS 'TIPO_TREN_ATERRIZAJE'
FROM AVION A
JOIN TREN_ATERRIZAJE TA ON A.COD_TREN_ATERRIZAJE = TA.COD_TREN_ATERRIZAJE


--31. Mostrar todas las estelas que pueden ser generadas por los aviones.
SELECT A.COD_AVION AS 'COD_AVION', 
A.DESCRIPCION AS 'DESC_AVION', 
E.DESCRIPCION AS 'ESTELAS' FROM AVION A 
JOIN ESTELA E ON A.COD_ESTELA = E.COD_ESTELA


--32. Encontrar todas las posiciones de ala utilizadas en los aviones.

SELECT A.COD_AVION, A.DESCRIPCION, PA.DESCRIPCION FROM AVION A
JOIN POSICION_ALA PA ON A.COD_POSICION_ALA = PA.COD_POSICION_ALA
ORDER BY PA.DESCRIPCION


--33. Obtener todos los pa�ses donde hay aeropuertos operados por la aerol�nea.

SELECT P.COD_PAIS AS 'COD_PAIS', 
P.NOMBRE AS 'NOMBRE_PAIS',
A.COD_AEROPUERTO AS 'COD_AEROPUERTO', 
A.NOMBRE AS 'NOMBRE_AEROPUERTO' FROM AEROPUERTO A
JOIN CIUDAD C ON A.COD_CIUDAD = C.COD_CIUDAD
JOIN PAIS P ON P.COD_PAIS = C.COD_CIUDAD
ORDER BY P.COD_PAIS

--34. Mostrar todos los vuelos que han sido retrasados.
SELECT V.COD_VUELO AS 'COD_VUELO', 
V.COD_AVION AS 'AVION_NUM', 
E.NOMBRE AS 'ESTADO_VUELO' FROM VUELO V 
JOIN ESTADO E ON V.COD_ESTADO = E.COD_ESTADO
WHERE E.NOMBRE = 'DELAY'


--35. Encontrar todos los vuelos que tienen disponible una cantidad espec�fica de asientos.
DECLARE @NUMASI INT = 64
SELECT V.COD_VUELO, COUNT(B.N_ASIENTO) AS CANTIDAD_ASIENTOS
FROM BOLETO B
JOIN VUELO V ON V.COD_VUELO = B.COD_VUELO
GROUP BY V.COD_VUELO
HAVING COUNT(B.N_ASIENTO) = @NUMASI
ORDER BY V.COD_VUELO


--36. Obtener todos los boletos comprados en una fecha espec�fica.
DECLARE @FECHA DATE = '2022-10-21'
SELECT B.*, F.FECHA_FACTURA FROM FACTURA F
JOIN DETALLE_FACTURA DF ON F.COD_FACTURA = DF.COD_FACTURA
JOIN BOLETO B ON DF.COD_BOLETO = B.COD_BOLETO
WHERE F.FECHA_FACTURA = @FECHA


--37. Mostrar todos los clientes que han volado en un vuelo determinado.
SELECT * FROM CLIENTE C 
JOIN PASAJERO P ON C.COD_CLIENTE = P.COD_CLIENTE
JOIN BOLETO B ON B.COD_PASAJERO = B.COD_PASAJERO
WHERE B.COD_VUELO = 10


--38. Encontrar todos los vuelos que tienen un determinado estado de vuelo.
DECLARE @ESTADO INT = 1
SELECT * FROM VUELO
WHERE COD_ESTADO = @ESTADO

--39. Obtener todos los equipajes que no han sido reclamados.
SELECT * FROM EQUIPAJE
SELECT * FROM PASAJERO
--NO SE PUEDE


--40. Mostrar todos los vuelos que est�n programados para despegar en un d�a determinado de la semana.
DECLARE @SEMANA INT = 15
DECLARE @DIA INT = 3
SELECT *
FROM VUELO
WHERE DATEPART(WEEK, FECHA_SALIDA) = @SEMANA
AND DATEPART(WEEKDAY, FECHA_SALIDA) = @DIA



--41. Encontrar todos los pasajeros que viajan en una clase espec�fica en un vuelo determinado.
DECLARE @VUELO INT = 1
DECLARE @CLASE INT = 1
SELECT V.COD_VUELO AS 'VUELO', P.*,
C.COD_CLASE AS 'CLASE'
FROM PASAJERO P 
JOIN BOLETO B ON P.COD_PASAJERO = B.COD_PASAJERO
JOIN VUELO V ON B.COD_VUELO = V.COD_VUELO
JOIN CLASE C ON B.COD_CLASE = C.COD_CLASE
WHERE V.COD_VUELO = @VUELO AND C.COD_CLASE = @CLASE

--42. Obtener todos los vuelos que operan desde un pa�s en particular.
SELECT * FROM PAIS
SELECT * FROM CIUDAD
SELECT * FROM AEROPUERTO
SELECT * FROM VUELO

SELECT V.*, P.NOMBRE
FROM PAIS P 
JOIN CIUDAD C ON P.COD_PAIS = C.COD_PAIS
JOIN AEROPUERTO A ON C.COD_CIUDAD = A.COD_CIUDAD
JOIN VUELO V ON A.COD_AEROPUERTO = V.COD_AEROPUERTO_ORIGEN
WHERE P.NOMBRE = 'EGYPT'

--43. Mostrar todos los vuelos que operan hacia un pa�s en particular.
SELECT V.*, P.NOMBRE
FROM PAIS P 
JOIN CIUDAD C ON P.COD_PAIS = C.COD_PAIS
JOIN AEROPUERTO A ON C.COD_CIUDAD = A.COD_CIUDAD
JOIN VUELO V ON A.COD_AEROPUERTO = V.COD_AEROPUERTO_DESTINO
WHERE P.NOMBRE = 'EGYPT'


--44. Encontrar todos los vuelos que operan desde una ciudad en particular.
SELECT V.*, P.NOMBRE
FROM PAIS P 
JOIN CIUDAD C ON P.COD_PAIS = C.COD_PAIS
JOIN AEROPUERTO A ON C.COD_CIUDAD = A.COD_CIUDAD
JOIN VUELO V ON A.COD_AEROPUERTO = V.COD_AEROPUERTO_ORIGEN
WHERE P.NOMBRE = 'EGYPT'




--45. Obtener todos los vuelos que operan hacia una ciudad en particular.
SELECT * FROM VUELO
SELECT * FROM AEROPUERTO
SELECT * FROM CIUDAD

DECLARE @CIUDAD VARCHAR(50) = 'Aachen'
SELECT V.* FROM VUELO V
JOIN AEROPUERTO A ON V.COD_AEROPUERTO_DESTINO = A.COD_AEROPUERTO
JOIN CIUDAD C ON A.COD_CIUDAD = C.COD_CIUDAD
WHERE C.NOMBRE = @CIUDAD


--46. Mostrar todos los vuelos que tienen una duraci�n de vuelo superior a un tiempo determinado.
DECLARE @DURACION INT = 1
SELECT *, DATEDIFF(HOUR, HORA_SALIDA, HORA_LLEGADA) AS 'HORA_DIFERENCIA' FROM VUELO
WHERE DATEDIFF(HOUR, HORA_SALIDA, HORA_LLEGADA) >= @DURACION


--47. Encontrar todos los pasajeros que han sobrepasado el l�mite de peso de equipaje.
--NO SE PUEDE



--48. Obtener todos los boletos comprados por un cliente en un a�o espec�fico.
SELECT B.*, C.NOMBRE, F.FECHA_FACTURA AS 'FECHA' FROM CLIENTE C
JOIN FACTURA F ON C.COD_CLIENTE = F.COD_CLIENTE
JOIN DETALLE_FACTURA DF ON F.COD_FACTURA = DF.COD_FACTURA
JOIN BOLETO B ON DF.COD_BOLETO = B.COD_BOLETO
WHERE DATEPART(YEAR, F.FECHA_FACTURA) = 2023 AND C.COD_CLIENTE = 6


--49. Mostrar todos los vuelos que tienen un determinado tipo de equipaje a bordo.
SELECT * FROM EQUIPAJE
SELECT * FROM TIPO

--NO SE PUEDE ODIO EL EQUIPAJE

--50. Encontrar todos los vuelos que han sido operados por un piloto espec�fico.


SELECT V.*, T.CARGO FROM TRIPULANTE T
JOIN VUELO V ON T.COD_VUELO = V.COD_VUELO
WHERE T.CARGO = 1


USE AEROPUERTO
GO
 
SELECT 
    OBJECT_NAME(f.parent_object_id) AS TablaPadre,
    c1.name AS ColumnaPadre,
    OBJECT_NAME(f.referenced_object_id) AS TablaReferenciada,
    c2.name AS ColumnaReferenciada
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
INNER JOIN sys.columns AS c1 ON fc.parent_column_id = c1.column_id AND fc.parent_object_id = c1.object_id
INNER JOIN sys.columns AS c2 ON fc.referenced_column_id = c2.column_id AND fc.referenced_object_id = c2.object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'CLIENTE';