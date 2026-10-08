El siguiente diagrama de clases UML muestra la capa de dominio de Directory, junto con su lenguaje publicado. Se elaboró en LucidChart.

<img src="assets/tactical_design/directory/code_level/class_diagram/domain.svg" alt="Diagrama de clases de la capa de dominio de directory" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Person compone su identidad y los objetos de valor que la describen, con multiplicidad 0..1 para el hash de contraseña, que falta en las personas que no inician sesión. PersonProfile es la vista de la persona que el módulo entrega a otros.
