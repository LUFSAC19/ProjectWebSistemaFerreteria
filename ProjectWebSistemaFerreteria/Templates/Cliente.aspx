<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Cliente.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 class="rounded">GESTIONAR CLIENTE</h1>

        <div class="row contenedor-principal p-3">

            <div class="col-md-10 border border-gray p-4 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group mb-2">
                                <label for="txtNumero" class="mb-1">Código:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control "></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-sencondary btnBuscar"></asp:Button>
                                </div>
                            </div>

                            <div class="form-group mb-2">
                                <label id="lblNombre" runat="server" for="txtNombre" class="mb-1">Nombres:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control "></asp:TextBox>

                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label id="lblApellidos" runat="server" for="txtApellidos" class="mb-1">Apellidos:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label id="lblCorreo" runat="server" for="txtCorreo" class="mb-1">Correo:</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label for="txtTelefono" class="mb-1">Telefono:</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">

                                    <div class="form-group mb-2">
                                        <label id="lblFecha" runat="server" for="txtFecha" class="mb-1">Fecha de Nacimiento:</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="form-group mb-2">
                                        <label id="lblSexo" runat="server" for="cbxSexo">Sexo:</label>
                                        <div class="input-group">
                                            <asp:DropDownList ID="cbxSexo" runat="server" CssClass="form-control" class="mb-1">
                                                <asp:ListItem Text="Masculino" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Femenino" Value="1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="form-group mb-2">
                                <label id="lblDni" runat="server" for="txtDni" class="mb-1">Dni:</label>
                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>



                        </div>
                        <div class="col-md-6">

                            <div class="form-group mb-2">
                                <label for="cbxTipoCliente" class="mb-1">Tipo de Cliente:</label>
                                <div class="input-group">
                                    <asp:DropDownList ID="cbxTipoCliente" runat="server" AutoPostBack="true" CssClass="form-control " OnSelectedIndexChanged="cbxTipoCliente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label for="txtDireccion" class="mb-1">Dirección:</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-2">
                                        <label for="txtCiudad" class="mb-1">Ciudad:</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group mb-2">
                                <label id="lblRuc" runat="server" for="txtRuc" class="mb-1">RUC:</label>
                                <asp:TextBox ID="txtRuc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label id="lblRazonSocial" runat="server" for="txtRazonSocial" class="mb-1">Razon Social:</label>
                                <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label id="lblRepresentante" runat="server" for="txtRepresentante" class="mb-1">Representante:</label>
                                <asp:TextBox ID="txtRepresentante" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                         
                            <div class="form-group mb-2 ">
                                <label for="chbxVigencia" class="mb-1">Vigencia:</label>
                                <input id="chbxVigencia" runat="server" type="checkbox" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-2  border border-gray p-3 mt-2  ">
                <asp:Panel runat="server">
                    <div class="row  my-4 ">
                        <div class="mb-4">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn btn-warning btnGuardar w-100 " OnClick="btnGuardar_Click" />

                        </div>

                        <div class=" mb-4 ">
                            <asp:Button runat="server" Text="Modificar" CssClass="btn  btnModificar w-100" ID="btnModificar" OnClick="btnModificar_Click" />

                        </div>
                        <div class="mb-4">
                            <asp:Button runat="server" Text="Limpiar" CssClass="btn   btnLimpiar w-100" ID="btnLimpiar" OnClick="btnLimpiar_Click" />

                        </div>
                        <div class="mb-4">
                            <asp:Button runat="server" Text="Eliminar" CssClass="btn  btnEliminar w-100" ID="btnEliminar" OnClick="btnEliminar_Click" />

                        </div>
                        <div class=" mb-4">
                            <asp:Button runat="server" Text="Dar Baja" CssClass="btn  btnDarBaja w-100" ID="btnDarBaja" OnClick="btnDarBaja_Click" />

                        </div>
                        <div class="mb-4">
                            <asp:Button runat="server" Text="Salir" CssClass="btn  btnSalir w-100" ID="btnSalir" />

                        </div>
                    </div>
                </asp:Panel>
            </div>

        </div>

        <div class="row mt-4 contenedor-tabla">
            <div class="col-12">
                <asp:GridView ID="dgvCliente" runat="server" CssClass="table table-striped table-bordered " AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="codCliente" HeaderText="ID"></asp:BoundField>
        <asp:BoundField DataField="dni" HeaderText="DNI" NullDisplayText="No tiene DNI"></asp:BoundField>
        <asp:BoundField DataField="ruc" HeaderText="RUC" NullDisplayText="NO TIENE RUC"></asp:BoundField>
        <asp:TemplateField HeaderText="Nombres completos" ConvertEmptyStringToNull="True">
            <ItemTemplate>
                <%# Eval("nombres") + " " + Eval("apellidos") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="razon_social" HeaderText="RAZON SOCIAL" NullDisplayText="NO TIENE RAZON SOCIAL"></asp:BoundField>
        <asp:BoundField DataField="direccion" HeaderText="DIRECCION" NullDisplayText="NO TIENE DIRECCION"></asp:BoundField>
        <asp:BoundField DataField="ciudad" HeaderText="CIUDAD" NullDisplayText="NO TIENE CIUDAD"></asp:BoundField>
        <asp:BoundField DataField="numCelular" HeaderText="Celular" NullDisplayText="NO TIENE CELULAR"></asp:BoundField>
        <asp:BoundField DataField="email" HeaderText="EMAIL" NullDisplayText="NO TIENE EMAIL"></asp:BoundField>
        <asp:BoundField DataField="nombre" HeaderText="TIPO"></asp:BoundField>
    </Columns>
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>