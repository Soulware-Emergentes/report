En esta sección se fijan las decisiones visuales y de comunicación que comparten la aplicación web y la aplicación móvil de SGT. Las guías se construyeron en Figma como un repositorio central de variables, estilos y componentes, de modo que cualquier pantalla se arme con los mismos elementos y mantenga una presentación consistente. Las particularidades de cada plataforma, como la plantilla con mapa de la web o el flujo de envío de archivos del móvil, se desarrollan en la sección siguiente.

Como referencia externa se tomó el Geoportal SISCOD, un portal cartográfico institucional peruano cuyo tono cromático inspiró la paleta. No se adaptó un design system existente completo. Se construyó uno propio y mínimo, con los tokens y componentes que necesita el alcance del proyecto.

**Branding**  
El logotipo de SGT es una marca propia del equipo. Representa un terreno visto desde arriba, con sus surcos, y un pin de ubicación clavado en él: la parcela registrada y georreferenciada, que es lo que el sistema gestiona. El polígono irregular alude al terreno tal como lo mide el agente de campo, y el pin al punto que se captura con la estación total y se muestra en el mapa. Se resuelve con la paleta del sistema, con el terreno en teal, el pin en verde y la sigla en navy, compuesta en Roboto Bold con 6 % de espaciado entre letras, la misma familia que usa la interfaz.

El logotipo tiene una versión horizontal y una de icono, y cada una existe en tono Color, para fondos claros, y en tono En oscuro, para fondos navy.

<img src="./assets/ux_design/style/general/logo-versiones.png" alt="Versiones del logotipo de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Reglas de uso del logotipo:
- Usar la versión Color sobre blanco o gris claro, y la versión En oscuro sobre navy 900 o fondos igual de oscuros.
- Dejar alrededor del logo un margen libre equivalente a la mitad del ancho del pin.
- Respetar el tamaño mínimo de 24 px para el icono y de 96 px de ancho para la versión horizontal.
- No estirar, rotar ni deformar el logo, no cambiar los colores del terreno, del pin o de la sigla, no añadir sombras, contornos o degradados, y no colocarlo sobre fotos o fondos de bajo contraste.

Esta marca es una propuesta de diseño del equipo para el proyecto. Su uso institucional real requeriría la aprobación de la entidad.

**Principios de diseño**  
Cinco principios guían las decisiones visuales de SGT. Nacen de lo que necesitan los dos usuarios del sistema: el agente de campo, que trabaja en el terreno con poco tiempo, y la asistente de gerencia general, que valida documentos y no puede aprobar datos dudosos. Cada principio indica en qué se apoya y dónde se aplica.
- Claridad primero: cada pantalla tiene una sola acción principal y todo lo demás se subordina a ella. Se apoya en la ley de Hick (Hick, 1952), según la cual el tiempo de decisión crece con el número de opciones, y en la heurística de diseño estético y minimalista (Nielsen, 1994). Se aplica con un solo botón Primary por pantalla y una escala tipográfica corta.
- Confianza y trazabilidad visibles: el estado de una ficha y la responsabilidad sobre cada dato siempre se ven, para que la asistente nunca deba adivinar si un documento fue aprobado, observado o alterado. Se apoya en la heurística de visibilidad del estado del sistema (Nielsen, 1994) y en el concepto de cadena de responsabilidad del lenguaje del dominio. Se aplica con el Status chip en cada ficha y con alertas de integridad que incluyen título y acción.
- Accesibilidad por defecto: el contraste, el tamaño de los objetivos táctiles y los estados de foco se resuelven en los tokens y no pantalla por pantalla, y nunca se comunica algo solo con color. Se apoya en las pautas WCAG 2.2 nivel AA (W3C, 2023), que exigen un contraste de 4.5 a 1 para texto normal y un objetivo táctil mínimo de 24 por 24 px. SGT adopta un objetivo mayor, de 44 px o más, que corresponde al criterio más estricto de la misma norma. Se aplica con botones de 48 px de alto, el estado Focus de 2 px y colores de estado siempre acompañados de una etiqueta.
- Prevención de errores: la interfaz evita los errores antes de que ocurran y, cuando ocurren, explica qué pasó y cómo corregirlos. Se apoya en las heurísticas de prevención de errores y de ayuda para reconocer, diagnosticar y recuperarse de errores (Nielsen, 1994). Se aplica con el Input en estado Error acompañado de texto de ayuda y con el botón Danger diferenciado del Primary.
- Consistencia entre web y móvil: una sola paleta, una sola tipografía y los mismos componentes en ambas aplicaciones, de modo que cambien el tamaño y la disposición pero no la identidad. Se apoya en la heurística de consistencia y estándares (Nielsen, 1994) y en el uso de design tokens compartidos. Se aplica con variables de color, espaciado y radios comunes y componentes únicos en Figma.

