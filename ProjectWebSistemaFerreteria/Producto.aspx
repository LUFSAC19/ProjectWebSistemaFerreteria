<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MDIPrincipal.Master" CodeBehind="TipoEmpleado.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">Empleado</h2>
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
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-4">
                <asp:Panel runat="server">
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-warning w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="Button1" runat="server" Text="Modificar" CssClass="btn btn-warning w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="Button2" runat="server" Text="Eliminar" CssClass="btn btn-warning w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="Button3" runat="server" Text="Limpiar" CssClass="btn btn-secondary w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="btn btn-secondary w-100" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
