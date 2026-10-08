Habiendo mapeado los contextos involucrados en SGT, se definió su comunicación.

La relación de Monitoring con Planning sigue el patrón Customer/Supplier, con Monitoring como Customer. Planning expone su API de tareas como Open Host Service, y Monitoring la consume a través de la interfaz de dominio TaskLedger, que actúa como Anticorruption Layer: el modelo de la ficha solo conoce las entregas y sus respuestas. SGT envía información a POI en cada paso de la ficha: registra la entrega, la completa, la reabre o la reasigna.

La relación de People con Beneficiarios y con Directory es también Customer/Supplier. Ambos exponen un endpoint de búsqueda por lotes (OHS), y People rescata lo estrictamente necesario mediante un ACL, para entregarlo a los demás módulos de SGT como su lenguaje publicado. Monitoring y Plots se refieren a las personas solo por las identidades de ese lenguaje publicado.

Identity Provider expone los protocolos OAuth 2.1 y OpenID Connect como Open Host Service y su formato de token como Published Language. SGT, POI y Beneficiarios se conforman a ese lenguaje (Conformist): validan los tokens con la clave que publica Identity Provider y leen de ellos el sujeto, los roles o los scopes. Identity Provider, a su vez, consulta a Directory para autenticar a las personas y conocer sus grupos.

Finalmente, la comunicación entre SGT y el contexto de IA, planificada, será a través de un endpoint (OHS): el modelo de IA recibe el documento, extrae los datos y los manda en un formato que SGT ya conoce. Por tanto, SGT no necesita modificar lo que llega al contexto (CNF).

![Context Mapping](assets/strategic_design/ddd/mapping/context-mapping.png)
