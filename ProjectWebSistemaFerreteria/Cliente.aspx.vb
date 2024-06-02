Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web11
    Inherits System.Web.UI.Page
    Dim objCli As New clsCliente
    Dim objTipCli As New clsTipoCliente


    Private Sub limpiarControles()
        txtNumero.Text = ""
        txtApellidos.Text = ""
        txtCiudad.Text = ""
        txtCorreo.Text = ""
        txtDireccion.Text = ""
        txtDni.Text = ""
        txtNombre.Text = ""
        txtRazonSocial.Text = ""
        txtRepresentante.Text = ""
        txtRuc.Text = ""
        txtTelefono.Text = ""
        chbxVigencia.Checked = False
        cbxSexo.SelectedIndex = 0
        cbxTipoCliente.SelectedIndex = 0
        txtFecha.Text = ""
    End Sub
    Public Sub habiliarBotones(est As Boolean)
        'btnBuscar.Enabled = est
        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est
        btnDarBaja.Enabled = est

    End Sub
    Private Sub BindGridView()

        dgvCliente.DataSource = objCli.listarClientes()
        dgvCliente.DataBind()
    End Sub
    Private Sub listarTipoClienteVigente()
        cbxTipoCliente.DataSource = objTipCli.listarTipoClientesVigentes()
        cbxTipoCliente.DataTextField = "nombre"
        cbxTipoCliente.DataBind()
    End Sub
    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs)
        Try
            If btnNuevo.Text = "Nuevo" Then
                btnNuevo.Text = "Guardar"
                habiliarBotones(False)
                limpiarControles()
                txtNumero.Text = objCli.generarCodigoCliente()
            Else

                If objCli.verificarExistenciaDocumentoCliente(txtDni.Text) Or objCli.verificarExistenciaDocumentoCliente(txtRuc.Text) Then
                    MessageBox.Show("Este dni o ruc ya existe")
                Else
                    Dim codTC = objTipCli.obtenerCodigoTipoClientexNombre(cbxTipoCliente.Text)
                    objCli.registrarCliente(CInt(txtNumero.Text), chbxVigencia.Checked, txtTelefono.Text,
                    txtCorreo.Text, txtDireccion.Text, txtCiudad.Text, txtRuc.Text, txtRazonSocial.Text,
                    txtRepresentante.Text, txtDni.Text, txtNombre.Text, txtApellidos.Text,
                    txtFecha.Text, IIf(cbxSexo.Text = "Masculino", 0, 1), codTC)
                    BindGridView()
                    habiliarBotones(True)
                    limpiarControles()
                    btnNuevo.Text = "Nuevo"
                End If

            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de modificar el cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)
            If response = vbOK Then

                Dim codTC = objTipCli.obtenerCodigoTipoClientexNombre(cbxTipoCliente.Text)

                objCli.modificarCliente(CInt(txtNumero.Text), chbxVigencia.Checked, txtTelefono.Text,
                 txtCorreo.Text, txtDireccion.Text, txtCiudad.Text, txtRuc.Text, txtRazonSocial.Text,
                 txtRepresentante.Text, txtDni.Text, txtNombre.Text, txtApellidos.Text,
                 txtFecha.Text, IIf(cbxSexo.Text = "Masculino", 0, 1), codTC)
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

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de modificar el cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)
            If response = vbOK Then
                objCli.eliminarCliente(CInt(txtNumero.Text))
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
            response = MessageBox.Show("Esta seguro de modificar el cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            Console.WriteLine(response)
            If response = vbOK Then
                objCli.darBajaCliente(CInt(txtNumero.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Formulario_web11_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            listarTipoClienteVigente()
        End If
    End Sub


    Protected Sub Unnamed1_Click1(sender As Object, e As EventArgs)
        Dim dtC As New DataTable
        Try
            dtC = objCli.buscarCliente(CInt(txtNumero.Text))
            If dtC.Rows.Count > 0 Then
                Dim codTipCli = dtC.Rows(0).Item(14)
                txtNumero.Text = dtC.Rows(0).Item(0)
                chbxVigencia.Checked = dtC.Rows(0).Item(1)
                txtTelefono.Text = dtC.Rows(0).Item(2)
                txtCorreo.Text = dtC.Rows(0).Item(3)
                txtDireccion.Text = dtC.Rows(0).Item(4)
                txtCiudad.Text = dtC.Rows(0).Item(5)

                Dim nombre = objTipCli.buscarTipoCliente(CInt(codTipCli)).Rows(0).Item(1)
                cbxTipoCliente.Text = nombre

                If codTipCli = 1 Then

                    txtDni.Text = dtC.Rows(0).Item(9)
                    txtNombre.Text = dtC.Rows(0).Item(10)
                    txtApellidos.Text = dtC.Rows(0).Item(11)
                    cbxSexo.Text = IIf(dtC.Rows(0).Item(13), "Masculino", "Femenino")
                    txtFecha.Text = dtC.Rows(0).Item(12)
                ElseIf codTipCli = 2 Then

                    txtRuc.Text = dtC.Rows(0).Item(6)
                    txtRazonSocial.Text = dtC.Rows(0).Item(7)
                    txtRepresentante.Text = dtC.Rows(0).Item(8)

                ElseIf codTipCli = 3 Then

                    txtRuc.Text = dtC.Rows(0).Item(6)
                    txtDni.Text = dtC.Rows(0).Item(9)
                    txtNombre.Text = dtC.Rows(0).Item(10)
                    txtApellidos.Text = dtC.Rows(0).Item(11)
                    cbxSexo.Text = IIf(dtC.Rows(0).Item(13), "Masculino", "Femenino")
                    txtFecha.Text = dtC.Rows(0).Item(12)
                    txtRazonSocial.Text = dtC.Rows(0).Item(7)
                    txtRepresentante.Text = dtC.Rows(0).Item(8)
                End If
            Else
                MessageBox.Show("No se encontro el cliente")
                limpiarControles()
            End If
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub cbxTipoCliente_SelectedIndexChanged1(sender As Object, e As EventArgs)
        If cbxTipoCliente.SelectedIndex = 0 Then
            txtRazonSocial.Text = ""
            txtRepresentante.Text = ""
            txtRuc.Text = ""
            txtRazonSocial.Visible = False
            txtRepresentante.Visible = False
            txtRuc.Visible = False
            txtDni.Visible = True
            txtNombre.Visible = True
            txtApellidos.Visible = True
            cbxSexo.Visible = True
            txtFecha.Visible = True
            lblRazonSocial.Visible = False
            lblRepresentante.Visible = False
            lblRuc.Visible = False

            'txtRazonSocial.Text = ""
            'txtRepresentante.Text = ""
            'txtRuc.Text = ""

            lblDni.Visible = True
            lblNombre.Visible = True
            lblApellidos.Visible = True
            lblDni.Visible = True
            lblSexo.Visible = True
            lblFecha.Visible = True
        ElseIf cbxTipoCliente.SelectedIndex = 1 Then
            txtRazonSocial.Visible = True
            txtRepresentante.Visible = True
            txtRuc.Visible = True

            txtDni.Text = ""
            txtNombre.Text = ""
            txtApellidos.Text = ""
            txtDni.Visible = False
            txtNombre.Visible = False
            txtApellidos.Visible = False

            txtDni.Visible = False
            cbxSexo.Visible = False
            txtFecha.Visible = False

            lblRazonSocial.Visible = True
            lblRepresentante.Visible = True
            lblRuc.Visible = True
            lblDni.Visible = False
            lblNombre.Visible = False
            lblApellidos.Visible = False
            lblDni.Visible = False
            lblSexo.Visible = False
            lblFecha.Visible = False
        ElseIf cbxTipoCliente.SelectedIndex = 2 Then
            txtRazonSocial.Visible = True
            txtRepresentante.Visible = True
            txtRuc.Visible = True
            txtDni.Visible = True
            txtNombre.Visible = True
            txtApellidos.Visible = True
            txtDni.Visible = True
            cbxSexo.Visible = True
            txtFecha.Visible = True
            lblRazonSocial.Visible = True
            lblRepresentante.Visible = True
            lblRuc.Visible = True
            lblDni.Visible = True
            lblNombre.Visible = True
            lblApellidos.Visible = True
            lblDni.Visible = True
            lblSexo.Visible = True
            lblFecha.Visible = True
        End If
    End Sub
End Class