**Tono de comunicación**  
SGT maneja datos de beneficiarios, documentos firmados y aprobaciones que alimentan un plan institucional. Por eso el tono es serio, formal sin ser rígido, siempre respetuoso y sereno. Habla con claridad al agente que está en el terreno y con precisión a la asistente que valida. La ubicación de cada dimensión se muestra a continuación.

<img src="./assets/ux_design/style/general/tono-dimensiones.png" alt="Dimensiones del tono de comunicación" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Las dimensiones se resolvieron así:
- Divertido o serio, con inclinación a serio: las fichas y aprobaciones tienen consecuencias formales y de control interno, y el humor resta confianza.
- Formal o casual, con inclinación a formal pero cercano: se trata de usted y se usa lenguaje sencillo, sin jerga administrativa innecesaria, porque el agente de campo lee rápido y de pie.
- Respetuoso o irreverente, con inclinación total a respetuoso: el sistema nunca culpa, explica qué pasó y qué hacer, tanto al agente como al beneficiario.
- Entusiasta o sereno, con inclinación a sereno: los mensajes informan sin exagerar, de modo que un éxito se confirma con calma y un error se explica sin alarma.

Para redactar los mensajes de la interfaz se aplican cuatro reglas:
- Usar frases cortas y directas, con una idea por oración y el verbo al inicio en las acciones, como Suba la ficha o Revise los datos.
- Tratar siempre de usted, incluso en el móvil.
- Usar los términos que ya emplea el personal, como ficha, terreno, beneficiario y agente de campo, sin términos técnicos de software en la interfaz.
- Redactar los errores de modo que digan qué pasó y qué puede hacer la persona, sin culpar ni usar mayúsculas para alarmar.

Los siguientes ejemplos contrastan la forma de decir cada mensaje con la que se evita.

<img src="./assets/ux_design/style/general/tono-ejemplos.png" alt="Ejemplos de mensajes con el tono definido" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

**Colores**  
La paleta parte de los verdes azulados y el azul marino del Geoportal SISCOD, con un azul cielo y un verde hoja como acentos. El teal es el color primario y se reserva para la acción principal y los elementos interactivos. El navy es el color secundario y se usa en encabezados, fondos oscuros y acciones de apoyo. El verde hoja y el azul cielo son acentos, con un uso decorativo o de foco. Los colores de marca se muestran junto con su contraste sobre texto.

<img src="./assets/ux_design/style/general/colores-marca.png" alt="Colores de marca de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Cada color de marca tiene una rampa de diez pasos, junto con rampas de gris frío para neutros, de ámbar para advertencias y de rojo para errores. Estas rampas son variables primitivas y solo alimentan a los tokens semánticos. Los componentes consumen únicamente los semánticos, de modo que cambiar un color no exige revisar pantalla por pantalla.

<img src="./assets/ux_design/style/general/colores-rampas.png" alt="Rampas de color primitivas de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 150mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Los estados de una ficha usan cada uno un trío de colores: el sólido, el fondo suave y el texto sobre el fondo suave. Ninguno se comunica solo con color, siempre lo acompaña una etiqueta de texto.

<img src="./assets/ux_design/style/general/colores-estado.png" alt="Colores de estado de una ficha" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Los tokens semánticos tienen dos modos, claro y oscuro, y los componentes cambian de modo sin rediseño. El modo claro es el predeterminado.

<img src="./assets/ux_design/style/general/colores-modos.png" alt="Vista previa de los modos claro y oscuro" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Los pares principales de color y texto se calcularon contra el nivel AA de WCAG 2.2 (W3C, 2023), que exige un contraste de al menos 4.5 a 1 para texto normal. Los colores que no alcanzan ese valor, como el verde hoja con texto blanco o el azul cielo con texto pequeño, no se usan para texto.

**Tipografía**  
Se usa una sola familia, Roboto, en tres pesos: Regular para texto corrido, Medium para etiquetas y subtítulos, y Bold para títulos. Es legible en pantallas pequeñas, está disponible en web y Android sin licencias adicionales y su tono neutro coincide con el de los portales institucionales de referencia. Una sola familia mantiene la interfaz sobria.

