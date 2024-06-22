
-- 1. Cree una base de datos llamada credit_card_classification.

CREATE DATABASE IF NOT EXISTS credit_card_classification;

-- -- 2. Cree una tabla credit_card_datacon las mismas columnas que figuran en el archivo csv. 
-- Asegúrese de utilizar los tipos de datos correctos para las columnas.


CREATE TABLE IF NOT EXISTS credit_card_classification.credit_card_datacon  (
    id INT,
    oferta_aceptada VARCHAR(255),
    recompensa VARCHAR(255),
    tipo_de_remitente VARCHAR(255),
    nivel_de_ingreso VARCHAR(255),
    cuentas_bancarias_abiertas INT,
    proteccion_de_sobregiro VARCHAR(255),
    calificacion_crediticia VARCHAR(255),
    tarjetas_de_credito_mantenidas INT,
    viviendas_en_propiedad INT,
    tamaño_de_vivienda INT,
    sea_propietario_de_su_vivienda VARCHAR(255),
    saldo_promedio FLOAT,
    saldo_T1 FLOAT,
    saldo_T2 FLOAT,
    saldo_T3 FLOAT,
    saldo_T4 FLOAT
);


-- Importe los datos del archivo csv a la tabla. Antes de importar los datos a la tabla vacía, 
-- asegúrese de haber eliminado los encabezados del archivo csv. Para no modificar los datos originales, si lo deseas puedes crear una copia del archivo csv también. 
-- tenga en cuenta que es posible que deba utilizar las siguientes consultas para otorgar permiso a SQL para importar datos desde archivos csv de forma masiva:

SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go

SET GLOBAL local_infile = 1;  
-- 4. Seleccione todos los datos de la tabla credit_card_datapara verificar si los datos se importaron correctamente.

Select * from credit_card_datacon; 

-- 5. Utilice el comando alterar tabla para eliminar la columna q4_balancede la base de datos, ya que no la usaríamos en el análisis con SQL. 
-- Seleccione todos los datos de la tabla para verificar si el comando funcionó. Limite los resultados devueltos a 10.

ALTER TABLE credit_card_datacon
DROP COLUMN saldo_T4;

SELECT *
FROM credit_card_datacon
LIMIT 10;

-- 6. Utilice la consulta SQL para encontrar cuántas filas de datos tiene.

SELECT count(*)
FROM credit_card_datacon;

-- 7. Ahora intentaremos encontrar los valores únicos en algunas de las columnas categóricas:

-- -- ¿Cuáles son los valores únicos en la columna Offer_accepted?
SELECT oferta_aceptada
FROM credit_card_datacon;
-- -- ¿Cuáles son los valores únicos en la columna Reward?
SELECT recompensa
FROM credit_card_datacon;

-- -- ¿Cuáles son los valores únicos en la columna mailer_type?
SELECT tipo_de_remitente
FROM credit_card_datacon;

-- -- ¿Cuáles son los valores únicos en la columna credit_cards_held?
SELECT tarjetas_de_credito_mantenidas
FROM credit_card_datacon;

-- -- ¿Cuáles son los valores únicos en la columna household_size?
SELECT tamaño_de_vivienda
FROM credit_card_datacon;

-- 8.Organice los datos en orden decreciente según el average_balancedel cliente. 
SELECT *
FROM credit_card_datacon
ORDER BY saldo_promedio desc;

-- -- Devuelve solo los customer_number 10 clientes principales con los average_balancesdatos más altos.

SELECT id, saldo_promedio
FROM credit_card_datacon
ORDER BY saldo_promedio desc;

-- 9.¿Cuál es el saldo promedio de todos los clientes de tus datos?

SELECT AVG(saldo_promedio) AS Promedio_clientes
FROM credit_card_datacon;

-- 10.En este ejercicio usaremos simple group_bypara verificar las propiedades de algunas de las variables categóricas en nuestros datos. 
-- Tenga en cuenta que siempre que average_balancese le solicite, tome el promedio de la columna average_balance:

-- -- ¿Cuál es el saldo promedio de los clientes agrupados por Income Level? .
-- El resultado devuelto debe tener solo dos columnas, nivel de ingresos y Average balancede los clientes. 
-- Utilice un alias para cambiar el nombre de la segunda columna.

SELECT nivel_de_ingreso, AVG(saldo_promedio) AS Promedio
FROM credit_card_datacon
GROUP BY nivel_de_ingreso;

-- -- ¿Cuál es el saldo promedio de los clientes agrupados por number_of_bank_accounts_open?
--  -- El resultado devuelto debe tener solo dos columnas number_of_bank_accounts_openy Average balancela de los clientes.
--  -- Utilice un alias para cambiar el nombre de la segunda columna.
SELECT cuentas_bancarias_abiertas, AVG(saldo_promedio) AS Promedio
FROM credit_card_datacon
GROUP BY cuentas_bancarias_abiertas;

