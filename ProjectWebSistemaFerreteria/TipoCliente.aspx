<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="TipoCliente.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">Tipo Cliente</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <asp:Panel runat="server">
                    <div class="form-group">
                        <label for="txtCodigo">Código:</label>
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                        <!-- Aquí puedes agregar el botón de búsqueda si lo necesitas -->
                    </div>
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="cbxVigencia">Vigencia:</label>
                        <asp:DropDownList ID="cbxSexo" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Vigente" Value="Vigente"></asp:ListItem>
                            <asp:ListItem Text="No vigente" Value="NoVigente"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </asp:Panel>
            </div>
            <div class="col-md-4">
                <asp:Panel runat="server">
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn btn-warning btnGuardar w-100" OnClick="btnGuardar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning btnModificar w-100" OnClick="btnModificar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-warning btnEliminar w-100" OnClick="btnEliminar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" CssClass="btn btn-warning btnDarBaja w-100" OnClick="btnDarBaja_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary btnLimpiar w-100" OnClick="btnLimpiar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-secondary btnSalir w-100" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <asp:GridView ID="dgvTipoCliente" runat="server" CssClass="table table-striped table-bordered">
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
