Imports prjCapaNegocio

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Unnamed2_Click1(sender As Object, e As EventArgs)
        Response.Redirect("Empleado.aspx")
    End Sub
End Class