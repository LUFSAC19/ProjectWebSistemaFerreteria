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

        ' Aseguramos que todos los controles estén inicialmente visibles o no según el tipo de cliente seleccionado
        UpdateVisibilityBasedOnTipoCliente()
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

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim codTC = objTipCli.obtenerCodigoTipoClientexNombre(cbxTipoCliente.Text)
            objCli.modificarCliente(CInt(txtNumero.Text), chbxVigencia.Checked, txtTelefono.Text,
                 txtCorreo.Text, txtDireccion.Text, txtCiudad.Text, txtRuc.Text, txtRazonSocial.Text,
                 txtRepresentante.Text, txtDni.Text, txtNombre.Text, txtApellidos.Text,
                 txtFecha.Text, IIf(cbxSexo.Text = "Masculino", 0, 1), codTC)
            BindGridView()
            limpiarControles()
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
            response = MessageBox.Show("Está seguro de modificar el cliente: " & txtNombre.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

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
            objCli.darBajaCliente(CInt(txtNumero.Text))
            BindGridView()
            limpiarControles()
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Private Sub Formulario_web11_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            listarTipoClienteVigente()
            limpiarControles()
        End If
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            If btnGuardar.Text = "Nuevo" Then
                btnGuardar.Text = "Guardar"
                habiliarBotones(False)
                limpiarControles()
                txtNumero.Text = objCli.generarCodigoCliente()
            Else
                If objCli.verificarExistenciaDocumentoCliente(txtDni.Text) Or objCli.verificarExistenciaDocumentoCliente(txtRuc.Text) Then
                    MessageBox.Show("Este DNI o RUC ya existe")
                Else
                    Dim codTC As Integer = objTipCli.obtenerCodigoTipoClientexNombre(cbxTipoCliente.Text)

                    objCli.registrarCliente(CInt(txtNumero.Text), chbxVigencia.Checked, txtTelefono.Text,
                    txtCorreo.Text, txtDireccion.Text, txtCiudad.Text, txtRuc.Text, txtRazonSocial.Text,
                    txtRepresentante.Text, txtDni.Text, txtNombre.Text, txtApellidos.Text,
                    txtFecha.Text, IIf(cbxSexo.Text = "Masculino", 0, 1), codTC)
                    BindGridView()
                    habiliarBotones(True)
                    limpiarControles()
                    btnGuardar.Text = "Nuevo"
                End If
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub


    Private Sub UpdateVisibilityBasedOnTipoCliente()
        txtRazonSocial.Visible = False
        txtRepresentante.Visible = False
        txtRuc.Visible = False
        txtDni.Visible = False
        txtNombre.Visible = False
        txtApellidos.Visible = False
        cbxSexo.Visible = False
        txtFecha.Visible = False

        Select Case cbxTipoCliente.SelectedIndex
            Case 0 ' Cliente Natural
                txtDni.Visible = True
                txtNombre.Visible = True
                txtApellidos.Visible = True
                cbxSexo.Visible = True
                txtFecha.Visible = True
            Case 1 ' Cliente Jurídico
                txtRazonSocial.Visible = True
                txtRepresentante.Visible = True
                txtRuc.Visible = True
            Case 2 ' Cliente Mixto
                txtRazonSocial.Visible = True
                txtRepresentante.Visible = True
                txtRuc.Visible = True
                txtDni.Visible = True
                txtNombre.Visible = True
                txtApellidos.Visible = True
                cbxSexo.Visible = True
                txtFecha.Visible = True
        End Select

        ' Actualizar etiquetas visibles/invisibles según la selección
        lblRazonSocial.Visible = txtRazonSocial.Visible
        lblRepresentante.Visible = txtRepresentante.Visible
        lblRuc.Visible = txtRuc.Visible
        lblDni.Visible = txtDni.Visible
        lblNombre.Visible = txtNombre.Visible
        lblApellidos.Visible = txtApellidos.Visible
        lblSexo.Visible = cbxSexo.Visible
        lblFecha.Visible = txtFecha.Visible
    End Sub

    Protected Sub cbxTipoCliente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbxTipoCliente.SelectedIndexChanged
        UpdateVisibilityBasedOnTipoCliente()
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        Dim dtC As New DataTable
        Try
            dtC = objCli.buscarCliente(CInt(txtNumero.Text))
            If dtC.Rows.Count > 0 Then
                Dim codTipCli As Integer = dtC.Rows(0).Field(Of Integer)("codTipo")
                cbxTipoCliente.SelectedIndex = codTipCli - 1

                ' Asignar valores comunes a todos los tipos de cliente
                txtNumero.Text = dtC.Rows(0).Field(Of Integer)("codCliente")
                chbxVigencia.Checked = dtC.Rows(0).Field(Of Boolean)("vigencia")
                txtTelefono.Text = dtC.Rows(0).Field(Of String)("numCelular")
                txtCorreo.Text = dtC.Rows(0).Field(Of String)("email")
                txtDireccion.Text = dtC.Rows(0).Field(Of String)("direccion")
                txtCiudad.Text = dtC.Rows(0).Field(Of String)("ciudad")

                UpdateVisibilityBasedOnTipoCliente() ' Actualizar visibilidad de controles según el tipo de cliente

                Select Case codTipCli
                    Case 1 ' Cliente Natural
                        txtRuc.Text = ""
                        txtRazonSocial.Text = ""
                        txtRepresentante.Text = ""
                        txtDni.Text = dtC.Rows(0).Field(Of String)("dni")
                        txtNombre.Text = dtC.Rows(0).Field(Of String)("nombres")
                        txtApellidos.Text = dtC.Rows(0).Field(Of String)("apellidos")
                        cbxSexo.Text = If(dtC.Rows(0).Field(Of Boolean)("sexo"), "Masculino", "Femenino")
                        txtFecha.Text = dtC.Rows(0).Field(Of Date)("fechaNac")

                    Case 2 ' Cliente Jurídico
                        txtDni.Text = ""
                        txtNombre.Text = ""
                        txtApellidos.Text = ""
                        cbxSexo.SelectedIndex = 0
                        txtFecha.Text = ""
                        txtRuc.Text = dtC.Rows(0).Field(Of String)("ruc")
                        txtRazonSocial.Text = dtC.Rows(0).Field(Of String)("razon_social")
                        txtRepresentante.Text = dtC.Rows(0).Field(Of String)("representante")

                    Case 3 ' Cliente Mixto
                        txtRuc.Text = dtC.Rows(0).Field(Of String)("ruc")
                        txtRazonSocial.Text = dtC.Rows(0).Field(Of String)("razon_social")
                        txtRepresentante.Text = dtC.Rows(0).Field(Of String)("representante")
                        txtDni.Text = dtC.Rows(0).Field(Of String)("dni")
                        txtNombre.Text = dtC.Rows(0).Field(Of String)("nombres")
                        txtApellidos.Text = dtC.Rows(0).Field(Of String)("apellidos")
                        cbxSexo.Text = If(dtC.Rows(0).Field(Of Boolean)("sexo"), "Masculino", "Femenino")
                        txtFecha.Text = dtC.Rows(0).Field(Of Date)("fechaNac")
                End Select
            Else
                limpiarControles()
            End If
        Catch ex As Exception
        End Try
    End Sub
End Class

