El siguiente diagrama de componentes del modelo C4 muestra los componentes de Beneficiarios dentro de la API de Beneficiarios y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-Beneficiarios del workspace de la solución.

<img src="assets/tactical_design/beneficiarios/component_level/components.png" alt="Diagrama de componentes de Beneficiarios" style="display: block; width: 100%; height: auto; margin: 0 auto;">

BeneficiaryController atiende las consultas de la API de SGT y las dirige a BeneficiaryQueryService, que lee con JdbcBeneficiaryProjection. La API valida el token de servicio de SGT con la clave que publica Staff. Al iniciar, BeneficiarySeeder carga los beneficiarios de prueba en una base de datos vacía.
