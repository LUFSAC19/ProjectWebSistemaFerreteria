Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web15
    Inherits System.Web.UI.Page
    Dim objUsu As New clsUsuario

    Public Sub habiliarBotones(est As Boolean)
        btnBuscar.Enabled = est
        btnDarBaja.Enabled = est
        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est

    End Sub
    Public Sub limpiarControles()
        txtId.Text = ""
        txtNombre.Text = ""
        txtPassword.Text = ""
        txtDni.Text = ""
        cbxVigencia.SelectedIndex = 0
    End Sub

    Private Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        If btnGuardar.Text = "Nuevo" Then
            btnGuardar.Text = "Guardar"
            limpiarControles()
            txtId.Text = objUsu.generarIdUsuario()
            habiliarBotones(False)

        Else
            btnGuardar.Text = "Nuevo"
            Try
                objUsu.registrarUsuario(CInt(txtId.Text), txtNombre.Text, txtPassword.Text, txtDni.Text, IIf(cbxVigencia.SelectedIndex = 0, 1, 0))
                GridView()
                limpiarControles()
                habiliarBotones(True)
            Catch ex As Exception
                MessageBox.Show("Error al registrar", "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub
    Private Sub GridView()
        dgvUsuarios.DataSource = objUsu.listarUsuario()
        dgvUsuarios.DataBind()
    End Sub

    Private Sub Formulario_web15_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GridView()
            limpiarControles()

        End If
    End Sub

    Private Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        Dim dtUsu As New DataTable

        Try
            dtUsu = objUsu.buscarUsuario(CInt(txtId.Text))
            txtId.Text = ""
            txtNombre.Text = ""
            txtPassword.Text = ""
            txtDni.Text = ""
            cbxVigencia.SelectedIndex = 0
            If dtUsu.Rows.Count > 0 Then
                txtId.Text = dtUsu.Rows(0).Item(0)
                txtNombre.Text = dtUsu.Rows(0).Item(1)
                txtPassword.Text = dtUsu.Rows(0).Item(2)
                txtDni.Text = dtUsu.Rows(0).Item(3)
                cbxVigencia.SelectedIndex = IIf(dtUsu.Rows(0).Item(4), cbxVigencia.SelectedIndex = 0, cbxVigencia.SelectedIndex = 1)
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarControles()
    End Sub

    Protected Sub btnModificar_Click1(sender As Object, e As EventArgs)
        Try
            objUsu.modificarUsuario(CInt(txtId.Text), txtNombre.Text, txtPassword.Text, txtDni.Text, IIf(cbxVigencia.SelectedIndex = 0, True, False))
            GridView()
            limpiarControles()

        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnEliminar_Click1(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de eliminar el usuario: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                objUsu.eliminarUsuario(CInt(txtId.Text))
                GridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnDarBaja_Click1(sender As Object, e As EventArgs)
        Try
            objUsu.darBajaUsuario(CInt(txtId.Text))
            GridView()
            limpiarControles()

        Catch ex As Exception
            MessageBox.Show(ex.Message, "SCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub


End Class