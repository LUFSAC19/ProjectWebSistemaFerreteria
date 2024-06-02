<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="login.css" rel="stylesheet" />

</head>


<body>
    <div class="contenedor-formularios">
        <input type="checkbox" name="check-slider" id="check-slider"/>
        <form class="contenedor-login" runat="server">
            <h1>INICIO DE SESIÓN</h1>
            <div class="contenedor-input">
                <img src="https://img.icons8.com/material-sharp/48/user.png"
                    alt="imagen"/>
                <asp:TextBox runat="server" type="text" name="usuario" id="txtUser"></asp:TextBox>
                
                <label for="usuario">Usuario</label>
            </div>
            <div class="contenedor-input">
                <img src="https://img.icons8.com/metro/26/password.png"
                    alt="imagen"/>
                <asp:TextBox runat="server" type="password" name="contraseña" id="txtPassword"></asp:TextBox>
                
                <label for="contraseña">Contraseña</label>
            </div>
            <asp:LinkButton ID="lblOlvidePassword" for="check-slider" runat="server" class="link-olvide-contraseña" OnClick="lblOlvidePassword_Click">Olvidé mi contraseña</asp:LinkButton>

            <asp:Button CssClass="button" ID="btnLogin" runat="server" Text="Acceder al sistema" OnClick="btnLogin_Click1"></asp:Button>
        </form>
    </div>
</body>
</html>
