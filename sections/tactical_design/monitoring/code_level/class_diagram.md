El siguiente diagrama de clases UML muestra la capa de dominio de Monitoring, junto con las identidades que toma del lenguaje publicado de People. Se elaboró en LucidChart.

<img src="assets/tactical_design/monitoring/code_level/class_diagram/domain.png" alt="Diagrama de clases de la capa de dominio de monitoring" style="display: block; width: 85%; height: auto; margin: 0 auto;">

FieldSheet compone todos sus objetos de valor: la identidad, el código de ficha, el código de tarea, el estado, el PDF escaneado y los insumos confirmados. Las fechas aparecen como atributos tipados con sus objetos de valor, sin clase propia en el diagrama. FieldSheetCode compone el año de envío en el que se numera. Las personas se referencian por identidad, con multiplicidad 0..1 para el beneficiario y el revisor, porque solo se conocen tras la revisión. Las interfaces TaskLedger y ScanStore expresan lo que el dominio necesita de poi y del almacén de objetos sin depender de su implementación.
