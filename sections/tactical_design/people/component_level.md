El siguiente diagrama de componentes del modelo C4 muestra los componentes de People dentro de la API de SGT y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-People del workspace de la solución.

<img src="assets/tactical_design/people/component_level/components.png" alt="Diagrama de componentes de People" style="display: block; width: 100%; height: auto; margin: 0 auto;">

PeopleApiService es la entrada del módulo para los demás módulos de sgt. Delega en los servicios de consulta, que buscan beneficiarios en el registro de Beneficiarios y personal en el directorio de Staff a través de clientes HTTP. Ambos clientes obtienen su token de servicio de OAuth2ServiceTokens.
