# Carátula



# Registro de Versiones del Informe



# Project Report Collaboration Insights



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


# Student Outcome



# Capítulo I: Introducción

## Startup Profile

### Descripción de la Startup



### Perfiles de integrantes del equipo



## Solution Profile

### Antecedentes y problemática



### Lean UX Process

#### Lean UX Problem Statements



#### Lean UX Assumptions



#### Lean UX Hypothesis Statements



#### Lean UX Canvas



## Segmentos objetivo



# Capítulo II: Requirements Elicitation & Analysis

## Competidores

### Análisis competitivo



### Estrategias y tácticas frente a competidores



## Entrevistas

<h3 id="needfinding-diseno">Diseño de entrevistas</h3>



<h3 id="needfinding-registro">Registro de entrevistas</h3>



### Análisis de entrevistas



## Needfinding

### User Personas



### User Task Matrix



### Empathy Mapping



### As-is Scenario Mapping



## Ubiquitous Language



# Capítulo III: Requirements Specification

## To-Be Scenario Mapping



## User Stories



## Impact Mapping



## Product Backlog



# Capítulo IV: Strategic-Level Software Design

## Strategic-Level Attribute-Driven Design

### Design Purpose

El fin del diseño actual tiene como propósito plantear una arquitectura adecuada a las necesidades del usuario y su contexto. Por ello, se observaran patrones y tecnologías legadas en ciertas capas de la arquitectura, lo cual corresponde a componentes necesarios y que son core de la entidad.

### Attribute-Driven Design Inputs

#### Primary Functionality (Primary User Stories)

Se identifica las funcionalidades prioritarias para el usuario, con las cuales se trabajara para identificar los atributos de calidad en secciones posteriores.

| Epic / User Story ID | Título | Descripción | Criterios de aceptación | Relación con Epic ID |
| - | - | - | - | - |
|  |  |  |  |  |

#### Quality attribute Scenarios

| Atributo | Fuente | Estímulo | Artefacto | Entorno | Respuesta | Medida |
| - | - | - | - | - | - | - |
| Seguridad | Externo | Tratar de modificar informe de beneficiario | Informe protegido con Blockchain | Operatividad | Veces que el documento original se modifico sin aprobación | = 0 |
| Usabilidad | Usuario | Consulta de terreno de beneficiarios por primera vez | Mapa interactivo | Operatividad | Tiempo para entender el flujo de consulta | <5 minutos |
| Interoperabilidad | Sistema | Consulta de información a otros sistemas | API de integración | Operatividad | Sistemas con los que interopera GEODAIS | > 1 |


#### Constraints

| Technical Story ID | Título | Descripción | Criterios de aceptación | Relación con Epic ID | 
| - | - | - | - |
|  |  |  |  |

### Architectural Drivers Backlog



### Architectural Design Decisions



### Quality Attribute Scenario Refinements



## Strategic-Level Domain-Driven Design

### EventStorming

A continuación se detalla el proceso de EventStorming seguido por el equipo para la identificación de contextos.

En primer lugar, se identificaron los eventos correspondientes al dominio. 
![EventStorming step 1](eventstorming.assets/eventstorming-1.png)

Posteriormente esos eventos se ordenaron secuencialmente de izquierda a derecha.
![EventStorming step 2](eventstorming.assets/eventstorming-2.png)

Como siguiente paso se procedió a identificar los comandos que desencadenan los eventos identificados. En nuestro caso, solo un evento era desencadenado por otro, luego todos eran desencadenados por comandos.
![EventStorming step 3](eventstorming.assets/eventstorming-3.png)

Continuando con los pasos, identificamos los roles asociados a los comandos, es decir, sus ejecutantes. En este paso aparecieron, obviamente, el agente de campo y los asesores de Gerencia General. También apareció el sistema como un rol, ya que es el que ejecuta algunos comandos dentro del flujo.
![EventStorming step 4](eventstorming.assets/eventstorming-4.png)

En consecuencia, habiendo identificado los roles, identificamos las politicas del dominio. En este caso, siendo la coherencia que existe entre un terreno y su dueño, y el beneficiario al que se le hace seguimiento.
![EventStorming step 5](eventstorming.assets/eventstorming-5.png)

Luego, identificamos los sistemas externos con los cuales se comunica SGP, en este caso siendo el sistema de beneficiarios (sistema que permitirá conocer la información de los beneficiarios de la entidad), sistema POI (sistema al cual se hara un envío de información por cada ficha validada) y el modelo de IA (que se representa como un sistema externo debido a su naturaleza).
![EventStorming step 6](eventstorming.assets/eventstorming-6.png)

Habiendo identificado ello, analizamos y detallamos las vistas que influirian en el sistema. En este paso ya detallamos el uso de la web y la aplicación móvil.
![EventStorming step 7](eventstorming.assets/eventstorming-7.png)

Como uno de los últimos pasos, identificamos los agregados en base a lo planteado hasta el momento. En este caso, Terreno y Ficha vendrían a ser los agregados del dominio.
![EventStorming step 8](eventstorming.assets/eventstorming-8.png)

