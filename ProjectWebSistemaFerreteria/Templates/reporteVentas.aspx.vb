Imports System.Web.Services
Imports prjCapaNegocio

Public Class reporteVentas
    Inherits System.Web.UI.Page

    Dim objVenta As New clsventa

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dtVentas As New DataTable()
            dtVentas.Columns.Add("codVenta")
            dtVentas.Columns.Add("cliente")
            dtVentas.Columns.Add("numComprobante")
            dtVentas.Columns.Add("tipoComprobante")
            dtVentas.Columns.Add("numCaja")
            dtVentas.Columns.Add("vendedor")
            dtVentas.Columns.Add("fecha")
            dtVentas.Columns.Add("montoTotal")
            dtVentas.Columns.Add("cantProductos")
            ViewState("dtVentas") = dtVentas
            BindGrid()
            listarVentas()
        End If
    End Sub

    Private Sub BindGrid()
        Dim dtVentas As DataTable = CType(ViewState("dtVentas"), DataTable)
        dgVentas.DataSource = dtVentas
        dgVentas.DataBind()
    End Sub

    Private Sub listarVentas()
        Try
            Dim dtVentas As DataTable = objVenta.listarVentas()
            ViewState("dtVentas") = dtVentas
            BindGrid()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub dgVentas_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles dgVentas.RowCommand
        Try
            If e.CommandName = "MostrarModal" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument) - 1

                ' Obtener los valores de la fila seleccionada
                Dim codVentaValue As String = dgVentas.Rows(index).Cells(1).Text ' Index 1 para "codVenta"
                Dim clienteValue As String = dgVentas.Rows(index).Cells(2).Text  ' Index 2 para "cliente"
                Dim vendedorValue As String = dgVentas.Rows(index).Cells(6).Text  ' Index 6 para "vendedor"
                Dim fechaValue As String = dgVentas.Rows(index).Cells(7).Text  ' Index 7 para "fecha"
                Dim montoTotalValue As String = dgVentas.Rows(index).Cells(9).Text  ' Index 9 para "montoTotal"

                ' Asignar valores a los Labels del modal
                codVenta.Text = codVentaValue
                cliente.Text = clienteValue
                vendedor.Text = vendedorValue
                fecha.Text = fechaValue
                montoTotal.Text = montoTotalValue

                Dim dtDetalle As DataTable = objVenta.listaDetalleVenta(CInt(codVenta.Text))
                dgDetalle.DataSource = dtDetalle
                dgDetalle.DataBind()

                ' Mostrar el modal
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "openModal", "$('#exampleModal').modal('show');", True)
            End If
        Catch ex As Exception
        End Try
    End Sub


End Class
