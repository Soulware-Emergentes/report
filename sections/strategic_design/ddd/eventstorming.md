A continuación se detalla el proceso de EventStorming seguido por el equipo para la identificación de contextos.

En primer lugar, se identificaron los eventos correspondientes al dominio. 
![EventStorming step 1](eventstorming.assets/eventstorming-1.png)

Posteriormente esos eventos se ordenaron secuencialmente de izquierda a derecha.
![EventStorming step 2](eventstorming.assets/eventstorming-2.png)

Como siguiente paso se procedió a identificar los comandos que desencadenan los eventos identificados. En nuestro caso, solo un evento era desencadenado por otro, luego todos eran desencadenados por comandos.
![EventStorming step 3](eventstorming.assets/eventstorming-3.png)

Continuando con los pasos, identificamos los roles asociados a los comandos, es decir, sus ejecutantes. En este paso aparecieron, obviamente, el agente de campo y los asesores de Gerencia General. También apareció el sistema como un rol, ya que es el que ejecuta algunos comandos dentro del flujo.
![EventStorming step 4](eventstorming.assets/eventstorming-4.png)

En consecuencia, habiendo identificado los roles, identificamos las politicas del dominio. En este caso, siendo la coherencia que existe entre un terreno y su dueño, y el beneficiario al que se le hace seguimiento.
![EventStorming step 5](eventstorming.assets/eventstorming-5.png)

Luego, identificamos los sistemas externos con los cuales se comunica SGP, en este caso siendo el sistema de beneficiarios (sistema que permitirá conocer la información de los beneficiarios de la entidad), sistema POI (sistema al cual se hara un envío de información por cada ficha validada) y el modelo de IA (que se representa como un sistema externo debido a su naturaleza).
![EventStorming step 6](eventstorming.assets/eventstorming-6.png)

Habiendo identificado ello, analizamos y detallamos las vistas que influirian en el sistema. En este paso ya detallamos el uso de la web y la aplicación móvil.
![EventStorming step 7](eventstorming.assets/eventstorming-7.png)

Como uno de los últimos pasos, identificamos los agregados en base a lo planteado hasta el momento. En este caso, Terreno y Ficha vendrían a ser los agregados del dominio.
![EventStorming step 8](eventstorming.assets/eventstorming-8.png)

Para concluir el proceso de EventStorming, identificamos los contextos vinculados al planteo del equipo. En primer lugar, y más importantes (ya que serán los que vamos a desarrollar nosotros) se encuentran el contexto de SGP y el contexto de IA. Mientras que los contextos de Beneficiarios y POI representan contextos con los cuales SGP se va a comunicar, más no se mapea a detalle esos contextos, ya que no estan dentro del alcance.
![EventStorming step 9](eventstorming.assets/eventstorming-9.png)