Para concluir el proceso de EventStorming, identificamos los contextos vinculados al planteo del equipo. En primer lugar, y más importantes (ya que serán los que vamos a desarrollar nosotros) se encuentran el contexto de SGP y el contexto de IA. Mientras que los contextos de Beneficiarios y POI representan contextos con los cuales SGP se va a comunicar, más no se mapea a detalle esos contextos, ya que no estan dentro del alcance.
![EventStorming step 9](eventstorming.assets/eventstorming-9.png)


### Candidate Context Discovery

Como parte del proceso de EventStorming, paralelamente se fue barajando los posibles contextos a desarrollar. 

Sin embargo, debido a la naturaleza del SGP y su alcance acotado, los contextos identificados (y finales) fueron determinados rapidamente.

### Domain Message Flows Modeling

Para ejemplificar como cada contexto se vincula y comunica uno con otro detallamos los 3 flujos más representativos de SGP.

En primer lugar, mapeamos el flujo que tiene un asistente de campo para el mapeo de un terreno dentro del sistema web. Lo que hace aquí es crear un espacio virtual con las coordenadas reales del terreno del beneficiario. Obviamente este proceso se realiza dentro del contexto del SGP, sin embargo, tiene una comunicación con el contexto de beneficiarios para hacer el match entre el DNI de beneficiario que llega para el mapeo del terreno con el beneficiario que ya se encuentra dentro del sistema de beneficiarios. El terreno solo se crea si el beneficiario se encuentra en el sistema de beneficiarios.
![Mapear terreno](message_flows.assets/mapear-terreno.jpg)

En segundo lugar, se mapeo el flujo de mandar la ficha. El proceso empieza con el asistente de campo tomando foto con la aplicación móvil a la ficha realizada en campo, esta ficha viaja al contexto del SGP y este la traslada al contexto de la IA, donde se analiza y extrae la información de la foto. Al procesar ello, el contexto SGP guarda la información y ya esta disponible para validación de asesores de Gerencia General.
![Mandar ficha](message_flows.assets/mandar-ficha.jpg)

Finalmente, se mapeo el flujo de validar una ficha, en el cual se involucra los asesores de Gerencia General, quienes a través de la web observan la información extraída por el modelo de IA y la imagen real. En caso se valide exitosamente la ficha, se envia esa información al contexto POI para contribuir al avance de una actividad.
![Validar ficha](message_flows.assets/validar-ficha.jpg)

### Bounded Context Canvases

Como parte del analisis de los contextos identificados se desarrollo su canvas respectivo.

En primer lugar se analizo el contexto SGP. Este contexto es el CORE del sistema, interactua directamente con el Frontend del usuario proporcionando todos los endpoints del sistema. Además se comunica con los contextos de Beneficiarios, POI y el modelo de IA.
![Contexto SGP](bc_canvases.assets/sgp.jpg)

Luego se analizo el contexto de Beneficiarios, que se trata de un contexto externo. Este contexto, tiene como único propósito dentro del sistema, proporcionar información de los beneficiarios. Se comunica con el contexto SGP.
![Contexto Beneficiarios](bc_canvases.assets/beneficiarios.jpg)

A su vez se analizo el contexto de POI, este contexto, al igual que el anterior, es un contexto externo. Tiene como único propósito recibir información sobre las fichas validadas por asesoria de Gerencia General. 
![Contexto POI](bc_canvases.assets/poi.jpg)

Finalmente, el contexto de IA es una mejora al proceso actual. Es meramente tecnologico y busca reducir la carga operativa de Gerencia General. Tiene como propósito analizar las fichas a través de fotos, extraer su información relevante y permitir su validación con Gerencia General.
![Contexto IA](bc_canvases.assets/ia.jpg)

### Context Mapping

Habiendo mapeado los contextos involucrados en SGP, se definió su comunicación. 

El contexto SGP se comunica tanto con Beneficiarios, POI y el modelo de IA.
Todas las comunicaciones siguen el patrón Customer/Supplier. Siendo, en todos los casos SGP el Customer.

La relación del contexto de SGP con el contexto de Beneficiarios es sencilla. SGP consume un endpoint (OHS) del contexto de Beneficiarios y mediante un ACL rescata lo estrictamente necesario para el sistema.

La relación del contexto SGP con el contexto de POI sigue el mismo patrón, sin embargo, SGP no pide información, sino que la envía. En este caso, el contexto de SGP prepara un recurso con los lineamientos del POST (OHS) del sistema POI y envía un avance para una actividad.

Finalmente, la comunicación entre el contexto SGP con el contexto de IA es a través de un endpoint (OHS), el modelo de IA recibe la imagen, extrae los datos y los manda en un formato que SGP ya conoce. Por tanto, SGP no necesita modificar lo que llega al contexto (CNF).
![Context Mapping](mapping.assets/context-mapping.png)

## Software Architecture

### Software Architecture System Landscape Diagram



### Software Architecture Context Level Diagrams



### Software Architecture Container Level Diagrams



### Software Architecture Deployment Diagrams



# Conclusiones

## Conclusiones y recomendaciones



## Video About-The-Team



# Bibliografía



# Anexos

## Videos de Exposiciones



