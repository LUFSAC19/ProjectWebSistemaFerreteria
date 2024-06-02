
Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Login
    Inherits System.Web.UI.Page
    Dim objUsuario As New clsUsuario
    Public dni As String = ""
    Public dniCambiar As String = ""
    Protected Sub btnLogin_Click1(sender As Object, e As EventArgs)
        Try
            If objUsuario.validarExistencia(txtUser.Text).Length > 0 Then

                If objUsuario.validarVigencia(txtUser.Text) Then
                    dni = objUsuario.login(txtUser.Text, txtPassword.Text)
                    If dni = "" Then
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SCP", "alert('user incorrecto o password incorrecto');", True)
                    Else
                        Response.Redirect("Producto.aspx")
                        txtUser.Text = ""
                        txtPassword.Text = ""
                    End If

                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SCP", "alert('Usuario no vigente');", True)

                End If

            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ERROR", ex.Message, True)
        End Try

    End Sub

    Protected Sub lblOlvidePassword_Click(sender As Object, e As EventArgs)
        If txtUser.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('Coloque su usuario');", True)
        Else
            dniCambiar = objUsuario.buscarDnixUsuario(txtUser.Text)
            Session("dniCambiar") = dniCambiar
            Response.Redirect("CambiarContra.aspx")
        End If

    End Sub
End Class
