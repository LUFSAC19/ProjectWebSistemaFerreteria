<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="TipoProducto.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
                <h1 class="rounded ">TIPO PRODUCTO</h1>
         
        <div class="row contenedor-principal p-3">
            <div class="col-md-8 border border-gray p-3 mt-2 ">
                <asp:Panel runat="server">


                    <div class="row">
                        <div class="row">
                            <div class="col-md-6">

                                <div class="form-group mb-2">
                                    <label for="txtCodigo" class="mb-1">Código:</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn  btnBuscar"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group mb-2">
                                    <label for="txtNombre" class="mb-1">Nombre:</label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>



                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-2">
                                    <label for="cbxVigencia" class="mb-1">Vigencia:</label>
                                    <asp:DropDownList ID="cbxVigencia" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Vigente" Value="Vigente"></asp:ListItem>
                                        <asp:ListItem Text="No vigente" Value="NoVigente"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                        </div>
                        
                        <div class="form-group mb-2">
                            <label for="txtDescripcion" class="mb-1">Descripcion:</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-4 border border-gray p-3 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row my-3">
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn  btnGuardar w-100" OnClick="btnGuardar_Click" />
                        </div>
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn  btnModificar w-100" OnClick="btnModificar_Click" />
                        </div>
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn  btnEliminar w-100" OnClick="btnEliminar_Click" />
                        </div>
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar baja" CssClass="btn  btnDarBaja w-100" OnClick="btnDarBaja_Click" />
                        </div>
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btnLimpiar w-100" />
                        </div>
                        <div class="col-md-6 mb-4">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn  btnSalir w-100" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <asp:GridView ID="dgvTipoProducto" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="codTipoProducto" HeaderText="ID"></asp:BoundField>
                        <asp:BoundField DataField="nombreTipoProd" HeaderText="NOMBRE"></asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="DESCRIPCION"></asp:BoundField>
                        <asp:CheckBoxField DataField="vigencia" HeaderText="VIGENCIA"></asp:CheckBoxField>
                    </Columns>
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
