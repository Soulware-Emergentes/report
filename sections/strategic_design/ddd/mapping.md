Habiendo mapeado los contextos involucrados en SGP, se definió su comunicación. 

El contexto SGP se comunica tanto con Beneficiarios, POI y el modelo de IA.
Todas las comunicaciones siguen el patrón Customer/Supplier. Siendo, en todos los casos SGP el Customer.

La relación del contexto de SGP con el contexto de Beneficiarios es sencilla. SGP consume un endpoint (OHS) del contexto de Beneficiarios y mediante un ACL rescata lo estrictamente necesario para el sistema.

La relación del contexto SGP con el contexto de POI sigue el mismo patrón, sin embargo, SGP no pide información, sino que la envía. En este caso, el contexto de SGP prepara un recurso con los lineamientos del POST (OHS) del sistema POI y envía un avance para una actividad.

Finalmente, la comunicación entre el contexto SGP con el contexto de IA es a través de un endpoint (OHS), el modelo de IA recibe la imagen, extrae los datos y los manda en un formato que SGP ya conoce. Por tanto, SGP no necesita modificar lo que llega al contexto (CNF).
![Context Mapping](assets/strategic_design/ddd/mapping/context-mapping.png)