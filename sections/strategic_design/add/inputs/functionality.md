Se identifica las funcionalidades prioritarias para el usuario, con las cuales se trabajara para identificar los atributos de calidad en secciones posteriores.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Epic / Story ID</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Título</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Descripción</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Criterios de Aceptación</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Relacionado con (Epic ID)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-2</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Visualizar con antelación los puntos capturados por la estación total durante la visita</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como agente de campo georreferenciador, quiero visualizar en el dispositivo los puntos que ya fueron capturados por la estación total mientras recorro el terreno, para detectar y corregir errores de medición antes de finalizar la visita.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">
                <ul>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Visualización de puntos capturados sin anomalías<br>
                        <strong>Given</strong> el agente de campo se encuentra en el terreno del beneficiario<br>
                        <strong>When</strong> la estación total envía la totalidad de los puntos del terreno<br>
                        <strong>Then</strong> el sistema muestra la posición de cada punto capturado en el mapa<br>
                    </li>
                </ul>
            </td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">EP-01</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-3</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Subir la ficha diligenciada para su almacenamiento y verificación de integridad</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como agente de campo, quiero subir la ficha en formato PDF una vez finalizada la visita, para contar con un respaldo verificable de que quedó registrada tal como la firmé.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">
                <ul>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Subida de la ficha<br>
                        <strong>Given</strong> el agente de campo completó el diligenciamiento físico de la ficha<br>
                        <strong>When</strong> el agente sube la ficha en formato PDF<br>
                        <strong>Then</strong> el sistema almacena el archivo y calcula su hash de integridad<br>
                        <strong>And</strong> notifica al agente que la ficha quedó registrada<br>
                    </li>
                    <!-- Criterio NON-BDD -->
                    <li>El agente puede consultar en cualquier momento el estado de la ficha subida, sin depender de que otra persona se lo confirme.</li>
                </ul>
            </td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">EP-02</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-5</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Revisar los campos críticos extraídos al validar una ficha</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero revisar los campos que el sistema extrajo automáticamente de la ficha antes de aprobarla, para confirmar que coinciden con lo que el documento realmente dice.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">
                <ul>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Extracción coincide con el documento<br>
                        <strong>Given</strong> el asistente de gerencia general está revisando una ficha cuyos campos ya fueron extraídos automáticamente<br>
                        <strong>When</strong> el asistente compara cada campo extraído contra el documento<br>
                        <strong>Then</strong> el sistema le permite confirmar el campo como correcto<br>
                    </li>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Extracción no coincide con el documento<br>
                        <strong>Given</strong> el asistente de gerencia general está revisando una ficha cuyos campos ya fueron extraídos automáticamente<br>
                        <strong>When</strong> el asistente detecta que un campo extraído no corresponde a lo que dice el documento<br>
                        <strong>Then</strong> el sistema le permite corregir ese campo<br>
                    </li>
                    <!-- Criterio NON-BDD -->
                    <li>El asistente puede ver el documento y el campo extraído uno al lado del otro, sin tener que alternar entre pantallas.</li>
                    <!-- Criterio NON-BDD -->
                    <li>Un campo se considera corregido manualmente si el usuario ingresa un valor diferente del propuesto por la IA.</li>
                </ul>
            </td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">EP-03</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-6</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Verificar la integridad del documento digitalizado al validar una ficha</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero saber si el documento presentado como evidencia de una tarea sigue siendo el mismo que se subió, para no aprobar uno que fue alterado después.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">
                <ul>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Documento inalterado<br>
                        <strong>Given</strong> el asistente de gerencia general va a validar la ficha presentada como evidencia de haber completado la tarea<br>
                        <strong>And</strong> el archivo no ha sido modificado desde que se subió<br>
                        <strong>When</strong> el asistente inicia la validación del documento<br>
                        <strong>Then</strong> el sistema confirma que el documento es íntegro<br>
                    </li>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Documento alterado<br>
                        <strong>Given</strong> el asistente de gerencia general va a validar la ficha presentada como evidencia de haber completado la tarea<br>
                        <strong>And</strong> el archivo fue modificado después de haberse subido<br>
                        <strong>When</strong> el asistente inicia la validación del documento<br>
                        <strong>Then</strong> el sistema advierte que el documento fue modificado después de subido<br>
                        <strong>And</strong> bloquea la aprobación de la ficha hasta que se resuelva la discrepancia<br>
                    </li>
                </ul>
            </td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">EP-03</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-10</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Iniciar sesión con credenciales institucionales</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como usuario del sistema, quiero iniciar sesión con mi usuario y contraseña, para acceder solo a las funciones correspondientes a mi rol.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">
                <ul>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Credenciales válidas<br>
                        <strong>Given</strong> el usuario cuenta con una cuenta activa en el sistema<br>
                        <strong>When</strong> ingresa su usuario y contraseña correctos<br>
                        <strong>Then</strong> el sistema le da acceso a las funciones correspondientes a su rol<br>
                    </li>
                    <!-- Criterio BDD -->
                    <li>
                        <strong>Scenario:</strong> Credenciales inválidas<br>
                        <strong>Given</strong> el usuario cuenta con una cuenta activa en el sistema<br>
                        <strong>When</strong> ingresa un usuario o contraseña incorrectos<br>
                        <strong>Then</strong> el sistema deniega el acceso<br>
                        <strong>And</strong> le indica que las credenciales no son válidas<br>
                    </li>
                    <!-- Criterio NON-BDD -->
                    <li>El sistema no distingue si el error corresponde al usuario o a la contraseña, para no dar pistas ante intentos de acceso no autorizados.</li>
                </ul>
            </td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">EP-05</td>
        </tr>
    </tbody>
</table>
</div>
