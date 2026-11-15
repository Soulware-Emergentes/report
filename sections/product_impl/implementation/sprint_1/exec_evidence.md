Durante el Sprint 1 se incorporaron las primeras pantallas de la aplicación web SGT para el acceso institucional y la gestión visual de terrenos. La evidencia presenta la interfaz ejecutada en un navegador de escritorio en el entorno local, disponible en http://localhost:4200/. Las vistas mantienen el logotipo institucional, la navegación lateral y los estilos definidos para la aplicación.

La pantalla de bienvenida introduce el acceso a SGT y ofrece la acción Iniciar sesión con la cuenta institucional. Su composición concentra el logotipo de DEPRO, el mensaje de bienvenida y el botón principal en una tarjeta central.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/execution/01-bienvenida.jpg" alt="Figura 1. Pantalla de bienvenida de la aplicación web SGT." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 1. Pantalla de bienvenida de la aplicación web SGT.</p>
</div>

La vista del mapa organiza el espacio de trabajo alrededor de la representación territorial. El menú lateral permite acceder a Mapa y Sesión, y puede contraerse para ampliar el área visible. Sobre el mapa se muestran los controles de acercamiento, alejamiento y orientación, junto con el acceso a Crear terreno.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/execution/03-mapa-terrenos.jpg" alt="Figura 2. Pantalla del mapa con navegación lateral y controles territoriales." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 2. Pantalla del mapa con navegación lateral y controles territoriales.</p>
</div>

El diálogo Crear terreno reúne los datos del beneficiario y la medición del perímetro. A la izquierda se muestran el tipo y número de documento, el nombre del beneficiario, el área estimada y la vista previa. A la derecha se distribuyen la zona de carga de archivos de estación total y la tabla para ingresar los vértices manualmente, con coordenadas Este y Norte en UTM WGS 84, zona 18S. El formulario incluye acciones para agregar o quitar vértices y continuar con Ver en el mapa.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/execution/04-formulario-terreno.jpg" alt="Figura 3. Diálogo Crear terreno: datos del beneficiario, carga de archivo y coordenadas del perímetro." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 3. Diálogo Crear terreno: datos del beneficiario, carga de archivo y coordenadas del perímetro.</p>
</div>

La siguiente captura muestra el formulario con datos de muestra del entorno de desarrollo. El campo del beneficiario presenta el nombre asociado al documento ingresado, mientras que tres vértices definen un contorno triangular. La interfaz representa ese contorno en la vista previa y muestra un área estimada de 0.50 ha, permitiendo revisar visualmente la información antes de continuar.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/execution/05-perimetro-calculo-area.jpg" alt="Figura 4. Formulario con beneficiario de muestra, perímetro triangular y área estimada de 0.50 ha." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 4. Formulario con beneficiario de muestra, perímetro triangular y área estimada de 0.50 ha.</p>
</div>

Estas pantallas corresponden al alcance visual implementado en la aplicación web durante el Sprint 1: acceso, navegación territorial y captura de los datos de un terreno. La evidencia de esta sección se concentra en la presentación de las vistas y sus componentes.
