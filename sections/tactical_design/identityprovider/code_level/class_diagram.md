El siguiente diagrama de clases UML muestra la capa de dominio de Identity Provider. Se elaboró en LucidChart.

<img src="assets/tactical_design/identityprovider/code_level/class_diagram/domain.png" alt="Diagrama de clases de la capa de dominio de identityprovider" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Los dos agregados se relacionan a través de ResourceIdentifier: una aplicación referencia por identificador las API a las que está vinculada. El secreto de ClientRegistration tiene multiplicidad 0..1, porque solo los clientes confidenciales lo tienen.
