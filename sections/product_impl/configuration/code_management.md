El equipo usa Git como sistema de control de versiones y GitHub como plataforma, bajo la organización Soulware-Emergentes. Cada API tiene su propio repositorio, que incluye el proyecto y sus pruebas, y el informe tiene uno aparte:
- SGT API: https://github.com/Soulware-Emergentes/sgt
- POI API: https://github.com/Soulware-Emergentes/poi
- Staff (identity provider y directorio): https://github.com/Soulware-Emergentes/staff
- Beneficiarios API: https://github.com/Soulware-Emergentes/beneficiarios
- Informe del proyecto: https://github.com/Soulware-Emergentes/report

El flujo de trabajo sigue GitFlow, según el modelo de Vincent Driessen. Cada repositorio mantiene dos ramas permanentes:
- main contiene solo versiones liberadas. Cada merge a main corresponde a un release y se etiqueta con su número de versión.
- develop integra el trabajo terminado que irá en el siguiente release. Es la rama base de todo feature.

Sobre ellas se crean ramas temporales, cada una con su convención de nombre:
- Feature branches: feature/nombre-corto, en inglés o español y en kebab-case, por ejemplo feature/core o feature/capitulo-7. Salen de develop y vuelven a develop mediante una pull request.
- Release branches: release/vX.Y.Z, con el número de versión que se va a liberar. Salen de develop cuando el sprint cierra su alcance, admiten solo correcciones, y se integran a main y a develop.
- Hotfix branches: hotfix/nombre-corto, por ejemplo hotfix/anexo-video-tb1. Salen de main para corregir una versión ya liberada, se integran a main y a develop, y aumentan la versión de parche.

Los releases se numeran con Semantic Versioning 2.0.0, en el formato MAJOR.MINOR.PATCH. MAJOR aumenta cuando un cambio rompe la compatibilidad de una API con sus consumidores, MINOR cuando se agrega funcionalidad compatible, y PATCH cuando solo se corrigen errores. La etiqueta de Git de cada release lleva el prefijo v, por ejemplo v1.2.0.

Los mensajes de commit siguen Conventional Commits, con la forma tipo(alcance): descripción. El alcance es el módulo afectado, que en las APIs coincide con el bounded context (monitoring, plots, planning, registry, directory, identityprovider) o con shared para el kernel compartido. La descripción va en inglés, en modo imperativo y en minúsculas. Los tipos usados son:
- feat: agrega funcionalidad, por ejemplo feat(planning): page, filter and sort the task list.
- fix: corrige un error.
- refactor: cambia la estructura del código sin cambiar su comportamiento, por ejemplo refactor(plots): hold the registration date as a value object.
- test: agrega o modifica pruebas.
- docs: modifica documentación.
- style: cambia el formato o los nombres sin afectar la lógica.
- build: cambia la construcción o las dependencias, por ejemplo build(deps): add the OAuth2 resource server starter.
- ci: cambia los workflows de integración continua.
- chore: tareas de mantenimiento que no encajan en los tipos anteriores.

Ningún cambio llega a develop ni a main sin pull request. En las APIs, el workflow de GitHub Actions ejecuta las pruebas que no necesitan base de datos en cada push a cualquier rama, y la suite completa, con PostgreSQL en un contenedor, en cada pull request y en cada push a main y develop. En el informe, cada push a main o develop reconstruye el documento con mdm y abre una pull request con el resultado desde una rama mdm-build/rama-destino.
