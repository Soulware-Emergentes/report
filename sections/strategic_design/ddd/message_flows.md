Para ejemplificar como cada contexto se vincula y comunica uno con otro detallamos los 3 flujos más representativos de SGT.

En primer lugar, mapeamos el flujo con el que el agente de campo registra un terreno desde la aplicación móvil. El agente envía el documento legal del beneficiario, el ubigeo del distrito y los vértices del perímetro medidos por la estación total, con su zona UTM. El módulo Plots verifica que el beneficiario no tenga otro terreno registrado y que el perímetro no se superponga con los terrenos vecinos más allá de la tolerancia, y solo entonces registra el terreno.

![Mapear terreno](assets/strategic_design/ddd/message_flows/mapear-terreno.jpg)

{{page_break}}

En segundo lugar, se mapeó el flujo de mandar la ficha. El agente de campo pide a SGT un enlace firmado, sube con él el PDF de la ficha al almacén de objetos y envía la ficha indicando la tarea del POI a la que corresponde. El módulo Monitoring verifica que el PDF esté subido, asigna a la ficha su código y, una vez confirmado el envío, registra la entrega en el contexto Planning de POI. Si POI acepta la entrega, la ficha queda lista para revisión; si la rechaza porque la tarea no existe o ya tiene una entrega, la ficha se anula. Con el contexto de IA, la ficha enviada pasará además por la extracción automática de sus campos antes de la revisión.

![Mandar ficha](assets/strategic_design/ddd/message_flows/mandar-ficha.jpg)

Finalmente, se mapeó el flujo de validar una ficha, en el cual intervienen los asistentes de Gerencia General a través de la web. El asistente descarga el PDF y lo contrasta con la tarea; si la evidencia corresponde a otra tarea, reasigna la ficha y POI mueve la entrega o la intercambia con la de esa tarea. Al aprobar la ficha, el asistente confirma el beneficiario, los insumos y las fechas que figuran en el documento, y SGT completa la tarea en POI para que cuente en el avance de su actividad. Al rechazarla, SGT reabre la tarea en POI para que reciba una nueva entrega.

![Validar ficha](assets/strategic_design/ddd/message_flows/validar-ficha.jpg)
