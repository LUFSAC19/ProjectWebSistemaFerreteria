Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web12
    Inherits System.Web.UI.Page
    Dim objTE As New clsTipoEmpleado
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            limpiarControles()
        End If
    End Sub

    Private Sub BindGridView()
        dgvTipoEmpleado.DataSource = objTE.listarTipoEmpleado()
        dgvTipoEmpleado.DataBind()
    End Sub
    Public Sub habiliarBotones(est As Boolean)
        'btnBuscar.Enabled = est
        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est
    End Sub
    Private Sub limpiarControles()
        txtCodigo.Text = ""
        txtNombres.Text = ""
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        If btnGuardar.Text = "Nuevo" Then

            limpiarControles()
            btnGuardar.Text = "Guardar"
            habiliarBotones(False)
            txtCodigo.Text = objTE.generarIdTipoEmpleado()
        Else
            btnGuardar.Text = "Nuevo"
            objTE.registrarTipoEmpleado(CInt(txtCodigo.Text), txtNombres.Text)
            BindGridView()
            limpiarControles()
            habiliarBotones(True)
        End If
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de modificar el tipo empleado: " & txtNombres.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)

            If response = vbOK Then
                objTE.modificarTipoEmpleado(CInt(txtCodigo.Text), txtNombres.Text)
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de eliminar el tipo empleado: " & txtNombres.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)

            If response = vbOK Then
                objTE.eliminarTipoEmpleado(CInt(txtCodigo.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarControles()
    End Sub
End Class