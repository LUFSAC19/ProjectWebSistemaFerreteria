<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="reporteVentas.aspx.vb" Inherits="ProjectWebSistemaFerreteria.reporteVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reporte de ventas</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
        function showModal(e) {
            console.log(e)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%-- Movido aquí --%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h3 class="h3 bold fw-bo-3">Ventas realizadas</h3>
                
                <div class="contanier-fluid">
                    <div class="table-responsive" style="max-height: 38rem">
                        <asp:GridView ID="dgVentas" class="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" ShowHeader="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnModal" runat="server" Text="Ver" CssClass="btn btn-secondary"
                                            CommandName="MostrarModal"
                                            CommandArgument='<%# Eval("codVenta") %>' />
                                        

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="codVenta" HeaderText="Venta" />
                                <asp:BoundField DataField="cliente" HeaderText="Cliente" />
                                <asp:BoundField DataField="numComprobante" HeaderText="Num Comprobante" />
                                <asp:BoundField DataField="tipoComprobante" HeaderText="Tipo" />
                                <asp:BoundField DataField="numCaja" HeaderText="Caja" />
                                <asp:BoundField DataField="vendedor" HeaderText="Vendedor" />
                                <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
                                <asp:BoundField DataField="cantProductos" HeaderText="Cant Productos" />
                                <asp:BoundField DataField="montoTotal" HeaderText="Total" />
                            </Columns>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="9" style="text-align: center;">No hay datos disponibles</td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Detalle de Venta</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row ">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col text-end"><span>Venta: </span></div>
                                                    <div class="col">
                                                        <asp:Label ID="codVenta" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-end"><span>Cliente: </span></div>
                                                    <div class="col">
                                                        <asp:Label ID="cliente" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-end"><span>Vendedor: </span></div>
                                                    <div class="col">
                                                        <asp:Label ID="vendedor" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-end"><span>Fecha: </span></div>
                                                    <div class="col">
                                                        <asp:Label ID="fecha" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-end"><span>Total: </span></div>
                                                    <div class="col">
                                                        <asp:Label ID="montoTotal" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <hr class="my-5"/>

                                        </div>


                                        <div class="table-responsive" style="max-height: 50rem">
                                            <asp:GridView ID="dgDetalle" class="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" ShowHeader="True">
                                                <Columns>
                                                    <asp:BoundField DataField="nombre" HeaderText="Producto" />
                                                    <asp:BoundField DataField="nombreTipoProd" HeaderText="Tipo producto" />
                                                    <asp:BoundField DataField="nombreMarca" HeaderText="Marca" />
                                                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" />
                                                    <asp:BoundField DataField="precioUnitario" HeaderText="precio Unitario" />
                                                    <asp:BoundField DataField="cantidad" HeaderText="cantidad" />
                                                    <asp:BoundField DataField="subtotal" HeaderText="Subtotal" DataFormatString="{0:N2}" />
                                                    <asp:BoundField DataField="igv" HeaderText="IGV" DataFormatString="{0:N2}" />
                                                    <asp:BoundField DataField="total" HeaderText="total" DataFormatString="{0:N2}" />
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <tr>
                                                        <td colspan="9" style="text-align: center;">No hay datos disponibles</td>
                                                    </tr>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

