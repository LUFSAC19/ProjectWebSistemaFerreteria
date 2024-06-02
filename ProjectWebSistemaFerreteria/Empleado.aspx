<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Empleado.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="style.css" rel="stylesheet" />
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
                        <label for="txtDni">DNI:</label>
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="cbxTipoEmpleado">Tipo:</label>
                        <asp:DropDownList ID="cbxTipoEmpleado" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtNombres">Nombres:</label>
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtApellidos">Apellidos:</label>
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="dtpFecha">Fecha Nac.:</label>
                        <asp:TextBox ID="dtpFecha" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtCelular">Celular:</label>
                        <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="cbxSexo">Sexo:</label>
                        <asp:DropDownList ID="cbxSexo" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Masculino" Value="Masculino"></asp:ListItem>
                            <asp:ListItem Text="Femenino" Value="Femenino"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtDireccion">Dirección:</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group form-check">
                        <label clss="form-check-label" for="chbxVigente">Vigente: </label>
                        <asp:CheckBox ID="chbxVigente" runat="server" Text="(Vigente)" CssClass="form-check-input" />

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
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary btnLimpiar w-100" />
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
                <asp:GridView ID="dgvEmpleado" runat="server" CssClass="table table-striped table-bordered">
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
