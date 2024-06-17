Imports prjCapaNegocio
Imports System.Drawing

Public Class ModalBusquedaCliente
    Inherits System.Web.UI.Page
    Dim objCli As New clsCliente
    Private codCliente As Integer
    Private ndoCliente As String
    Private nomCliente As String
    Private tipCliente As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            llenarListaClientes()
        End If
        labelMensaje.Text = ""
        labelMensaje.ForeColor = Color.Red

    End Sub

    Private Sub llenarListaClientes()
        Try
            Dim clientes As DataTable = objCli.listarClientes_BusquedaAvanzada()

            Dim tableHtml As New StringBuilder()
            tableHtml.Append("<table class='table'>")
            tableHtml.Append("<thead><tr>")
            tableHtml.Append("<th>Código</th>")
            tableHtml.Append("<th>N°Documento</th>")
            tableHtml.Append("<th>Cliente</th>")
            tableHtml.Append("<th>Tipo</th>")
            tableHtml.Append("</tr></thead>")
            tableHtml.Append("<tbody>")

            For Each row As DataRow In clientes.Rows
                Dim codigo As String = row(0).ToString()
                Dim documento As String = row(1).ToString()
                Dim cliente As String = row(2).ToString()
                Dim tipo As String = row(3).ToString()

                Dim rowHtml As String = "<tr>" &
                                    "<td>" & codigo & "</td>" &
                                    "<td>" & documento & "</td>" &
                                    "<td>" & cliente & "</td>" &
                                    "<td>" & tipo & "</td>" &
                                    "</tr>"
                tableHtml.Append(rowHtml)
            Next
            tableHtml.Append("</tbody></table>")
            tblClientes.Text = tableHtml.ToString()
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnSeleccionar_Click(sender As Object, e As EventArgs)
        Try
            If txtClienteHF.Value = "" Then
                labelMensaje.Text = "Debe seleccionar un cliente"
            Else
                Session("idCliente") = txtClienteHF.Value

                txtClienteHF.Value = ""
            End If
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try

    End Sub

    Protected Sub btnRetroceder_Click(sender As Object, e As EventArgs)
        System.Diagnostics.Debug.WriteLine("El botón se ha presionado.")
        Dim urlAnterior As String = HttpContext.Current.Request.UrlReferrer.AbsoluteUri
        System.Diagnostics.Debug.WriteLine("URL de la página anterior: " & urlAnterior)
        System.Diagnostics.Debug.WriteLine("Redireccionando a la página anterior...")
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        Session.Remove("idCliente")
        labelMensaje.Text = ""
        txtClienteHF.Value = ""
    End Sub
End Class