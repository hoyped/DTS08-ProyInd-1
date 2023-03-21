# DTS08-ProyInd-1
Repositorio de Primer Proyecto Individual DS08(HENRY)

# INTRODUCCIÓN
El presente proyecto pretende utilizar técnicas de aprendizaje automático para el análisis de datos y la realización de predicciones. El objetivo principal es construir un módelo que pueda aprender de datos históricos y en el mismo orden, utilizar la información obtenida para predecir valores futuros o clasificar nuevos datos.

Se seguirá un proceso de trabajo profundo y sistemático que involucra la recolección y limpieza de datos (ETL - Extraction, Tansformation, Load), la selección de características relevantes, la elección del algoritmo de aprendizaje adecuado, la evaluación del modelo y la interpretación de los resultados.

El uso de técnicas y modelos de machine learning es muy útil en diversos campos, desde la predicción de una decisión de compra hasta el diagnóstico médico. En este proyecto, aplicaremos las técnicas de **KNN (K Nearest Neighbors), Random Forest Classifier y Cosine Similarity** para acercarnos a predecir si un usuario consumirá contenido audiovisual en plataformas de streaming con base en las puntuaciones históricas realizadas por otros usuarios a través del tiempo.

![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/01.png)

La propuesta de trabajo incluye los siguientes aspectos a desarrollar con miras a obtener un MVP (Minimum Viable Product), cabe anotar que los datasets para el desarrollo del presente estudio ya han sido proporcionados.

**1. TRANSFORMACIONES**
Se proponen las siguientes moficiaciones en los datos:
-   Generar nuevo campo **id** compuesto por la combinación de otros campos contenidos en el dataset.
-   Reemplazar valores nulos del campo **rating** por el string "G"
-   Convertir fechas a formato específico **AAAA-mm-dd**
-   Llevar a minúsculas los campos tipo texto.
-   Generar dos nuevos campos a partir de la separación del campo **duration**.

Lo anterior fue desarrollado mediante el motor de bases de datos **MySQL** y el IDE **Visual Studio Code** para el lenguaje de desarrollo y programación **Python**.

![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/02.jpg)

**2. DESARROLLO API**
Disponibilizar la información de la empresa mediante el framework ***FastApi***, las consultas a consumirse por el usuario serán:
-   Película de mayor duración con filtrado de *año*, *plataforma* y *tiempo de duración*.
-   Cantidad de películas por plataforma que cumplan con un criterio de calificación establecido.
-   Cantidad de películas disponibles por plataforma de streaming.
-   Actor con mayor número de coincidencias mediante filtrado de *plataforma* y *año*.

Lo anterior fue desarrollado según solicitud en el framework de ***FastApi*** y disponibilizado para consumo general en ***render.com***

![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/03.png)

**3. ANÁLISIS EXPLORATORIO DE LOS DATOS**
El análisis exploratorio de los datos *-(EDA, por sus siglas en inglés)-* es un punto fundamental en todo proyecto de análisis de datos. Al utilizar técnicas de visualización y análisis estadísticos, es posible identificar patrones y relaciones importantes en los datos, así como posibles problemas o fuentes de error. Estos hallazgos sirven para guiar el diseño e implementación de modelos de análisis más avanzados, ayudando a los analistas a tener una comprensión más profunda de los datos.

Lo anterior fue desarrollado utilizando la libreria **pandas profiling** del lenguaje de desarrollo y programación **Python**

![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/04.png)

**4. SISTEMA DE RECOMENDACIÓN**
Se solicita realizar un modelo de machine learning para crear un sistema de recomendación de películas para usuarios, donde teniendo su identificación y dato de una película o serie, el sistema indique ***SI recomienda o NO*** dicho contenido para el usuario en cuestión.
En el desarrollo del presente punto se proponen tres (3) métodos de clasificación para obtener un modelo que nos brinde confianza en la predicción, dicho de este modo se trabajaran los siguientes: ***KNN - K Nearest Neighbors***, ***Random Forest Classifier*** y ***Cosine Similarity***.
En este punto es importante aclarar que las métricas de los módelos dieron resultados muy disímiles, indicando que la configuración de las herramientas algorítmicas tiene importante incidencia en los resultados y confiabilidd de las predicciones.

Lo anterior fue desarrollado utilizando la libreria **scikit learn** del lenguaje de desarrollo y programación de **Python**

![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/07.JPG)
![](https://github.com/hoyped/DTS08-ProyInd-1/blob/main/_src/08.JPG)

**5. VIDEO**
En este se evidencia la ejecución del desarrollo **API** del punto dos (2), así como una explicación de los modelos de machine learning entrenados.
Enlace al video:
https://drive.google.com/file/d/1CKfkQyh2gEcJIVFCWTfd_arpod9Eae5K/view?usp=share_link


**CONCLUSIONES**
-   Los modelos de ML pueden ser muy efectivos para predecir resultados en gran variedad de problemas, desde decisión de compra hasta diagnóstico médico.
-   La calidad de los resultados depende en gran medida de la calidad de los datos utilziados para entrenar el modelo.
-   La selección del algoritmo de aprendizaje automático adecuado es crucial para obtener resultados confiables.
-   Los modelos de ML son altamente escalables y pueden manejar enormes cantidades de datos.
-   Interpretar los resultados obtenidos a través de modelos de ML es todo un desafio que requiere habilidades especialziadas.


***MUCHAS GRACIAS***
