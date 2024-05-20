Public Class Formulario_web13
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        BindGridView()
    End Sub
    Private Sub BindGridView()
        ' Crear un DataTable en memoria
        Dim dt As New DataTable()
        dt.Columns.Add("Codigo")
        dt.Columns.Add("Nombre")
        dt.Columns.Add("Descripcion")
        dt.Columns.Add("Vigencia")

        ' Agregar filas de datos manualmente
        dt.Rows.Add("001", "Producto A", "Descripción del Producto A", "Vigente")
        dt.Rows.Add("002", "Producto B", "Descripción del Producto B", "No vigente")
        dt.Rows.Add("003", "Producto C", "Descripción del Producto C", "Vigente")

        ' Enlazar el DataTable al GridView
        dgvTipoProducto.DataSource = dt
        dgvTipoProducto.DataBind()
    End Sub
End Class