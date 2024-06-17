
Imports System.Windows.Forms
Imports prjCapaNegocio

Public Class Formulario_web16
    Inherits System.Web.UI.Page
    Dim objProducto As New clsProducto
    Dim objTP As New clsTipoProducto
    Dim objMP As New clsMarca


    Private Sub listarTipoCombo()
        cbxTP.DataSource = objTP.listarTipoProducto()
        cbxTP.DataTextField = "nombreTipoProd"
        cbxTP.DataBind()
    End Sub
    Private Sub listarMarcaCombo()
        cbxMarca.DataSource = objMP.listarMarca()
        cbxMarca.DataTextField = "nombreMarca"
        cbxMarca.DataBind()
    End Sub
    Public Sub habiliarBotones(est As Boolean)
        'btnBuscar.Enabled = est
        btnDarBaja.Enabled = est
        btnEliminar.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est

    End Sub
    Public Sub limpiarControles()
        txtNumero.Text = ""
        cbxTP.SelectedIndex = 0
        chbxVigencia.Checked = False
        txtNombre.Text = ""
        cbxMarca.SelectedIndex = 0
        txtDescripcion.Text = ""
        txtStock.Text = ""
        txtStockMin.Text = ""
        txtPrecio.Text = ""

    End Sub
    Private Sub BindGridView()
        dgvProducto.DataSource = objProducto.listarProducto()
        dgvProducto.DataBind()
    End Sub
    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs)
        Try
            If btnNuevo.Text = "Nuevo" Then
                btnNuevo.Text = "Guardar"
                habiliarBotones(False)
                limpiarControles()
                txtNumero.Text = objProducto.generarIdProducto
            Else

                Dim codTP = objTP.buscaridTPxNombre(cbxTP.Text)
                Dim idM = objMP.buscarIDxNombreMarca(cbxMarca.Text)
                objProducto.registrarProducto(txtNumero.Text, codTP, txtNombre.Text, idM,
                txtDescripcion.Text, txtStock.Text, txtStockMin.Text, txtPrecio.Text,
                chbxVigencia.Checked)
                BindGridView()
                limpiarControles()
                habiliarBotones(True)
                btnNuevo.Text = "Nuevo"
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
            Dim resp = MessageBox.Show("¿Desea eliminar el producto " & txtNombre.Text & " ?", "SCP", MessageBoxButtons.YesNo, MessageBoxIcon.Question)

            'MessageBox.Show(resp) bota 6 si es si, 7 si es no
            If resp = DialogResult.Yes Then
                objProducto.eliminarProducto(txtNumero.Text)
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            Dim resp = MessageBox.Show("¿Desea dar de baja el producto " & txtNombre.Text & " ?", "SCP", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If resp = DialogResult.Yes Then
                objProducto.darDeBajaProducto(txtNumero.Text)
                BindGridView()
                limpiarControles()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        Dim dtProduc As New DataTable

        Try
            dtProduc = objProducto.buscarProducto(txtNumero.Text)
            If dtProduc.Rows.Count > 0 Then
                txtNumero.Text = dtProduc.Rows(0).Item(0)

                cbxTP.SelectedIndex = dtProduc.Rows(0).Item(1) - 1
                txtNombre.Text = dtProduc.Rows(0).Item(2)

                cbxMarca.SelectedIndex = dtProduc.Rows(0).Item(3) - 1
                txtDescripcion.Text = dtProduc.Rows(0).Item(4)
                txtStock.Text = dtProduc.Rows(0).Item(5)
                txtStockMin.Text = dtProduc.Rows(0).Item(6)
                txtPrecio.Text = dtProduc.Rows(0).Item(7)
                chbxVigencia.Checked = dtProduc.Rows(0).Item(8)
            Else
                MessageBox.Show("No existe producto")
            End If
        Catch ex As Exception
            MessageBox.Show("Error al buscar producto")
        End Try
    End Sub

    Private Sub Formulario_web16_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            listarTipoCombo()
            listarMarcaCombo()

        End If
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim resp = MessageBox.Show("Desea modificar el producto " & txtNombre.Text & "??")
            If resp = DialogResult.Yes Then
                Dim codTP = objTP.buscaridTPxNombre(cbxTP.Text)
                Dim idM = objMP.buscarIDxNombreMarca(cbxMarca.Text)
                objProducto.modificarProducto(txtNumero.Text, codTP, txtNombre.Text, idM,
                txtDescripcion.Text, txtStock.Text, txtStockMin.Text, txtPrecio.Text,
                chbxVigencia.Checked)
                BindGridView()
                limpiarControles()
            End If

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try
    End Sub
End Class