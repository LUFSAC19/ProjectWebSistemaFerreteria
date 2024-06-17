Imports prjCapaNegocio
Imports System.Drawing

Public Class ModalBusquedaProducto
    Inherits System.Web.UI.Page
    Dim objPro As New clsProducto
    Dim objTip As New clsTipoProducto
    Dim objMar As New clsMarca
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            llenarListaProductos()
            llenarComboTipo()
            llenarComboMarca()
        End If
        labelMensaje.Text = ""
        labelMensaje.ForeColor = Color.Red
    End Sub

    Private Sub llenarListaProductos()
        Try
            Dim clientes As DataTable = objPro.listarProducto_BusquedaAvanzada()

            Dim tableHtml As New StringBuilder()
            tableHtml.Append("<table class='table'>")
            tableHtml.Append("<thead><tr>")
            tableHtml.Append("<th>Código</th>")
            tableHtml.Append("<th>Producto</th>")
            tableHtml.Append("<th>Tipo</th>")
            tableHtml.Append("<th>Marca</th>")
            tableHtml.Append("<th>Stock</th>")
            tableHtml.Append("<th>Precio</th>")
            tableHtml.Append("</tr></thead>")
            tableHtml.Append("<tbody>")

            For Each row As DataRow In clientes.Rows
                Dim codigo As String = row(0).ToString()
                Dim producto As String = row(1).ToString()
                Dim tipo As String = row(2).ToString()
                Dim marca As String = row(3).ToString()
                Dim stock As String = row(4).ToString()
                Dim precio As String = row(5).ToString()

                Dim rowHtml As String = "<tr>" &
                                    "<td>" & codigo & "</td>" &
                                    "<td>" & producto & "</td>" &
                                    "<td>" & tipo & "</td>" &
                                    "<td>" & marca & "</td>" &
                                    "<td>" & stock & "</td>" &
                                    "<td>" & precio & "</td>" &
                                    "</tr>"
                tableHtml.Append(rowHtml)
            Next
            tableHtml.Append("</tbody></table>")
            tblProductos.Text = tableHtml.ToString()
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub llenarComboTipo()
        Try
            Dim tipos As DataTable = objTip.listarTipoProducto()
            Dim cboTipoHtml As New StringBuilder()
            cboTipoHtml.Append("<select name='cboTipo' id='cboTipo' style='border:1px #a5a5a5 solid;outline:none; border-radius:5px; background-color:#E5E5E5'>")
            cboTipoHtml.Append("<option value='TODOS'>TODOS</option>")
            For Each row As DataRow In tipos.Rows
                Dim nombre As String = row(1).ToString()

                Dim rowHtml As String =
                                    "<option value='" & nombre & "'>" & nombre & "</option>"
                cboTipoHtml.Append(rowHtml)
            Next
            cboTipoHtml.Append("</select>")
            cboTipoLITERAL.Text = cboTipoHtml.ToString()
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub llenarComboMarca()
        Try
            Dim marcas As DataTable = objMar.listarMarca()
            Dim cboMarcaHtml As New StringBuilder()
            cboMarcaHtml.Append("<select name='cboMarca' id='cboMarca' style='border:1px #a5a5a5 solid;outline:none; border-radius:5px; background-color:#E5E5E5'>")
            cboMarcaHtml.Append("<option value='TODAS'>TODAS</option>")
            For Each row As DataRow In marcas.Rows
                Dim nombre As String = row(1).ToString()

                Dim rowHtml As String =
                                    "<option value='" & nombre & "'>" & nombre & "</option>"
                cboMarcaHtml.Append(rowHtml)
            Next
            cboMarcaHtml.Append("</select>")
            cboMarcaLITERAL.Text = cboMarcaHtml.ToString()
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnSeleccionar_Click(sender As Object, e As EventArgs)
        Try
            If txtProductoHF.Value = "" Then
                labelMensaje.Text = "Debe seleccionar un producto"
            Else
                Session("idProducto") = txtProductoHF.Value
                txtProductoHF.Value = ""
            End If
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnRetroceder_Click(sender As Object, e As EventArgs)
        Response.Redirect(Request.UrlReferrer.ToString())
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        Session.Remove("idProducto")
        labelMensaje.Text = ""
        txtProductoHF.Value = ""
    End Sub
End Class