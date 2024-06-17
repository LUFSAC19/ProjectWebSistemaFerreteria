<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Usuario.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 class="rounded">GESTIONAR USUARIO</h1>

        <div class="row contenedor-principal p-3">
            <div class="col-md-8 border border-gray p-3 mt-2">
                <asp:Panel runat="server">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group mb-2">
                                <label for="txtID" class="mb-1">ID:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btnBuscar " />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-2">
                                <label for="txtNombre" class="mb-1">Nombre:</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label for="txtPassword" class="mb-1">Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" type="password" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-2">
                                <label for="txtDni" class="mb-1">Dni:</label>
                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label for="cbxVigencia" class="mb-1">Vigencia:</label>
                                <asp:DropDownList ID="cbxVigencia" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Vigente" Value="Vigente"></asp:ListItem>
                                    <asp:ListItem Text="No vigente" Value="NoVigente"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-4 border border-gray p-3 mt-2">
                <asp:Panel runat="server">
                    <div class="row my-4">
                        <div class="col-md-6 mb-3">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn  btnGuardar w-100" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn  btnModificar w-100" OnClick="btnModificar_Click1" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn  btnEliminar w-100" OnClick="btnEliminar_Click1" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" CssClass="btn btnDarBaja w-100" OnClick="btnDarBaja_Click1" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btnLimpiar w-100" OnClick="btnLimpiar_Click" />
                        </div>
                        <div class="col-md-6  mb-3">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn  btnSalir w-100" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row mt-4 contenedor-tabla">
            <div class="col-12">
                <asp:GridView ID="dgvUsuarios" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="idUsuario" HeaderText="ID"></asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="User"></asp:BoundField>
                        <asp:BoundField DataField="contraseña" HeaderText="Password" DataFormatString="*************"></asp:BoundField>
                        <asp:BoundField DataField="dniEmpleado" HeaderText="DNI"></asp:BoundField>
                        <asp:BoundField DataField="vigencia" HeaderText="Vigencia"></asp:BoundField>
                    </Columns>
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
