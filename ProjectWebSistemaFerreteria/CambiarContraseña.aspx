<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarContraseña.aspx.vb" Inherits="ProjectWebSistemaFerreteria.WebForm1" %>

<!DOCTYPE html>
<script runat="server">
    Protected Sub btnIngresar(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        .btn-warning-with-icon {
            background-image: url('Imagenes/ingresar_login.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */
            background-color: #ffc107;
            padding-left: 32px;
            /* Mantén el color de fondo del botón */
        }

        #title {
            background-color: rgb(52, 73, 94);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="row no-gutters">
                        <div class="col-md-4 d-flex align-items-center justify-content-center">
                            <img src="Imagenes/login.png" alt="Alternate Text" class="card-img" />
                        </div>
                        <div class="col-md-8">

                            <h3 class="card-title mt-0 text-center text-white p-3 mb-0" id="title">Cambiar Contraseña</h3>
                            <div class="card-body m-0">

                                <form id="form1" runat="server">
                                    <div class="form-group">
                                        <asp:Label runat="server" Text="DNI:" CssClass="form-label" ID="Label3"></asp:Label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <img src="Imagenes/usuario_login.png" alt="User Icon" />
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtUsuario"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" Text="Contraseña:" CssClass="form-label" ID="Label2"></asp:Label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <img src="Imagenes/contraseña_login.png" alt="Password Icon" />
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtPassword"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" Text="Confirmar Contraseña:" CssClass="form-label" ID="Label1"></asp:Label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <img src="Imagenes/contraseña_login.png" alt="Password Icon" />
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="TextBox1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group text-center">
                                        <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-warning-with-icon" OnClick="btnIngresar" ID="Button1"></asp:Button>
                                        <asp:Button runat="server" Text="Guardar" CssClass="btn btn-warning-with-icon" OnClick="btnIngresar" ID="btn1"></asp:Button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
