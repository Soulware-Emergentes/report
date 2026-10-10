El siguiente diagrama de clases UML muestra el lenguaje publicado de People, que constituye su capa de dominio. Se elaboró en LucidChart.

<img src="assets/tactical_design/people/code_level/class_diagram/domain.png" alt="Diagrama de clases de la capa de dominio de people" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Cada perfil compone la identidad de la persona que describe: BeneficiaryProfile compone un BeneficiaryLegalDocument, y los perfiles del personal componen su identidad tipada. El tipo de documento valida el formato del número con su propio patrón.
