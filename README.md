

<div style="page-break-after: always;"></div>

# Registro de Versiones del Informe



<div style="page-break-after: always;"></div>

# Project Report Collaboration Insights



<div style="page-break-after: always;"></div>

# Contenido

- [Carátula](#carátula)
- [Registro de Versiones del Informe](#registro-de-versiones-del-informe)
- [Project Report Collaboration Insights](#project-report-collaboration-insights)
- [Student Outcome](#student-outcome)
- [Capítulo I: Introducción](#capítulo-i-introducción)
  - [Startup Profile](#startup-profile)
    - [Descripción de la Startup](#descripción-de-la-startup)
    - [Perfiles de integrantes del equipo](#perfiles-de-integrantes-del-equipo)
  - [Solution Profile](#solution-profile)
    - [Antecedentes y problemática](#antecedentes-y-problemática)
    - [Lean UX Process](#lean-ux-process)
      - [Lean UX Problem Statements](#lean-ux-problem-statements)
      - [Lean UX Assumptions](#lean-ux-assumptions)
      - [Lean UX Hypothesis Statements](#lean-ux-hypothesis-statements)
      - [Lean UX Canvas](#lean-ux-canvas)
  - [Segmentos objetivo](#segmentos-objetivo)
- [Capítulo II: Requirements Elicitation & Analysis](#capítulo-ii-requirements-elicitation--analysis)
  - [Competidores](#competidores)
    - [Análisis competitivo](#análisis-competitivo)
    - [Estrategias y tácticas frente a competidores](#estrategias-y-tácticas-frente-a-competidores)
  - [Entrevistas](#entrevistas)
    - [Diseño de entrevistas](#needfinding-diseno)
    - [Registro de entrevistas](#needfinding-registro)
    - [Análisis de entrevistas](#análisis-de-entrevistas)
  - [Needfinding](#needfinding)
    - [User Personas](#user-personas)
    - [User Task Matrix](#user-task-matrix)
    - [Empathy Mapping](#empathy-mapping)
    - [As-is Scenario Mapping](#as-is-scenario-mapping)
  - [Ubiquitous Language](#ubiquitous-language)
- [Capítulo III: Requirements Specification](#capítulo-iii-requirements-specification)
  - [To-Be Scenario Mapping](#to-be-scenario-mapping)
  - [User Stories](#user-stories)
  - [Impact Mapping](#impact-mapping)
  - [Product Backlog](#product-backlog)
- [Capítulo IV: Strategic-Level Software Design](#capítulo-iv-strategic-level-software-design)
  - [Strategic-Level Attribute-Driven Design](#strategic-level-attribute-driven-design)
    - [Design Purpose](#design-purpose)
    - [Attribute-Driven Design Inputs](#attribute-driven-design-inputs)
      - [Primary Functionality (Primary User Stories)](#primary-functionality-primary-user-stories)
      - [Quality attribute Scenarios](#quality-attribute-scenarios)
      - [Constraints](#constraints)
    - [Architectural Drivers Backlog](#architectural-drivers-backlog)
    - [Architectural Design Decisions](#architectural-design-decisions)
    - [Quality Attribute Scenario Refinements](#quality-attribute-scenario-refinements)
  - [Strategic-Level Domain-Driven Design](#strategic-level-domain-driven-design)
    - [EventStorming](#eventstorming)
    - [Candidate Context Discovery](#candidate-context-discovery)
    - [Domain Message Flows Modeling](#domain-message-flows-modeling)
    - [Bounded Context Canvases](#bounded-context-canvases)
    - [Context Mapping](#context-mapping)
  - [Software Architecture](#software-architecture)
    - [Software Architecture System Landscape Diagram](#software-architecture-system-landscape-diagram)
    - [Software Architecture Context Level Diagrams](#software-architecture-context-level-diagrams)
    - [Software Architecture Container Level Diagrams](#software-architecture-container-level-diagrams)
    - [Software Architecture Deployment Diagrams](#software-architecture-deployment-diagrams)
- [Conclusiones](#conclusiones)
  - [Conclusiones y recomendaciones](#conclusiones-y-recomendaciones)
  - [Video About-The-Team](#video-about-the-team)
- [Bibliografía](#bibliografía)
- [Anexos](#anexos)
  - [Videos de Exposiciones](#videos-de-exposiciones)


<div style="page-break-after: always;"></div>

# Student Outcome



<div style="page-break-after: always;"></div>

# Capítulo I: Introducción

## Startup Profile

### Descripción de la Startup



<div style="page-break-after: always;"></div>

### Perfiles de integrantes del equipo



<div style="page-break-after: always;"></div>

## Solution Profile

### Antecedentes y problemática



<div style="page-break-after: always;"></div>

### Lean UX Process

#### Lean UX Problem Statements



<div style="page-break-after: always;"></div>

#### Lean UX Assumptions



<div style="page-break-after: always;"></div>

#### Lean UX Hypothesis Statements



<div style="page-break-after: always;"></div>

#### Lean UX Canvas



<div style="page-break-after: always;"></div>

## Segmentos objetivo



<div style="page-break-after: always;"></div>

# Capítulo II: Requirements Elicitation & Analysis

## Competidores

### Análisis competitivo



<div style="page-break-after: always;"></div>

### Estrategias y tácticas frente a competidores



<div style="page-break-after: always;"></div>

## Entrevistas

<h3 id="needfinding-diseno">Diseño de entrevistas</h3>



<div style="page-break-after: always;"></div>

<h3 id="needfinding-registro">Registro de entrevistas</h3>



<div style="page-break-after: always;"></div>

### Análisis de entrevistas



<div style="page-break-after: always;"></div>

## Needfinding

### User Personas

A continuación se presentan los artefactos de user persona elaborados para cada segmento objetivo.

**Agente de Campo**  
Representa a quien registra en campo la georreferenciación de las parcelas y la producción de los beneficiarios, bajo condiciones de conectividad limitada y acceso difícil. Su necesidad principal es no perder el registro capturado y poder sustentarlo ante cualquier cuestionamiento posterior, incluso cuando hoy no cuenta con un mecanismo oficial para hacerlo.

![User Persona: Agente de Campo](./assets/elicitation/needfinding/personas/user-persona-agente-de-campo.png)

**Personal Administrativo y de Gabinete**  
Representa a quien recibe, digitaliza, aprueba y consolida la información que llega desde campo, agrupando los roles de asistente administrativa, coordinador de aprobación y analista de consolidación identificados en las entrevistas. Su necesidad principal es poder confiar en un dato que no digitó personalmente y demostrar en cualquier momento de dónde proviene cada cifra que aprueba o reporta.

![User Persona: Personal Administrativo y de Gabinete](./assets/elicitation/needfinding/personas/user-persona-administrativo.png)

<div style="page-break-after: always;"></div>

### User Task Matrix

En esta sección se presenta el User Task Matrix, que consolida las tareas que realizan los dos User Persona construidos a partir del Needfinding: Marco Quispe Huamán (Agente de Campo) y Rocío Fernández Salas (Personal Administrativo y de Gabinete).Las tareas listadas corresponden a actividades que ambos segmentos realizan independientemente de la existencia de una solución de software, no se incluyen funcionalidades ni características de ningún sistema.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th rowspan="2" style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Tarea</th>
            <th colspan="2" style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Marco Quispe Huamán<br>Agente de Campo</th>
            <th colspan="2" style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Rocío Fernández Salas<br>Personal Administrativo y de Gabinete</th>
        </tr>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Frecuencia</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Importancia</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Frecuencia</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Importancia</th>
        </tr>
    </thead>
    <tbody>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Coordinar la visita con el beneficiario antes de ir a la parcela</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Trasladarse hasta la parcela</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Delimitar y medir el área de la parcela</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Capturar evidencia de la visita (fotos, firma y huella del beneficiario)</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Estimar y convertir la cantidad de producción declarada (sacos a kilos)</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Completar el acta de registro con los datos de la visita</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Entregar el acta y la evidencia a la oficina zonal</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Recibir y organizar las actas físicas que llegan de campo</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Digitalizar (escanear) las actas</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Verificar los datos del acta contra el sistema de beneficiarios</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Transcribir los datos del acta al sistema de consolidación</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Baja</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Detectar y resolver inconsistencias en los datos registrados</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Aprobar el expediente una vez verificado</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Consolidar los expedientes aprobados en el reporte de avance</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">—</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td></tr>
        <tr><td style="border: 1px solid #333; padding: 8px 10px;">Sustentar el origen de un dato registrado ante un cuestionamiento posterior</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Media</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Baja</td><td style="border: 1px solid #333; padding: 8px 10px; text-align: center;">Alta</td></tr>
    </tbody>
</table>
</div>

Para Marco, las tareas de mayor frecuencia e importancia combinadas son delimitar y medir la parcela, capturar la evidencia de la visita y completar el acta. Todo eso es el núcleo de su trabajo, requiere su criterio de campo y sustentación de su propia responsabilidad legal frente al beneficiario y la institución. Para Rocío, las de mayor peso son verificar los datos contra el sistema de beneficiarios y aprobar el expediente. Las tareas donde recae directamente su responsabilidad ("si yo le di conforme, es mío") y donde su experiencia acumulada marca la diferencia frente a alguien sin criterio formado.

La diferencia más notoria aparece en transcribir los datos al sistema, porque es una tarea de alta frecuencia para Rocío, pero de baja importancia respecto a sus propios objetivos, ya que no requiere su criterio y le consume el tiempo que preferiría dedicar a resolver observaciones pendientes o a analizar tendencias. Esto la convierte en la tarea con mayor potencial de automatización sin afectar el juicio experto de la persona. En el caso de Marco, estimar y convertir la producción combina una frecuencia media con una importancia alta y es, a la vez, su mayor fuente de error, ya que no existe un factor de conversión oficial entre sacos y kilos.

La coincidencia más relevante entre ambos segmentos es sustentar el origen de un dato registrado ante un cuestionamiento posterior. Ambos la consideran de alta importancia, pero ninguno cuenta hoy con un mecanismo confiable para resolverla. Marco depende de un cuaderno personal o de su memoria, en cambio, Rocío depende del acta física archivada como única prueba ante una auditoría. En términos generales, las tareas de ambos segmentos no se superponen en el proceso. Marco genera el dato en el origen (en campo), mientras que Rocío lo valida y consolida en oficina, solo convergen en la necesidad compartida de poder demostrar la trazabilidad de ese dato en cualquier momento.

<div style="page-break-after: always;"></div>

### Empathy Mapping

A continuación se presenta los Empathy Map de cada User persona, colocando a cada uno en el centro del lienzo. El equipo completó cada sección del lienzo (qué dice, qué piensa y siente, qué ve, qué hace, qué escucha, pains y gains) con observaciones extraídas directamente del análisis de las seis entrevistas de Needfinding correspondientes a cada segmento, evitando suposiciones sin respaldo en la investigación.

**Agente de Campo**  
El empathy map evidencia la tensión central de Marco entre confiar en un formato en papel que nunca falla y la necesidad de un respaldo digital que no le duplique el trabajo ni comprometa su responsabilidad frente a lo que registra.

![Empathy Map: Agente de Campo](assets/elicitation/needfinding/empathy/empathy-map-agente-de-campo.png)

**Personal Administrativo y de Gabinete**  
El empathy map recoge la tensión central de Rocío entre aprobar y consolidar información que no captura ella misma, y la falta de un mecanismo que le permita verificar el origen de cada dato antes de responsabilizarse por él.

![Empathy Map: Personal Administrativo y de Gabinete](assets/elicitation/needfinding/empathy/empathy-map-administrativo.png)

<div style="page-break-after: always;"></div>

### As-is Scenario Mapping

El As-Is Scenario Mapping se elaboró en Miro, con una preparación previa revisando el análisis de entrevistas, lluvia de ideas individual por fase (Doing, Thinking, Feeling) y una revisión conjunta donde se nombraron las fases y se etiquetó cada una con un punto de color. Verde indica una fase positiva para el usuario, amarillo una fase nuetral, y rojo una fase negativa. Se elaboró un mapa por cada User Persona, dividido en dos capturas por claridad.

**Agente de Campo**

![As-Is: Agente de Campo, parte 1](assets/elicitation/needfinding/as_is/as-is-agente-de-campo-01.png)

![As-Is: Agente de Campo, parte 2](assets/elicitation/needfinding/as_is/as-is-agente-de-campo-02.png)

Blank areas identificadas: qué tan seguido se cuestiona un dato antiguo y qué pasa cuando ocurre, qué tanta resistencia real hay entre agentes antiguos frente a uno más digital, y si existe una tabla oficial de conversión saco-kilo.

**Personal Administrativo y de Gabinete**

![As-Is: Personal Administrativo, parte 1](assets/elicitation/needfinding/as_is/as-is-administrativo-01.png)

![As-Is: Personal Administrativo, parte 2](assets/elicitation/needfinding/as_is/as-is-administrativo-02.png)

Blank areas identificadas: con qué frecuencia ocurre una observación de control interno, qué dice exactamente la directiva de seguridad sobre datos de beneficiarios en la nube, y si asistente, coordinador y analista coordinan directamente sobre un mismo expediente.

<div style="page-break-after: always;"></div>

## Ubiquitous Language

El siguiente glosario recoge los términos del dominio de negocio identificados a partir del análisis de entrevistas y de la descripción del programa de apoyo agrícola. Se excluyen deliberadamente términos técnicos de ingeniería de software: solo se incluyen conceptos que ya forman parte del lenguaje que usan a diario el personal del programa, los agentes de campo y los beneficiarios.

**Agricultural Input (Insumo agrícola)**  
Recurso o material que el programa entrega a un beneficiario registrado para el cultivo de su parcela.

**Approval (Aprobación)**  
Acto por el cual un responsable autorizado da conformidad a un expediente ya verificado, habilitándolo para ser consolidado en el reporte institucional.

**Beneficiary (Beneficiario)**  
Productor registrado en el programa que recibe insumos agrícolas y reporta periódicamente la producción obtenida de su parcela.

**Case File (Expediente)**  
Conjunto de documentos y datos referidos a un registro o reporte de un beneficiario, que debe quedar completo y verificado antes de ser aprobado.

**Chain of Custody (Cadena de responsabilidad)**  
Identificación clara de la persona responsable de un dato en cada etapa del proceso, desde su captura en campo hasta su aprobación.

**Conversion Factor (Factor de conversión)**  
Relación utilizada para convertir la cantidad de producción declarada por el beneficiario en una unidad informal (como el saco) a la unidad oficial de reporte (kilogramos).

**Field Act (Acta de campo)**  
Documento que registra los datos de una visita de campo: delimitación de la parcela, producción evaluada, y la firma y huella del beneficiario.

**Field Agent (Agente de Campo)**  
Persona encargada de visitar las parcelas de los beneficiarios para verificar su existencia, delimitarlas y registrar la producción declarada.

**Geomesh (Geomalla)**  
Conjunto de las parcelas georreferenciadas de todos los beneficiarios del programa.

**Institutional Operational Plan / POI (Plan Operativo Institucional)**  
Plan anual que traduce los objetivos estratégicos del programa en metas medibles, contra el cual se reporta el avance periódico.

**Institutional Strategic Plan / PEI (Plan Estratégico Institucional)**  
Plan de mediano plazo que define los objetivos estratégicos del programa, base sobre la que se construye el Plan Operativo Institucional.

**Internal Control Observation (Observación de control interno)**  
Hallazgo formal levantado por el área de control interno de la entidad ante una discrepancia entre el dato reportado y su documento de respaldo.

**Parcel (Parcela)**  
Unidad de terreno registrada a nombre de un beneficiario dentro del programa.

**Parcel Boundary (Delimitación de parcela)**  
Contorno geográfico que define el área de una parcela registrada.

**Production Report (Reporte de producción)**  
Documento que el beneficiario presenta periódicamente, declarando la cantidad de producción obtenida en su parcela registrada.

**Progress Report (Reporte de avance)**  
Informe periódico que consolida los indicadores del programa y se presenta a la gerencia para seguimiento del Plan Operativo Institucional.

**Sack (Saco)**  
Unidad informal en la que el beneficiario suele declarar la cantidad de producción obtenida, antes de ser convertida a la unidad oficial de reporte.

**Yield (Producción)**  
Cantidad de producto agrícola obtenida en una parcela durante un periodo de evaluación.

**Zonal Office (Oficina zonal)**  
Unidad administrativa intermedia entre el trabajo de campo y la sede central del programa, por donde pasan las actas antes de llegar a consolidación.

<div style="page-break-after: always;"></div>

# Capítulo III: Requirements Specification

## To-Be Scenario Mapping



<div style="page-break-after: always;"></div>

## User Stories



<div style="page-break-after: always;"></div>

## Impact Mapping



<div style="page-break-after: always;"></div>

## Product Backlog



<div style="page-break-after: always;"></div>

# Capítulo IV: Strategic-Level Software Design

## Strategic-Level Attribute-Driven Design

### Design Purpose



<div style="page-break-after: always;"></div>

### Attribute-Driven Design Inputs

#### Primary Functionality (Primary User Stories)



<div style="page-break-after: always;"></div>

#### Quality attribute Scenarios



<div style="page-break-after: always;"></div>

#### Constraints



<div style="page-break-after: always;"></div>

### Architectural Drivers Backlog



<div style="page-break-after: always;"></div>

### Architectural Design Decisions



<div style="page-break-after: always;"></div>

### Quality Attribute Scenario Refinements



<div style="page-break-after: always;"></div>

## Strategic-Level Domain-Driven Design

### EventStorming



<div style="page-break-after: always;"></div>

### Candidate Context Discovery



<div style="page-break-after: always;"></div>

### Domain Message Flows Modeling



<div style="page-break-after: always;"></div>

### Bounded Context Canvases



<div style="page-break-after: always;"></div>

### Context Mapping



<div style="page-break-after: always;"></div>

## Software Architecture

### Software Architecture System Landscape Diagram



<div style="page-break-after: always;"></div>

### Software Architecture Context Level Diagrams



<div style="page-break-after: always;"></div>

### Software Architecture Container Level Diagrams



<div style="page-break-after: always;"></div>

### Software Architecture Deployment Diagrams



<div style="page-break-after: always;"></div>

# Conclusiones

## Conclusiones y recomendaciones



<div style="page-break-after: always;"></div>

## Video About-The-Team



<div style="page-break-after: always;"></div>

# Bibliografía



<div style="page-break-after: always;"></div>

# Anexos

## Videos de Exposiciones



<div style="page-break-after: always;"></div>

