Public Class Formulario_web12
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindGridView()
    End Sub

    Private Sub BindGridView()
        ' Crear un DataTable en memoria
        Dim dt As New DataTable()
        dt.Columns.Add("Codigo")
        dt.Columns.Add("Nombre")

        ' Agregar filas de datos manualmente
        dt.Rows.Add("001", "Gerente")
        dt.Rows.Add("002", "Cajero")

        ' Enlazar el DataTable al GridView
        dgvTipoEmpleado.DataSource = dt
        dgvTipoEmpleado.DataBind()
    End Sub
End Class