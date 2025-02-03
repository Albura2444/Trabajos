--LIMPIEZA DE DATOS
--REDIRIGIR DATOS

SELECT * FROM STANGIN_LIMPIEZA

SELECT *
INTO #LIMPIEZA
FROM STANGIN_LIMPIEZA

--REVISION DE DATOS
SELECT * FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET [Nombre Completo] = NULL
WHERE [Nombre Completo] = ''

UPDATE #LIMPIEZA
SET Marca = NULL
WHERE Marca = ''

UPDATE #LIMPIEZA
SET Plaza = NULL
WHERE Plaza = ''

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = NULL
WHERE [Tarjeta de Pago] = ''

UPDATE #LIMPIEZA
SET [Fecha Pago DMA] = NULL
WHERE [Fecha Pago DMA] = ''

--REVISION DEL RESTO DE DATOS
SELECT * FROM #LIMPIEZA

--CAMBIO A LOS NOMBRES
UPDATE #LIMPIEZA
SET [Nombre Completo] = REPLACE([Nombre Completo], '_', ' ')
--REVISION DE LAS MARCAS
UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Zara', 'Zara La Gran Plaza')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Zara La Gran Plaza La Gran Plaza', 'Zara La Gran Plaza')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Massimo Dutti', 'Massimo D.')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'El P. de Hierro', 'El Palacio de Hierro')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Hierro, El palacio', 'El Palacio de Hierro')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Cartier', 'Cartier Joyeria Inc.')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Cartier Joyeria Inc. Joyeria', 'Cartier Joyeria Inc.')

UPDATE #LIMPIEZA
SET MARCA = REPLACE(MARCA, 'Cartier Joyeria Inc. Inc.', 'Cartier Joyeria Inc.')

--REVISION DE LAS PLAZAS
SELECT * FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'ANdares', 'Andares')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'LA GRAN plaza', 'La Gran Plaza')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'Plaza GALErias', 'Plaza Galerias')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'Plaza del SOL', 'Plaza del Sol')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'PLAZA CIUDADELA', 'Plaza Ciudadela')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'Plaza la Perla', 'Plaza la Perla')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'LANDmark', 'Land Mark')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'LANDmark', 'Land Mark')

UPDATE #LIMPIEZA
SET Plaza = REPLACE(Plaza, 'Plaza LAS TORRES', 'Plaza Las Torres')

--REVISION DE FECHA DE PAGO
SELECT * FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET [Fecha Pago DMA] = CONVERT(DATE, [Fecha Pago DMA], 103)
WHERE [Fecha Pago DMA] IS NOT NULL;

--REVISION DE DESCUENTO
SELECT *
FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET Descuento = CONVERT(NUMERIC(3,2), Descuento)
WHERE Descuento IS NOT NULL

--REVISION DE PRECIO 
SELECT * FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET Precio = REPLACE(Precio, '00', '')

UPDATE #LIMPIEZA
SET Precio = REPLACE(Precio, '.', '.00')

UPDATE #LIMPIEZA
SET Descuento = CONVERT(numeric(5,2), Descuento)
WHERE Descuento IS NOT NULL

--REVISION DE TARJETAS DE PAGO
SELECT * FROM #LIMPIEZA

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = LTRIM([Tarjeta de Pago])
WHERE [Tarjeta de Pago] LIKE ' %';

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = REPLACE([Tarjeta de Pago], ' ', '')
WHERE [Tarjeta de Pago] LIKE '% %'

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = REPLACE([Tarjeta de Pago], 'AmericanExpress', 'American Express')

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = REPLACE([Tarjeta de Pago], 'American ExpressCorporativa', 'American Express Corporativa')

UPDATE #LIMPIEZA
SET [Tarjeta de Pago] = REPLACE([Tarjeta de Pago], 'VISAPLATINUM', 'VISA PLATINUM')
