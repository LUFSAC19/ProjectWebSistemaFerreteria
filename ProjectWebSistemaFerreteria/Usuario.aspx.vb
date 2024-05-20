Public Class Formulario_web15
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GridView()
    End Sub

    Private Sub GridView()
        Dim dt As New DataTable()
        dt.Columns.Add("ID")
        dt.Columns.Add("Nombre")
        dt.Columns.Add("Password")
        dt.Columns.Add("Dni")
        dt.Columns.Add("Vigencia")

        ' Agregar filas de datos manualmente
        dt.Rows.Add("1", "Juan Perez", "password123", "12345678", "Vigente")
        dt.Rows.Add("2", "Maria Lopez", "password456", "87654321", "No vigente")
        dt.Rows.Add("3", "Carlos Sanchez", "password789", "11223344", "Vigente")

        ' Enlazar el DataTable al GridView
        dgvUsuarios.DataSource = dt
        dgvUsuarios.DataBind()
    End Sub
End Class