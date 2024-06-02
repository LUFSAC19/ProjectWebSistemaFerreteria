Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web13
    Inherits System.Web.UI.Page
    Dim objTP As New clsTipoProducto
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            limpiarBotones()
        End If
    End Sub
    Private Sub BindGridView()
        dgvTipoProducto.DataSource = objTP.listarTipoProducto()
        dgvTipoProducto.DataBind()
    End Sub
    Public Sub limpiarBotones()
        txtCodigo.Text = ""
        txtNombre.Text = ""
        txtDescripcion.Text = ""
        cbxSexo.SelectedIndex = 0
    End Sub
    Public Sub habiliarBotones(est As Boolean)
        btnGuardar.Enabled = est
        btnModificar.Enabled = est
        btnEliminar.Enabled = est
        btnDarBaja.Enabled = est
        btnLimpiar.Enabled = est
    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            If btnGuardar.Text = "Nuevo" Then
                btnGuardar.Text = "Guardar"
                habiliarBotones(False)
                limpiarBotones()
                txtCodigo.Text = objTP.generarIDTipoProducto
            Else
                btnGuardar.Text = "Nuevo"
                objTP.registrarTipoProducto(CInt(txtCodigo.Text), txtNombre.Text, txtDescripcion.Text,
                IIf(cbxSexo.SelectedIndex = 0, 1, 0))
                BindGridView()
                habiliarBotones(True)
                limpiarBotones()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            objTP.modificarTipoProducto(CInt(txtCodigo.Text), txtNombre.Text, txtDescripcion.Text,
            IIf(cbxSexo.SelectedIndex = 0, 1, 0))
            BindGridView()
            limpiarBotones()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            objTP.eliminarTipoProducto(CInt(txtCodigo.Text))
            BindGridView()
            limpiarBotones()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            objTP.darDeBajaTP(CInt(txtCodigo.Text))
            BindGridView()
            limpiarBotones()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub
End Class