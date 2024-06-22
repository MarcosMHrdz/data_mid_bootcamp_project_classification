# Detalles del proyecto - clasificación

**Antecedentes**: Usted trabaja como analista de riesgos en un banco. Además de otros servicios bancarios y de préstamos, el banco también ofrece servicios de tarjetas de crédito, lo que es una fuente de ingresos muy importante para el banco. El banco quiere comprender la demografía y otras características de sus clientes que aceptan una oferta de tarjeta de crédito y los que no la aceptan.
Por lo general, los datos de observación para este tipo de problemas son algo limitados en el sentido de que a menudo la empresa sólo ve a aquellos que responden a una oferta. Para solucionar esto, el banco diseña un estudio de marketing focalizado, con 18.000 clientes actuales del banco. Este enfoque centrado permite al banco saber quién responde y quién no a la oferta, y utilizar datos demográficos existentes que ya están disponibles sobre cada cliente.

**Objetivo**: La tarea es crear un modelo que proporcione información sobre por qué algunos clientes bancarios aceptan ofertas de tarjetas de crédito. También existen otras áreas potenciales de oportunidades que el banco quiere comprender a partir de los datos.
Su alta dirección también ha publicado estas otras preguntas que les ayudarán a comprender mejor a sus clientes.

**Datos**: El conjunto de datos consta de información sobre 18.000 clientes bancarios actuales en el estudio. Estas son las definiciones de los puntos de datos proporcionadas:

- **Número de cliente**: un número secuencial asignado a los clientes (esta columna está oculta y excluida; este identificador único no se utilizará directamente).
- **Oferta aceptada**: ¿El cliente aceptó (Sí) o rechazó (No) la oferta? Recompensa: el tipo de programa de recompensas ofrecido para la tarjeta.
- **Tipo de correo**: Carta o postal.
- **Nivel de ingresos**: Bajo, Medio o Alto.
- **#Cuentas bancarias abiertas**: cuántas cuentas que no son de tarjetas de crédito tiene el cliente.
- **Protección contra sobregiros**: ¿Tiene el cliente protección contra sobregiros en su(s) cuenta(s) corriente(s) (Sí o No)?
- **Calificación crediticia**: Baja, Media o Alta.
- **#Tarjetas de crédito retenidas**: El número de tarjetas de crédito retenidas en el banco.
- **#Casas Propias**: El número de viviendas propiedad del cliente.
- **Tamaño del hogar**: Número de personas en la familia.
- **Sea dueño de su casa**: ¿El cliente es dueño de su casa? (Sí o no).
- **Saldo promedio**: Saldo promedio de la cuenta (en todas las cuentas a lo largo del tiempo). **T1, T2, T3 y T4**
- **Saldo**: Saldo promedio de cada trimestre del último año

### Explorando los datos

Le recomendamos que comprenda a fondo sus datos y tome las medidas necesarias para prepararlos para el modelado antes de crear modelos exploratorios o predictivos. Dado que se trata de un modelo de clasificación, puede utilizar la regresión logística para la clasificación y construir un modelo. También le recomendamos que utilice otros modelos en su proyecto, incluidos clasificadores KNN y árboles de decisión.
Para explorar los datos, puedes utilizar las técnicas que se han comentado en clase. Algunos de ellos incluyen el uso del método describe, la verificación de valores nulos y el uso de _matplotlib_ y _seaborn_ para desarrollar visualizaciones.
Los datos tienen una serie de variables categóricas y numéricas. Explore la naturaleza de los datos para estas variables antes de comenzar con el proceso de limpieza de datos y luego el preprocesamiento de datos (escalado de variables numéricas y codificación de variables categóricas).
Para la variable objetivo (Oferta aceptada – Sí/No), también es importante comprobar el desequilibrio de los datos, es decir, el número de personas que respondieron con un sí frente al número de personas que respondieron con un no.
También utilizará Tableau para explorar visualmente los datos en mayor profundidad. Profundizará en los datos de los clientes que aceptaron la oferta frente a los clientes que no lo hicieron y comprobará sus características. Por ejemplo, seleccionamos el nivel **Sí** en **Oferta aceptada** y luego examinamos la distribución de las ofertas aceptadas entre las otras variables de nuestro conjunto de datos y de manera similar para las personas que no aceptaron la oferta.

### Modelo

Utilice diferentes modelos para comparar las precisiones y encontrar el modelo que mejor se ajuste a sus datos. Puedes utilizar las medidas de precisiones que se han comentado en clase. Tenga en cuenta que al comparar diferentes modelos, asegúrese de utilizar la misma medida de precisión como punto de referencia.

### Herramientas empleadas
Visualización : Power BI
Análisis exploratorio de datos (EDA) : MySQL, Python
Aprendizaje automático : Python

### Estructura del proyecto:

1. Importar bibliotecas y cargar el conjunto de datos
2. Visión general del conjunto de datos
3. Limpieza de datos
4. Separar los datos entre variables numéricas y categóricas.
5. Modelos
6. Conclusiones

### Conclusión
- Podemos ver que los datos estan muy desbalanceados, por lo que he tenido que SMOTE para balancearlos, aunque el entrenamiento del modelo lo he hecho con los datos balanceados.

- El modelo Random Forest destaca por su mejor rendimiento global, con menos falsos positivos que los modelos de KNN. Aunque los KNN tienen menos falsos negativos, su tasa de falsos positivos es alta. Por lo tanto, elijo el Random Forest debido a su equilibrio entre falsos negativos y positivos.

- Viendo las caracteristicas numéricas y categoricas, podemos decir que para mejorar los resultados, podriamos centrarnos en clientes con las siguientes caracteristicas. 

        - Nivel  de ingreso Media

        - Calificación crediticia Baja

        - Cuentas bancarias abiertas entre 1
    
        - Protección de sobregiro No
 
        - Tarjetas de crédito mantenidas 2

        - Número de viviendas propiedad del cliente 1

        - Tamaño de vivienda 3 - 4 personas

        - Recompensa Millas aereas

        - Tipo de remitente Postcard

### Recursos útiles para ver

[Codigo Pyton](https://github.com/MarcosMHrdz/data_mid_bootcamp_project_classification/blob/master/entrega/Proyecto%20mid-bootcamp%20-%20Clasificaci%C3%B3n.ipynb)

[Consultas MySQL](https://github.com/MarcosMHrdz/data_mid_bootcamp_project_classification/blob/master/entrega/sql_questions_classification.sql)

[Presentaciones PowerBi](https://github.com/MarcosMHrdz/data_mid_bootcamp_project_classification/blob/master/entrega/clasificacion.pbix)

[Presentacione PDF](https://github.com/MarcosMHrdz/data_mid_bootcamp_project_classification/blob/master/entrega/Clasificacion.pdf)

