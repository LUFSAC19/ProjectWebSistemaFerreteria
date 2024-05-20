<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MDIPrincipal.Master" CodeBehind="TipoProducto.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnGuardar {
            background-image: url('Imagenes/nuevo.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */
            background-color: #ffc107;
            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }

        .btnModificar {
            background-image: url('Imagenes/modificar.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */
            background-color: #ffc107;
            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }

        .btnEliminar {
            background-image: url('Imagenes/eliminar.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */
            background-color: #ffc107;
            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }

        .btnDarBaja {
            background-image: url('Imagenes/darBaja.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */
            background-color: #ffc107;
            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }

        .btnLimpiar {
            background-image: url('Imagenes/limpiar.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */

            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }

        .btnSalir {
            background-image: url('Imagenes/salir.png'); /* Ruta de la imagen */
            background-repeat: no-repeat;
            background-position: center left; /* Alinea la imagen a la izquierda del botón */

            padding-left: 25px;
            /* Mantén el color de fondo del botón */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">Tipo Producto</h2>
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
                        <label for="txtDescripcion">Descripcion:</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
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
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-warning btnGuardar w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning btnModificar w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-warning btnEliminar w-100" />
                        </div>
                        <div class="col-md-6 mb-2">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar de baja" CssClass="btn btn-warning btnDarBaja w-100" />
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
                <asp:GridView ID="dgvTipoProducto" runat="server" CssClass="table table-striped table-bordered">
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
