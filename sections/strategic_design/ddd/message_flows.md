Para ejemplificar como cada contexto se vincula y comunica uno con otro detallamos los 3 flujos más representativos de SGP.

En primer lugar, mapeamos el flujo que tiene un asistente de campo para el mapeo de un terreno dentro del sistema web. Lo que hace aquí es crear un espacio virtual con las coordenadas reales del terreno del beneficiario. Obviamente este proceso se realiza dentro del contexto del SGP, sin embargo, tiene una comunicación con el contexto de beneficiarios para hacer el match entre el DNI de beneficiario que llega para el mapeo del terreno con el beneficiario que ya se encuentra dentro del sistema de beneficiarios. El terreno solo se crea si el beneficiario se encuentra en el sistema de beneficiarios.
![Mapear terreno](assets/strategic_design/ddd/message_flows/mapear-terreno.jpg)

En segundo lugar, se mapeo el flujo de mandar la ficha. El proceso empieza con el asistente de campo tomando foto con la aplicación móvil a la ficha realizada en campo, esta ficha viaja al contexto del SGP y este la traslada al contexto de la IA, donde se analiza y extrae la información de la foto. Al procesar ello, el contexto SGP guarda la información y ya esta disponible para validación de asesores de Gerencia General.
![Mandar ficha](assets/strategic_design/ddd/message_flows/mandar-ficha.jpg)

Finalmente, se mapeo el flujo de validar una ficha, en el cual se involucra los asesores de Gerencia General, quienes a través de la web observan la información extraída por el modelo de IA y la imagen real. En caso se valide exitosamente la ficha, se envia esa información al contexto POI para contribuir al avance de una actividad.
![Validar ficha](assets/strategic_design/ddd/message_flows/validar-ficha.jpg)