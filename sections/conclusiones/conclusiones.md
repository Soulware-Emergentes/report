En el TB1 el equipo completó el levantamiento y el análisis de requisitos, y definió la arquitectura estratégica de SGT.

Resultados de avance TB1:
- Las entrevistas confirman el Problem Statement: los tres entrevistados trabajan con más de un sistema sin integración automática, y dos de tres trasladan la información campo por campo de forma manual.
- Los assumptions sobre los segmentos se sostienen: los tres condicionan la aprobación de un dato a poder rastrearlo hasta su acta de origen.
- Las entrevistas aportaron dos hallazgos nuevos: la unidad de medida es la principal fuente de errores en el origen del dato, y existe una restricción institucional sobre el uso de servicios en la nube.
- El Product Backlog reúne 10 User Stories agrupadas en 5 épicas, y el Capítulo IV documenta 7 architectural drivers y 2 constraints.

En el TP1 el equipo llevó el diseño de SGT a su nivel táctico y definió la experiencia de usuario de la aplicación web y de la aplicación móvil.

Resultados de avance TP1:
- El Capítulo V descompone SGT en siete bounded contexts: Beneficiarios, Directory, IdentityProvider, Monitoring, People, Planning y Plots. Cada uno se documenta por capas de dominio, interfaz, aplicación e infraestructura, junto con sus diagramas de componentes, de clases y de base de datos.
- El contexto Monitoring, que sigue las fichas de evaluación de cada beneficiario, toma las identidades de las personas desde People y consume el registro de tareas de Planning a través de una interfaz de dominio, de modo que el modelo de la ficha no conoce el protocolo con el que se comunica con POI.
- La guía de estilos reúne la marca, los colores, la tipografía, el espaciado y los componentes base compartidos por la web y la aplicación móvil Android, y define estándares propios para el mapa, las tablas, los modales y el envío del archivo de la estación total.
- La Information Architecture define cómo se organizan, se nombran, se recorren y se buscan los contenidos de la landing page y de las aplicaciones, e incluye los valores de SEO y metadatos de cada pieza.
- Las pantallas se diseñaron en tres niveles: wireframes y mock-ups de la landing page, y wireframes y seis wireflows de las aplicaciones web y móvil, con su recorrido principal y sus respuestas alternativas.
- Una decisión de alcance tomada en reunión de equipo ordenó el reparto entre plataformas: la aplicación móvil registra y envía como borrador la medición de la estación total, y la web valida los terrenos, y carga y valida las fichas.
