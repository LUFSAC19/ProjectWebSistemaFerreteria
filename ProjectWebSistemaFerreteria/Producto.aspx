<%@ Page Title="" Language="VB" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Producto.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h1 id="titulo" class="card-title mt-0 text-center text-black p-3 mb-0">GESTIONAR PRODUCTO</h1>
        </div>
        <div>
            <section class="producto-actual">
                <div id="form1" class="row">
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtNumero">Número:</label>
                                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                                </div>
                                <div class="form-group">
                                    <label for="cbxTP">Tipo de producto:</label>
                                    <asp:DropDownList ID="cbxTP" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="cbxMarca">Marca:</label>
                                    <asp:DropDownList ID="cbxMarca" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="txtNombre">Nombre:</label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtDescripcion">Descripción:</label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label for="txtStock">Stock:</label>
                                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtStockMin">Stock mínimo:</label>
                                    <asp:TextBox ID="txtStockMin" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtPrecio">Precio unitario:</label>
                                    <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="chbxVigencia">Vigencia:</label>
                                    <input id="chbxVigencia" runat="server" type="checkbox" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="btn-container" runat="server">
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-warning" OnClick="btnNuevo_Click" />
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" OnClick="btnModificar_Click" />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" />
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar Baja" CssClass="btn btn-warning" OnClick="btnDarBaja_Click" />
                            <asp:Button ID="btnSalir" runat="server" Text="SALIR" CssClass="btn btn-warning"/>
                        </div>
                    </div>
                </div>
            </section>

            <section class="lista-productos">
                <h2>Lista de productos</h2>
                <div class="row mt-4">
                    <div class="col-12">
                        <asp:GridView ID="dgvProducto" runat="server" CssClass="table table-striped table-bordered">
                            <Columns>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </section>
        </div>
    </div>

</asp:Content>
