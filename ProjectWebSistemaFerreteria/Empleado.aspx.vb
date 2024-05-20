Public Class Formulario_web1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindGridView()
    End Sub
    Private Sub BindGridView()
        ' Crear un DataTable en memoria
        Dim dt As New DataTable()
        dt.Columns.Add("Codigo")
        dt.Columns.Add("DNI")
        dt.Columns.Add("Tipo")
        dt.Columns.Add("Nombres")
        dt.Columns.Add("Apellidos")
        dt.Columns.Add("FechaNacimiento")
        dt.Columns.Add("Celular")
        dt.Columns.Add("Sexo")
        dt.Columns.Add("Email")
        dt.Columns.Add("Dirección")
        dt.Columns.Add("Vigente")

        dt.Rows.Add("1", "76063807", "Gerente", "Luis", "Santamaria", "26-01-2004", "988625130", "M",
                    "fersanchl26@gmail.com", "San Jose", "Vigente")
        dgvEmpleado.DataSource = dt
        dgvEmpleado.DataBind()
    End Sub
End Class