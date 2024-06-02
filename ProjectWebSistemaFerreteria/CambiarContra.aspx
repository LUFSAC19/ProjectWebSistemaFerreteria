<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarContra.aspx.vb" Inherits="ProjectWebSistemaFerreteria.CambiarContra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cambiar Contraseña</title>
    <link href="login.css" rel="stylesheet" />
</head>
<body>
    <div class="contenedor-formularios">
        <input type="checkbox" name="check-slider" id="check-slider"/>
        <form class="contenedor-cambiar-contraseña" runat="server" >
            <h1 style="font-size: 29px; margin: 10px 0 0 0;">CAMBIAR CONTRASEÑA</h1>
            <div class="contenedor-input">
                <img src="https://img.icons8.com/ios-glyphs/50/document--v1.png"
                    alt="imagen"/>
                
                <asp:TextBox runat="server" type="text" name="DNI" id="txtDNI"></asp:TextBox>
                <label for="DNI">DNI</label>
            </div>
            <div class="contenedor-input">
                <img src="https://img.icons8.com/metro/26/password.png"
                    alt="imagen"/>
                <asp:TextBox runat="server" name="nueva-contraseña" id="txtNuevaContraseña"></asp:TextBox>
                <label for="nueva-contraseña">Nueva contraseña</label>
            </div>
            <div class="contenedor-input" style="margin-bottom: 3px;">
                <img src="https://img.icons8.com/ios-glyphs/30/good-pincode.png" alt="good-pincode"
                    />
                <asp:TextBox runat="server" type="text" name="confirmar-contraseña" id="txtConfirmarContraseña"></asp:TextBox>
                
                <label for="confirmar-contraseña">Confirmar contraseña</label>
            </div>
            <asp:Button CssClass="button" ID="btnCambiar" runat="server" Text="Cambiar contraseña" OnClick="btnCambiar_Click"></asp:Button>
            
            <asp:LinkButton for="check-slider" ID="btnRegresar" runat="server" CssClass="link-regresar-login" OnClick="btnRegresar_Click">Ir a iniciar sesión</asp:LinkButton>

        </form>
    </div>
</body>
</html>
