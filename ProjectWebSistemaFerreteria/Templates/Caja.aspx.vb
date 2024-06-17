Imports System.Drawing
Imports System.Windows.Forms
Imports prjCapaNegocio
Public Class Formulario_web17
    Inherits System.Web.UI.Page
    Dim objCaja As New clsCaja
    Dim objApe As New clsApertura_caja
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            listarCajas()
        End If
        labelMensaje.Text = ""
        labelMensaje.ForeColor = Color.Red
    End Sub

    Protected Sub listarCajas()
        dgvCaja.DataSource = objCaja.listarCaja()
        dgvCaja.DataBind()
    End Sub

    Public Sub limpiarControles()
        txtCaja.Text = ""
        txtEstado.Text = ""
        txtVigencia.Text = ""
        btnBloquear.Text = "Bloquear"
        btnNuevo.Text = "Nuevo"
        btnLimpiar.Text = "Limpiar"
        btnBloquear.Enabled = True
        btnDarBaja.Enabled = True
        btnEliminar.Enabled = True
        labelMensaje.Text = ""

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        Dim dtCaj As New DataTable
        Try
            dtCaj = objCaja.buscarCaja(CInt(txtCaja.Text))
            If dtCaj.Rows.Count > 0 Then
                txtCaja.Text = dtCaj.Rows(0).Item(0)
                If dtCaj.Rows(0).Item(1) = "A" Then
                    txtEstado.Text = "Abierta"
                    txtEstado.ForeColor = Color.FromArgb(0, 153, 51)
                    btnBloquear.Text = "Bloquear"
                ElseIf dtCaj.Rows(0).Item(1) = "C" Then
                    txtEstado.Text = "Cerrada"
                    txtEstado.ForeColor = Color.FromArgb(204, 0, 0)
                    btnBloquear.Text = "Bloquear"
                ElseIf dtCaj.Rows(0).Item(1) = "B" Then
                    txtEstado.Text = "Bloqueada"
                    txtEstado.ForeColor = Color.Black
                    btnBloquear.Text = "Desbloquear"

                End If

                txtVigencia.Text = IIf(dtCaj.Rows(0).Item(2), "Vigente", "No vigente")
            Else
                limpiarControles()
            End If
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs)
        Try
            If btnNuevo.Text = "Nuevo" Then
                limpiarControles()
                btnNuevo.Text = "Guardar"
                txtCaja.Text = objCaja.generarNumeroCaja()
                txtEstado.Text = "Cerrada"
                txtEstado.ForeColor = Color.FromArgb(204, 0, 0)
                txtVigencia.Text = "Vigente"
                btnLimpiar.Text = "Cancelar"
                btnBloquear.Enabled = False
                btnDarBaja.Enabled = False
                btnEliminar.Enabled = False
            Else
                btnNuevo.Text = "Nuevo"
                Dim est = "C"
                objCaja.registrarCaja(CInt(txtCaja.Text), est, True)
                listarCajas()
                limpiarControles()
            End If

        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnBloquear_Click(sender As Object, e As EventArgs)
        Try
            btnBuscar_Click(Nothing, Nothing)
            If txtEstado.Text = "Abierta" Then
                labelMensaje.Text = "La caja está abierta. Debe estar cerrada para bloquearla"
            Else
                If btnBloquear.Text = "Bloquear" Then
                    objCaja.bloquearCaja(Integer.Parse(txtCaja.Text))
                    listarCajas()
                    btnBuscar_Click(Nothing, Nothing)
                Else
                    objCaja.desbloquearCaja(Integer.Parse(txtCaja.Text))
                    listarCajas()
                    btnBuscar_Click(Nothing, Nothing)
                End If
            End If

        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            btnBuscar_Click(Nothing, Nothing)
            If txtEstado.Text = "Abierta" Then
                labelMensaje.Text = "La caja está abierta. Debe estar cerrada para darle de baja"
            ElseIf txtVigencia.Text = "No vigente" Then
                labelMensaje.Text = "La caja ya está dada de baja."
            Else
                objCaja.darBajaCaja(Integer.Parse(txtCaja.Text))
                listarCajas()
                btnBuscar_Click(Nothing, Nothing)
            End If
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs)
        Try
            btnBuscar_Click(Nothing, Nothing)
            If txtEstado.Text = "Abierta" Then
                labelMensaje.Text = "La caja está abierta. Debe estar cerrada para eliminarla"
            Else
                objCaja.eliminarCaja(Integer.Parse(txtCaja.Text))
                listarCajas()
                limpiarControles()
            End If
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarControles()
    End Sub

End Class