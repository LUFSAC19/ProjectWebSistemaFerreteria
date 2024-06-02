Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web14
    Inherits System.Web.UI.Page
    Dim objTC As New clsTipoCliente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            BindGridView()
            limpiarControles()
        End If
    End Sub

    Private Sub BindGridView()

        dgvTipoCliente.DataSource = objTC.listarTipoClientesVigentes()
        dgvTipoCliente.DataBind()
    End Sub
    Private Sub limpiarControles()
        txtCodigo.Text = ""
        txtNombre.Text = ""
        cbxSexo.SelectedIndex = 0
    End Sub
    Public Sub habiliarBotones(est As Boolean)

        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            If btnGuardar.Text = "Nuevo" Then
                btnGuardar.Text = "Guardar"
                habiliarBotones(False)
                limpiarControles()
                txtCodigo.Text = objTC.generarCodigoTipoCliente()
            Else
                objTC.registrarTipoCliente(CInt(txtCodigo.Text), txtNombre.Text, IIf(cbxSexo.SelectedIndex = 0, 1, 0))
                habiliarBotones(True)
                BindGridView()
                limpiarControles()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de modificar el tipo cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                objTC.modificarTipoCliente(CInt(txtCodigo.Text), txtNombre.Text, IIf(cbxSexo.SelectedIndex = 0, 1, 0))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de eliminar el tipo cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)
            If response = vbOK Then
                objTC.eliminarTipoCliente(CInt(txtCodigo.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de dar de baja el tipo cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                objTC.darBajaTipoCliente(CInt(txtCodigo.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarControles()
    End Sub

End Class