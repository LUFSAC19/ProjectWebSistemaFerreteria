<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Cliente.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        main {
            padding: 20px;
        }

        #titulo {
            background-color: rgb(52, 73, 94);
        }

        p {
            text-align: center;
            width: 98px;
        }

        #form1 {
            width: 100%;
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            justify-content: space-between;
        }

            .btn-container button {
                margin-bottom: 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 id="titulo" class="card-title mt-0 text-center text-white p-3 mb-0">GESTIONAR CLIENTE</h1>

    <main>
        <section class="cliente-actual">
            <div id="form1" class="row">
                <div class="col-md-9 border border-gray p-3 me-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtNumero">Código:</label>
                                <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button runat="server" Text="Buscar" OnClick="Unnamed1_Click1"></asp:Button>
                            </div>
                            <div class="form-group">
                                <label for="cbxTipoCliente">Tipo de Cliente:</label>
                                <asp:DropDownList ID ="cbxTipoCliente" runat="server" CssClass="form-control" OnSelectedIndexChanged="cbxTipoCliente_SelectedIndexChanged1">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label id="lblNombre" runat="server" for="txtNombre">Nombres:</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblApellidos" runat="server" for="txtApellidos">Apellidos:</label>
                                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblFecha" runat="server" for="txtFecha">Fecha de Nacimiento:</label>
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblCorreo" runat="server" for="txtCorreo">Correo:</label>
                                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblSexo" runat="server" for="cbxSexo">Sexo:</label>
                                <asp:DropDownList ID="cbxSexo" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label id="lblDni" runat="server" for="txtDni">Dni:</label>
                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="form-group">
                                <label for="txtTelefono">Telefono:</label>
                                <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtDireccion">Dirección:</label>
                                <asp:TextBox ID="txtDireccion" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtCiudad">Ciudad:</label>
                                <asp:TextBox ID="txtCiudad" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblRuc" runat="server" for="txtRuc">RUC:</label>
                                <asp:TextBox ID="txtRuc" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblRazonSocial" runat="server" for="txtRazonSocial">Razon Social:</label>
                                <asp:TextBox ID="txtRazonSocial" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label id="lblRepresentante" runat="server" for="txtRepresentante">Representante:</label>
                                <asp:TextBox ID="txtRepresentante" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="chbxVigencia">Vigencia:</label>
                                <input id="chbxVigencia" runat="server" type="checkbox" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 border border-gray">
                    <div class="btn-container" runat ="server">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-warning"  />
                        <asp:Button runat="server" Text="Modificar" CssClass="btn btn-warning" ID="btnModificar" OnClick="btnModificar_Click" />
                        <asp:Button runat="server" Text="Limpiar" CssClass="btn btn-warning" ID="btnLimpiar" OnClick="btnLimpiar_Click" />
                        <asp:Button runat="server" Text="Eliminar" CssClass="btn btn-warning" ID="btnEliminar" OnClick="btnEliminar_Click" />
                        <asp:Button runat="server" Text="Dar de Baja" CssClass="btn btn-warning" ID="btnDarBaja" OnClick="btnDarBaja_Click" />
                        <asp:Button runat="server" Text="Salir" CssClass="btn btn-warning" ID="btnSalir" />

                    </div>
                </div>
            </div>
        </section>

        <section class="lista-Clientes">
            <h2>Lista de Clientes</h2>
            <div class="row mt-4">
                <div class="col-12">
                    <asp:GridView ID="dgvCliente" runat="server" CssClass="table table-striped table-bordered">
                        <Columns>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </section>
    </main>


</asp:Content>

