Public Class Formulario_web14
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindGridView()
    End Sub

    Private Sub BindGridView()
        ' Crear un DataTable en memoria
        Dim dt As New DataTable()
        dt.Columns.Add("Codigo")
        dt.Columns.Add("Nombre")
        dt.Columns.Add("Vigencia")

        ' Agregar filas de datos manualmente
        dt.Rows.Add("001", "T.Cliente A", "Vigente")
        dt.Rows.Add("002", "T.Cliente B", "No vigente")
        dt.Rows.Add("003", "T.Cliente C", "Vigente")

        ' Enlazar el DataTable al GridView
        dgvTipoCliente.DataSource = dt
        dgvTipoCliente.DataBind()
    End Sub
End Class