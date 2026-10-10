La capa de dominio de Planning se presenta en dos diagramas de clases UML, uno por agregado. Se elaboraron en LucidChart.

El primer diagrama muestra el agregado Plan. Plan compone sus objetivos y cada objetivo compone sus actividades, con multiplicidad 0..* porque se definen después del plan.

<img src="assets/tactical_design/planning/code_level/class_diagram/domain-plan.png" alt="Diagrama de clases del agregado Plan" style="display: block; width: 85%; height: auto; margin: 0 auto;">

El segundo diagrama muestra el agregado Task. Task referencia a su actividad por identidad, ya que pertenece al agregado Plan, y BeneficiaryFollowUpTask la especializa.

<img src="assets/tactical_design/planning/code_level/class_diagram/domain-task.png" alt="Diagrama de clases del agregado Task" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Name y Description aparecen como tipos de los atributos, sin clase propia en los diagramas.
