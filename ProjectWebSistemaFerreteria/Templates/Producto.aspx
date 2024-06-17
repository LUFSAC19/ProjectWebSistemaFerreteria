<%@ Page Title="" Language="VB" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Producto.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 class="rounded">GESTIONAR PRODUCTO</h1>
        <div class="row contenedor-principal p-3">
            <div class="col-md-10 border border-gray p-3 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label for="txtNumero" class="mb-1">Código:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-sencondary btnBuscar" />
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <label for="cbxTP" class="mb-1">Tipo de producto:</label>
                                <asp:DropDownList ID="cbxTP" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                            <div class="form-group mb-3">
                                <label for="txtDescripcion" class="mb-1">Descripción:</label>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="form-group mb-3">
                                <label for="txtNombre" class="mb-1">Nombre:</label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-3">
                                <label for="cbxMarca" class="mb-1">Marca:</label>
                                <asp:DropDownList ID="cbxMarca" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label for="txtStock" class="mb-1">Stock:</label>
                                        <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="txtPrecio" class="mb-1">Precio unitario:</label>
                                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label for="txtStockMin" class="mb-1">Stock mínimo:</label>
                                        <asp:TextBox ID="txtStockMin" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div> 
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <label for="chbxVigencia" class="mb-1">Vigencia:</label>
                                        <input id="chbxVigencia" runat="server" type="checkbox" />
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-2 border border-gray p-3 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row" runat="server">
                        <div class="mb-3">
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn  btnGuardar w-100 " OnClick="btnNuevo_Click" />

                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn  btnModificar w-100 " OnClick="btnModificar_Click" />

                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn  btnLimpiar w-100 " OnClick="btnLimpiar_Click" />

                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn  btnEliminar w-100 " OnClick="btnEliminar_Click" />

                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar Baja" CssClass="btn btnDarBaja w-100 " OnClick="btnDarBaja_Click" />

                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnSalir" runat="server" Text="SALIR" CssClass="btn  btnSalir w-100 " />

                        </div>
                    </div>
                </asp:Panel>
            </div>

        </div>

        <div class="row mt-4 contenedor-tabla">
            <h2>Lista de productos</h2>
            <div class="row mt-4">
                <div class="col-12">
                    <asp:GridView ID="dgvProducto" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="codProducto" HeaderText="ID"></asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="NOMBRE"></asp:BoundField>
                            <asp:BoundField DataField="nombreTipoProd" HeaderText="TIPO"></asp:BoundField>
                            <asp:BoundField DataField="nombreMarca" HeaderText="MARCA"></asp:BoundField>
                            <asp:BoundField DataField="stock" HeaderText="STOCK"></asp:BoundField>
                            <asp:BoundField DataField="precioUnitario" HeaderText="PRECIO"></asp:BoundField>
                            <asp:CheckBoxField DataField="vigencia" HeaderText="VIGENCIA"></asp:CheckBoxField>
                        </Columns>
                        <Columns>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