-- -- ¿Cuál es el número promedio de tarjetas de crédito que tienen los clientes para cada una de las calificaciones de tarjetas de crédito? 
-- -- El resultado devuelto debe tener solo dos columnas: calificación y número promedio de tarjetas de crédito poseídas. 
-- -- Utilice un alias para cambiar el nombre de la segunda columna.

SELECT calificacion_crediticia, AVG(tarjetas_de_credito_mantenidas) AS Promedio_tarjetas_de_credito_mantenidas
FROM credit_card_datacon
GROUP BY calificacion_crediticia;

-- -- ¿Existe alguna correlación entre las columnas credit_cards_heldy number_of_bank_accounts_open? 
-- -- Puedes analizar esto agrupando los datos por una de las variables y luego agregando los resultados de la otra columna. 
-- -- Verifique visualmente si existe una correlación positiva, una correlación negativa o ninguna correlación entre las variables.

SELECT tarjetas_de_credito_mantenidas, count(cuentas_bancarias_abiertas) AS número_de_cuentas_bancarias_abiertas
FROM credit_card_datacon
GROUP BY tarjetas_de_credito_mantenidas;

SELECT tarjetas_de_credito_mantenidas, avg(cuentas_bancarias_abiertas) AS promedio_número_de_cuentas_bancarias_abiertas
FROM credit_card_datacon
GROUP BY tarjetas_de_credito_mantenidas;

-- No hay correlaccion.

-- 11. Sus gerentes solo están interesados ​​en los clientes con las siguientes propiedades:

-- Calificación crediticia media o alta
-- Tarjetas de crédito con 2 o menos
-- Posee su propia casa
-- Tamaño del hogar 3 o más
-- Por el resto de cosas no les preocupa demasiado. 
-- Escriba una consulta sencilla para saber cuáles son las opciones disponibles para ellos. ¿Puedes filtrar los clientes que aceptaron las ofertas aquí?

SELECT *
FROM credit_card_datacon
WHERE calificacion_crediticia IN ('Medium','High') 
	AND tarjetas_de_credito_mantenidas >= 2 
    AND sea_propietario_de_su_vivienda = 'Yes' 
    AND tamaño_de_vivienda >= 3 
	AND oferta_aceptada = 'yes';
 
 -- 12. Sus gerentes quieren conocer la lista de clientes cuyo saldo promedio es menor que el saldo promedio de todos los clientes en la base de datos. 
 -- Escriba una consulta para mostrarles la lista de dichos clientes. 
 -- Es posible que necesite utilizar una subconsulta para este problema.
 
SELECT * 
FROM credit_card_datacon
WHERE saldo_promedio < 
					(SELECT AVG(saldo_promedio)
                    FROM credit_card_datacon);

-- 13.Dado que esto es algo que interesa habitualmente a la alta dirección, cree una vista de la misma consulta.

CREATE VIEW vista_datos_tarjeta_crédito AS
SELECT * 
FROM credit_card_datacon
WHERE saldo_promedio < 
					(SELECT AVG(saldo_promedio)
                    FROM credit_card_datacon);
                    
SHOW CREATE VIEW vista_datos_tarjeta_crédito;

-- 14.¿Cuál es la cantidad de personas que aceptaron la oferta versus la cantidad de personas que no lo hicieron?

SELECT oferta_aceptada, COUNT(oferta_aceptada) AS cantidad
FROM credit_card_datacon
GROUP BY oferta_aceptada;

-- 15.Sus gerentes están más interesados ​​en clientes con una calificación crediticia alta o media. 
-- ¿Cuál es la diferencia en los saldos promedio de los clientes con calificación de tarjeta de crédito alta y calificación de tarjeta de crédito baja?
 
-- Calcular los saldos promedio para cada grupo de calificación crediticia
SELECT 
    AVG(CASE WHEN calificacion_crediticia = 'High' THEN saldo_promedio ELSE NULL END) AS saldo_promedio_alta,
    AVG(CASE WHEN calificacion_crediticia = 'Low' THEN saldo_promedio ELSE NULL END) AS saldo_promedio_baja
FROM 
    credit_card_datacon;

-- Restar los dos promedios para obtener la diferencia
SELECT 
    (AVG(CASE WHEN calificacion_crediticia = 'High' THEN saldo_promedio ELSE NULL END) - 
     AVG(CASE WHEN calificacion_crediticia = 'Low' THEN saldo_promedio ELSE NULL END)) AS diferencia_saldo_promedio
FROM 
    credit_card_datacon;
    
-- 16. En la base de datos, ¿qué tipos de comunicación ( mailer_type) se utilizaron y con cuántos clientes?

SELECT tipo_de_remitente, COUNT(tipo_de_remitente) AS cantidad
FROM credit_card_datacon
GROUP BY tipo_de_remitente;

-- 17. Proporciona los datos del cliente que ocupa el puesto 11 Q1_balanceen tu base de datos.

SELECT *
FROM credit_card_datacon
ORDER BY saldo_T1 ASC
LIMIT 1 OFFSET 10;

SELECT *
FROM credit_card_datacon
ORDER BY saldo_T1 ASC
LIMIT 10,1;

    

    

  

        