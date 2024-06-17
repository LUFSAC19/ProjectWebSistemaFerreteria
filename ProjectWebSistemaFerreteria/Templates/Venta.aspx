<%@ Page ResponseEncoding="utf-8" ContentType="text/html; charset=utf-8" Debug="True"
 Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Venta.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Venta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Venta</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function loadModalContentCliente(url) {
            document.getElementById('modalIframeCliente').src = url;
        }
        function loadModalContentProducto(url) {
            document.getElementById('modalIframeProducto').src = url;
        }
        function validarPositivo(textbox) {
            var valor = parseInt(textbox.value, 10);
            if (valor < 1) {
                textbox.value = 1; // Corregir a 1 si es negativo
            }
        }

        function validarSoloNumerosPositivos(e) {
            var charCode = (e.which) ? e.which : e.keyCode;

            // Permitir solo teclas numéricas (0-9), Backspace (8) y Delete (46)
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 8 && charCode !== 46) {
                return false;
            }

            var valorActual = e.target.value;
            // Evitar que se escriba el guion "-" al inicio o después de otro guion
            if (charCode === 45 && (valorActual.length === 0 || valorActual.slice(-1) === '-')) {
                return false;
            }

            // Bloquear completamente el punto "."
            if (charCode === 46) {
                return false;
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="cont-venta" class="px-4 m-0">
        <h3 class="h4 fw-bold">REGISTRO DE VENTA</h3>
        <div class="container-fluid">
            <div class="row">
                <div class="col-7 border border-black rounded-4 me-4 py-3 bg-white">
                    <div class="row h-100">
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <h4 class="h4 mb-4">Detalle de Venta</h4>
                                    <asp:Label ID="lblErrorDetalle" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <div class="table-responsive" style="max-height: 14.644rem">
                                        <asp:GridView ID="dgDetalle" class="table table-hover table-bordered " runat="server" AutoGenerateColumns="False" ShowHeader="True" OnSelectedIndexChanged="dgDetalle_SelectedIndexChanged">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="fa" SelectText="&#xf054;" />
                                                <asp:BoundField DataField="ID Producto" HeaderText="ID Producto" />
                                                <asp:BoundField DataField="Producto" HeaderText="Producto" />
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                                <asp:BoundField DataField="Precio Un." HeaderText="Precio Un." />
                                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <tr>
                                                    <td colspan="5" style="text-align: center;">No hay datos disponibles</td>
                                                </tr>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                            <div class="row align-items-end p-4">
                                <div class="container overflow-hidden d-flex justify-content-center">
                                    <div class="row gy-4 text-end w-50">
                                        <div class="col-6">
                                            <label>Subtotal:</label>
                                        </div>
                                        <div class="col-6">
                                            <asp:Label ID="txtSubtotal" runat="server" Text="Label">00.00</asp:Label>
                                        </div>
                                        <div class="col-6 text-end">
                                            <label>IGV:</label>
                                        </div>
                                        <div class="col-6">
                                            <asp:Label ID="txtIGV" runat="server" Text="Label">00.00</asp:Label>
                                        </div>

                                        <hr class="my-2" />
                                        <div class="col-6 text-end">
                                            <label>Total:</label>
                                        </div>
                                        <div class="col-6">
                                            <asp:Label ID="txtTotal" runat="server" Text="Label">00.00</asp:Label>
                                        </div>
                                        <div class="col-12 text-center">
                                            <asp:Button ID="btnVender" runat="server" Style="height: 2.491rem" class="btn btn-warning px-5" Text="Vender" />

                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row border border-black rounded-4 py-3 bg-white">
                        <h4 class="h4">Producto</h4>
                        <asp:Label ID="lblErrorProducto" runat="server" ForeColor="Red" Visible="False"></asp:Label>

                        <div class="row py-2 w-100">
                            <div class="col-3 text-end">
                                <span class="align-bottom ">ID Producto:</span>
                            </div>
                            <div class="col-2">
                                <asp:TextBox ID="txtIdProducto" class="form-control" runat="server" onkeypress="return validarSoloNumerosPositivos(event);" onchange="validarPositivo(this);"></asp:TextBox>
                            </div>
                            <div class="col-2">
                                <asp:Button ID="btnBuscarProducto" runat="server" Style="height: 2.491rem" class="btn btn-secondary fa" Text="&#xf002;" />
                            </div>
                            <div class="col px-0">
                                <button type="button" class="btn btn-warning w-100" data-toggle="modal" data-target="#myModalProduc" onclick="loadModalContentProducto('ModalBusquedaProducto.aspx')">
                                    Busqueda Avanzada</button>
                                <div class="modal fade" id="myModalProduc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">

                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <iframe id="modalIframeProducto" width="780px" height="700px" frameborder="0"></iframe>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row py-2">
                            <div class="col-3 text-end">
                                <span class="col-form-label">Nombre:</span>
                            </div>
                            <div class="col pe-0">
                                <asp:TextBox ID="txtNombreProducto" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row py-2 w-100">
                            <div class="col-3 text-end">
                                <span class="align-bottom ">Cantidad:</span>
                            </div>
                            <div class="col-3 pe-0">
                                <asp:TextBox ID="txtCantidadProducto" class="form-control" runat="server" TextMode="Number" min="1" onkeypress="return validarSoloNumerosPositivos(event);" onchange="validarPositivo(this);"></asp:TextBox>
                            </div>
                            <div class="col-3 text-end">
                                <span class="align-bottom ">Precio Un:</span>
                            </div>
                            <div class="col-3 pe-0">
                                <asp:TextBox ID="txtPrecioUnProducto" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row py-2 w-100">
                            <div class="col-3 text-end">
                                <span class="align-bottom ">Stock max:</span>
                            </div>
                            <div class="col-3 pe-0">
                                <asp:TextBox ID="txtStockProducto" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col d-flex justify-content-evenly">
                                <asp:Button ID="btnAgregarDetalle" runat="server" Style="height: 2.491rem" class="btn btn-warning fa" Text="&#xf067;" />
                                <asp:Button ID="btnEliminarDetalle" runat="server" Style="height: 2.491rem" class="btn btn-danger fa" Text="&#xf00d;" />
                                <asp:Button ID="btnLimpiarCampos" runat="server" Style="height: 2.491rem" class="btn btn-secondary fa" Text="&#xf014;" />
                            </div>
                        </div>
                    </div>
                    <div class="row border border-black rounded-4 mt-4 py-3 bg-white">
                        <h4 class="h4">Cliente</h4>
                        <asp:Label ID="lblErrorCliente" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                        <div class="row py-2">
                            <div class="col-4 text-end">
                                <span class="col-form-label">Doc Cliente:</span>
                            </div>
                            <div class="col-4">
                                <asp:TextBox ID="txtDocCliente" class="form-control" runat="server" onkeypress="return validarSoloNumerosPositivos(event);" onchange="validarPositivo(this);"></asp:TextBox>
                            </div>
                            <div class="col px-0">
                                <asp:Button ID="btnBuscarCliente" runat="server" Style="height: 2.491rem" class="btn btn-secondary mx-2 fa" Text="&#xf002;" />
                                <asp:Button ID="btnAgregarCliente" runat="server" Style="height: 2.491rem" class="btn btn-warning ms-3 fa" Text="&#xf067;" />
                            </div>
                        </div>
                        <div class="row py-2">
                            <div class="col-4 text-end">
                                <span class="col-form-label">Nombre o razon social:</span>
                            </div>
                            <div class="col pe-0">
                                <asp:TextBox ID="txtNombreCliente" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row py-2 d-block text-center">
                            <button type="button" id="btnBusquedaCliente" class="btn btn-warning w-50" data-toggle="modal" data-target="#myModal" onclick="loadModalContentCliente('ModalBusquedaCliente.aspx')">
                                <span>Busqueda Avanzada</span>
                            </button>

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <iframe id="modalIframeCliente" width="780px" height="700px" frameborder="0"></iframe>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
