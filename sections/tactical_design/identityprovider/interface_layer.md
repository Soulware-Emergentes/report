El proveedor de identidad expone los endpoints estándar de OAuth 2.1 y OpenID Connect a través de Spring Authorization Server, configurado en la capa de infraestructura, y un formulario de inicio de sesión. Las aplicaciones públicas inician sesión en nombre de las personas con el flujo authorization code con PKCE; las aplicaciones confidenciales, como sgt, obtienen tokens para sí mismas con el flujo client credentials.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Endpoint</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 60%;">Uso</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /oauth2/authorize</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Inicia el flujo authorization code de una persona.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET, POST /login</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Muestra y procesa el formulario de inicio de sesión.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /oauth2/token</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Emite tokens de acceso, de identidad y de actualización.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /oauth2/jwks</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Publica la clave con la que se firman los tokens, para que las API los validen.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /.well-known/openid-configuration</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Publica la configuración del emisor.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /userinfo</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve los datos de la persona autenticada.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /connect/logout</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cierra la sesión de la persona.</td>
        </tr>
    </tbody>
</table>
</div>

Un inicio de sesión nombra una sola API y, opcionalmente, el rol con el que la persona va a actuar. El token de acceso de una persona lleva como sujeto su objectGUID, en roles el rol activo y en eligible_roles todos los roles que sus grupos tienen en esa API, para que el frontend ofrezca cambiar de rol. El token de un servicio lleva como sujeto su client id y en scope solo lo que se le otorgó. La claim token_use distingue ambos tipos, y cada API decide cuál acepta.