<img src="./assets/ux_design/style/general/tipografia-pesos.png" alt="Pesos tipográficos de Roboto" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

La escala tiene once estilos, desde el título de pantalla hasta las notas de apoyo, y cada estilo indica su uso.

<img src="./assets/ux_design/style/general/tipografia-escala.png" alt="Escala tipográfica de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 150mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Reglas de uso de la tipografía:
- El texto base mide 16 px como mínimo en móvil y el texto corrido nunca baja de 14 px.
- Las líneas de texto en web se mantienen entre 60 y 80 caracteres.
- Solo la primera palabra de los títulos y de los botones lleva mayúscula inicial.
- Cada pantalla tiene un único título de nivel 1.

**Espaciado, radios y sombras**  
Todo el espaciado sigue una base de 4 px, con saltos de 8 px a partir de 8. Los radios y las sombras son pocos y se repiten, para que la interfaz se vea consistente en web y móvil.

<img src="./assets/ux_design/style/general/espaciado.png" alt="Escala de espaciado de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Los radios de esquina van de cero a 16 px, con un valor completo para etiquetas de estado. Las tarjetas y alertas usan 12 px, y los botones y campos, 8 px.

<img src="./assets/ux_design/style/general/radios.png" alt="Radios de esquina de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 60mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Hay tres sombras, para tarjetas en reposo, para menús y tarjetas elevadas, y para modales y diálogos.

<img src="./assets/ux_design/style/general/sombras.png" alt="Sombras de SGT" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 60mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Las grillas se definen por plataforma. En web se usan 12 columnas con un ancho máximo de contenido de 1200 px, canal de 24 px y márgenes de 96 px en escritorio. En móvil se usan 4 columnas, canal de 16 px y márgenes de 16 px. Los objetivos táctiles miden al menos 44 por 44 px.

**Componentes**  
Los componentes base son componentes reales de Figma construidos con las variables anteriores, por lo que cambian de modo claro a oscuro sin rediseño. Se documentan aquí los que comparten la web y el móvil. Los componentes propios de cada plataforma se describen en la sección siguiente.

El botón se ofrece en cuatro estilos: Primary para la única acción principal de cada pantalla, Secondary para acciones de apoyo de igual importancia, Outline para alternativas de bajo peso y Danger para rechazar o descartar. Cada estilo tiene cinco estados, y todos miden 48 px de alto, lo que cumple el objetivo táctil de 44 px. En la imagen, las columnas son los estados Default, Hover, Pressed, Focus y Disabled, y las filas son los estilos.

<img src="./assets/ux_design/style/general/componente-button.png" alt="Componente Button con sus variantes" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 100mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

El campo de texto siempre muestra su etiqueta y no la reemplaza por el placeholder. Tiene los estados Default, Focus, Error y Disabled. En Error, el borde rojo se acompaña de un texto de ayuda que dice cómo corregir. Disabled se usa para datos de solo lectura, como los que llegan del sistema de Beneficiarios.

<img src="./assets/ux_design/style/general/componente-input.png" alt="Componente Input con sus estados" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 80mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

El Status chip muestra el estado de una ficha, que puede ser Borrador, En revisión, Aprobada, Observada o Alterada. Siempre lleva texto, y el punto de color es un refuerzo que se puede ocultar. No es interactivo.

<img src="./assets/ux_design/style/general/componente-status-chip.png" alt="Componente Status chip con sus cinco estados" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 40mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

La alerta es un mensaje en línea dentro de una pantalla, de tipo Info, Success, Warning o Error, y siempre incluye título y una indicación de qué hacer. El icono refuerza el color pero no lo reemplaza.

<img src="./assets/ux_design/style/general/componente-alert.png" alt="Componente Alert con sus cuatro tipos" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 70mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

La tarjeta es la superficie base que agrupa contenido relacionado. Tiene una variante Flat, con borde de 1 px, para paneles dentro de una pantalla, y una Raised, con sombra media, para elementos que flotan sobre otra capa, como popups y menús. Puede contener texto, campos y botones. No se usa para listas de fichas ni de borradores, que se presentan como filas de tabla.

<img src="./assets/ux_design/style/general/componente-card.png" alt="Componente Card con sus dos variantes" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 70mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
