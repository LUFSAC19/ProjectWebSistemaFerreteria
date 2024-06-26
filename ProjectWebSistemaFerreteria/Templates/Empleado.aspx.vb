﻿Imports System.Web.Routing
Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web1
    Inherits System.Web.UI.Page
    Dim objEmp As New clsEmpleado
    Dim objTE As New clsTipoEmpleado
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            listarTipoEmpleadosCombo()
        End If
    End Sub
    Private Sub listarTipoEmpleadosCombo()
        Try
            cbxTipoEmpleado.DataSource = objTE.listarTipoEmpleadoNombres()

            cbxTipoEmpleado.DataTextField = "nombre" ' Cambia esto por el nombre de la columna que contiene el nombre

            cbxTipoEmpleado.DataBind()
        Catch ex As Exception
            ' Maneja la excepción si es necesario
            MessageBox.Show("Error al listar tipos de empleados", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub BindGridView()
        dgvEmpleado.DataSource = objEmp.listarEmpleado()
        dgvEmpleado.DataBind()
    End Sub

    Public Sub limpiarControles()
        txtCodigo.Text = ""
        txtDni.Text = ""
        txtNombres.Text = ""
        txtApellidos.Text = ""
        txtEmail.Text = ""
        txtCelular.Text = ""
        txtDireccion.Text = ""
        chbxVigente.Checked = False
        cbxTipoEmpleado.SelectedIndex = 0
        cbxSexo.SelectedIndex = 0
        txtFecha.Text = ""

    End Sub
    Public Sub habiliarBotones(est As Boolean)
        'btnBuscar.Enabled = est
        btnDarBaja.Enabled = est
        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est

    End Sub
    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            If btnGuardar.Text = "Nuevo" Then
                btnGuardar.Text = "Guardar"
                limpiarControles()
                txtCodigo.Text = objEmp.generarIdEmpleado()
                habiliarBotones(False)
            Else
                btnGuardar.Text = "Nuevo"
                habiliarBotones(True)
                Dim idTE = objTE.buscarIDxNombreTE(cbxTipoEmpleado.Text)
                objEmp.registrarEmpleado(CInt(txtCodigo.Text), idTE, txtDni.Text, txtNombres.Text,
                    txtApellidos.Text, txtFecha.Text, IIf(cbxSexo.Text = "Masculino", True, False),
                     txtCelular.Text, txtEmail.Text, txtDireccion.Text, chbxVigente.Checked)
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "TCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de modificar el empleado: " & txtNombres.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                Dim idTE = objTE.buscarIDxNombreTE(cbxTipoEmpleado.Text)
                objEmp.modificarEmpleado(CInt(txtCodigo.Text), idTE, txtDni.Text, txtNombres.Text,
                txtApellidos.Text, txtFecha.Text, IIf(cbxSexo.Text = "Masculino", True, False),
                 txtCelular.Text, txtEmail.Text, txtDireccion.Text, chbxVigente.Checked)
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "TCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de eliminar el empleado: " & txtNombres.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                objEmp.eliminarEmpleado(CInt(txtCodigo.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "TCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            Dim response
            response = MessageBox.Show("Esta seguro de dar de baja el empleado: " & txtNombres.Text, "SCP", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)

            If response = vbOK Then
                objEmp.darBajaEmpleado(CInt(txtCodigo.Text))
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message, "TCP", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarControles()
    End Sub

    Protected Sub btnBuscarEmp_Click(sender As Object, e As EventArgs)
        Dim dtEmp As New DataTable
        Try
            dtEmp = objEmp.buscarEmpleado(CInt(txtCodigo.Text))
            cbxTipoEmpleado.SelectedIndex = 0
            txtDni.Text = ""
            txtNombres.Text = ""
            txtApellidos.Text = ""
            txtFecha.Text = ""
            cbxSexo.SelectedIndex = 0
            txtCelular.Text = ""
            txtEmail.Text = ""
            txtDireccion.Text = ""
            chbxVigente.Checked = True
            If dtEmp.Rows.Count > 0 Then
                txtCodigo.Text = dtEmp.Rows(0).Item(0)
                Dim nomTE = objTE.buscarTipoEmpleado(dtEmp.Rows(0).Item(1))
                cbxTipoEmpleado.Text = nomTE.Rows(0).Item(1)
                txtDni.Text = dtEmp.Rows(0).Item(2)
                txtNombres.Text = dtEmp.Rows(0).Item(3)
                txtApellidos.Text = dtEmp.Rows(0).Item(4)
                txtFecha.Text = dtEmp.Rows(0).Item(5)
                cbxSexo.Text = IIf(dtEmp.Rows(0).Item(6), "Masculino", "Femenino")
                txtCelular.Text = dtEmp.Rows(0).Item(7)
                txtEmail.Text = dtEmp.Rows(0).Item(8)
                txtDireccion.Text = dtEmp.Rows(0).Item(9)
                chbxVigente.Checked = dtEmp.Rows(0).Item(10)
            End If
        Catch ex As Exception
            MessageBox.Show("Error al buscar")
        End Try
    End Sub

End Class