<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="TipoEmpleado.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="mb-4 rounded">Gestionar  Tipo Empleado</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 ">
                <div class="container-controles my-4 border border-2 border-secondary-subtle rounded p-4">
                    <div class="form-group">
                        <label for="txtCodigo" >Código:</label>
                        <div class="input-group">
                             <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Buscar" CssClass="btn btnBuscar btn-sencondary" OnClick="btnSearch_Click" />
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="container-botones my-4 border border-2 border-secondary-subtle rounded p-4">
                    <div class="row mx-2">
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn btn-warning btnGuardar w-100 " OnClick="btnGuardar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning btnModificar w-100" OnClick="btnModificar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-warning btnEliminar w-100" OnClick="btnEliminar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary btnLimpiar w-100" OnClick="btnLimpiar_Click" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-secondary btnSalir w-100" />
                        </div>
                    </div>
                    </div>
                </div>
            </>
            <div class="col-md-4">
                <div class="container-tabla border border-2 border-secondary-subtle rounded p-2 my-4">
                    <div class="row mt-4">
                        <div class="col-12">
                            <asp:GridView ID="dgvTipoEmpleado" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="codTipoEmpleado" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                                </Columns>
                                <Columns>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
