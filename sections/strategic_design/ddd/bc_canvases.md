Como parte del analisis de los contextos identificados se desarrollo su canvas respectivo.

En primer lugar se analizo el contexto SGT. Este contexto es el CORE del sistema, interactua directamente con el Frontend del usuario proporcionando todos los endpoints del sistema. Además se comunica con los contextos de Beneficiarios, POI y el modelo de IA.
![Contexto SGT](assets/strategic_design/ddd/bc_canvases/sgp.jpg)

Luego se analizo el contexto de Beneficiarios, que se trata de un contexto externo. Este contexto, tiene como único propósito dentro del sistema, proporcionar información de los beneficiarios. Se comunica con el contexto SGT.
![Contexto Beneficiarios](assets/strategic_design/ddd/bc_canvases/beneficiarios.jpg)

A su vez se analizo el contexto de POI, este contexto, al igual que el anterior, es un contexto externo. Tiene como único propósito recibir información sobre las fichas validadas por asesoria de Gerencia General. 
![Contexto POI](assets/strategic_design/ddd/bc_canvases/poi.jpg)

Finalmente, el contexto de IA es una mejora al proceso actual. Es meramente tecnologico y busca reducir la carga operativa de Gerencia General. Tiene como propósito analizar las fichas a través de fotos, extraer su información relevante y permitir su validación con Gerencia General.
![Contexto IA](assets/strategic_design/ddd/bc_canvases/ia.jpg)