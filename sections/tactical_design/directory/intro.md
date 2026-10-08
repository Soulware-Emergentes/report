Directory es el módulo del servicio staff que representa el directorio de personal de la organización. Responde las mismas preguntas que respondería un directorio LDAP: si una contraseña abre una cuenta, quiénes son ciertas personas y a qué grupos pertenece una persona. Las personas y los grupos se identifican por el objectGUID de su cuenta.

Sus consumidores son el módulo Identity Provider, que lo usa para autenticar a quien inicia sesión y para armar sus tokens, y el módulo People de sgt, que resuelve las identidades del personal en datos para mostrar.
