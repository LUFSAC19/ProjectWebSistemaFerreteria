Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class CambiarContra
    Inherits System.Web.UI.Page
    Dim objUsuario As New clsUsuario
    Dim log As New Login


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCambiar_Click(sender As Object, e As EventArgs)
        Dim dni = txtDNI.Text
        Dim dniActual = Session("dniCambiar")
        If dni.Equals(dniActual) Then
            If txtConfirmarContraseña.Text = txtNuevaContraseña.Text Then
                objUsuario.cambiarContraseña(txtConfirmarContraseña.Text, txtDNI.Text)
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SCP", "alert('Contraseña exitosamente cambiada');", True)
                txtDNI.Text = ""
                txtConfirmarContraseña.Text = ""
                txtNuevaContraseña.Text = ""
                Session.Remove("dniCambiar")
                Response.Redirect("Login.aspx")
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SCP", "alert('Las contraseñas deben ser iguales');", True)
            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SCP", "alert('Este dni no le pertenece a tu user, 
                            ingrese correctamente :)');", True)

        End If
    End Sub

    Protected Sub btnRegresar_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub
End Class