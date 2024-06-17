Imports System.Drawing
Imports System.Windows.Forms
Imports prjCapaNegocio
Public Class Formulario_web18
    Inherits System.Web.UI.Page
    Dim objCaja As New clsCaja
    Dim objApe As New clsApertura_caja
    Dim objEmp As New clsEmpleado
    Private numCajaAbierta As Integer = 0
    Private codEmpleadoCajero As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            listarCajas()
        End If
        codEmpleadoCajero = Session("idEmpleado")
        verificarAperturaCaja()
        labelMensaje.Text = ""
        labelMensaje.ForeColor = Color.Red
    End Sub

    Private Sub listarCajas()
        Dim datosCaja As DataTable = objCaja.listarCaja()

        Try
            cboCaja.Items.Add("ELEGIR")
            cboCaja.Items(cboCaja.Items.Count - 1).Attributes.Add("disabled", "disabled")
            For Each row As DataRow In datosCaja.Rows
                If row("vigencia") = True Then
                    cboCaja.Items.Add(row("numCaja"))
                End If
            Next

            cboCaja.SelectedIndex = 0

        Catch ex As Exception
            labelMensaje.Text = ex.Message

        End Try

    End Sub

    Private Sub verificarAperturaCaja()
        Dim numCajaAbiertax As Integer = objApe.obtenerNumCajaAbiertaPorEmpleado(Me.codEmpleadoCajero)
        If numCajaAbiertax > 0 Then
            Me.numCajaAbierta = numCajaAbiertax
            Session("codApertura") = objApe.obtenerAperturaDeCaja(numCajaAbiertax).Rows(0).Item(0)
        End If

    End Sub

    Private Sub modificarControles(estadoCaja As Char, numCaja As Integer)
        If estadoCaja = "A" Then
            lblEstado.Text = "ABIERTA"
            lblEstado.ForeColor = Color.FromArgb(0, 153, 51)
            lblMontoApCi.Text = "Monto de cuadre:"
            lblFechaApCi.Text = "Fecha apertura:"
            lblHoraApCi.Text = "Hora apertura:"

            btnAperturar.Text = "Cerrar caja"
            btnAperturar.Enabled = True
            txtMontoApCi.Text = ""
            txtMontoApCi.ReadOnly = False

        ElseIf estadoCaja = "B" Then
            lblEstado.Text = "BLOQUEADA"
            lblEstado.ForeColor = Color.Black
            lblMontoApCi.Text = "Monto de apertura:"
            lblFechaApCi.Text = "Fecha cierre:"
            lblHoraApCi.Text = "Hora cierre:"
            txtMontoApCi.Text = ""
            txtMontoApCi.ReadOnly = True

            btnAperturar.Text = "Abrir caja"
            btnAperturar.Enabled = False
        Else
            lblEstado.Text = "CERRADA"
            lblEstado.ForeColor = Color.FromArgb(204, 0, 0)
            lblMontoApCi.Text = "Monto de apertura:"
            lblFechaApCi.Text = "Fecha cierre:"
            lblHoraApCi.Text = "Hora cierre:"
            txtMontoApCi.Text = ""

            btnAperturar.Text = "Abrir caja"
            btnAperturar.Enabled = True

            Dim montoApertura As Decimal = objApe.calcularMontoApertura(numCaja)

            If montoApertura = 0 Then
                txtMontoApCi.ReadOnly = False
            Else
                txtMontoApCi.ReadOnly = True
                txtMontoApCi.Text = montoApertura.ToString()
            End If

        End If

    End Sub

    Private Sub mostrarDatosCaja(datos As DataTable)
        Try
            For Each row As DataRow In datos.Rows
                If Not IsDBNull(row("fechaApertura")) Then
                    txtFechaApCi.Text = Convert.ToDateTime(row("fechaApertura")).ToShortDateString()
                Else
                    txtFechaApCi.Text = ""
                End If

                If Not IsDBNull(row("horaApertura")) Then
                    Dim horaApertura As TimeSpan = DirectCast(row("horaApertura"), TimeSpan)
                    txtHoraApCi.Text = horaApertura.ToString().Substring(0, 8)
                Else
                    txtHoraApCi.Text = ""
                End If


                If Not IsDBNull(row("montoApertura")) Then
                    txtMontoApertura.Text = Convert.ToDecimal(row("montoApertura")).ToString()
                Else
                    txtMontoApertura.Text = ""
                End If
            Next
        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Private Sub limpiarDatos()
        txtMontoApCi.Text = ""
        txtMontoApertura.Text = ""
        txtMontoCierre.Text = ""
        txtMontoCuadre.Text = ""
        txtFechaApCi.Text = ""
        txtHoraApCi.Text = ""
        lblEstado.Text = ""
        cboCaja.SelectedIndex = -1
        cboCaja.Items.FindByText("ELEGIR").Attributes("disabled") = "disabled"
        txtMontoApCi.Enabled = True
        btnAperturar.Enabled = False
        labelMensaje.Text = ""
    End Sub

    Protected Sub btnAperturar_Click(sender As Object, e As EventArgs)
        Try
            Dim numCaja = Integer.Parse(cboCaja.SelectedItem.ToString())

            If btnAperturar.Text = "Abrir caja" Then
                If Me.numCajaAbierta = 0 Then
                    Dim montoApertura As Decimal = Decimal.Parse(txtMontoApCi.Text.ToString())
                    Dim codApertura As Integer = objApe.generarCodigoApertura()
                    Dim fechaApertura As String = DateTime.Now.Date.ToString("yyyy-MM-dd")
                    Dim horaApertura As String = DateTime.Now.ToString("HH:mm:ss.fffffff")

                    Dim exito As Boolean = objApe.registrarAperturaCaja(codApertura, numCaja, Me.codEmpleadoCajero, fechaApertura, horaApertura, 30)
                    If exito Then
                        modificarControles("A", 0)
                        Me.numCajaAbierta = numCaja
                        Session("codApertura") = codApertura

                        txtFechaApCi.Text = fechaApertura
                        txtHoraApCi.Text = horaApertura.Substring(0, 8)
                        txtMontoApertura.Text = montoApertura
                        labelMensaje.Text = ""
                    Else
                        labelMensaje.Text = "Hubo un error al apertura la caja" + numCaja.ToString()
                    End If
                Else
                    labelMensaje.Text = "Usted ya aperturó la caja " + Me.numCajaAbierta.ToString() + ". Para aperturar otra debe cerrar su caja."
                End If
            Else
                If numCaja = Me.numCajaAbierta Then
                    Dim fechaCierre As String = DateTime.Now.Date.ToString("yyyy-MM-dd")
                    Dim horaCierre As String = DateTime.Now.ToString("HH:mm:ss.fffffff")
                    Dim montoCierre As Decimal = objApe.calcularMontoCuadre(numCaja)
                    Dim montoCuadre As Decimal = Decimal.Parse(txtMontoApCi.Text.Trim())

                    Dim exito As Boolean = objApe.registrarCierreCaja(Me.numCajaAbierta, fechaCierre, horaCierre, montoCierre, montoCuadre)

                    If exito Then
                        modificarControles("C", numCaja)
                        Me.numCajaAbierta = 0
                        Session("codApertura") = 0

                        txtFechaApCi.Text = fechaCierre.ToString()
                        txtHoraApCi.Text = horaCierre.Substring(0, 8)
                        txtMontoCierre.Text = montoCierre.ToString()
                        txtMontoCuadre.Text = montoCuadre.ToString()
                        labelMensaje.Text = ""

                    Else
                        labelMensaje.Text = "Hubo un error al cerrar la caja"
                    End If

                Else
                    labelMensaje.Text = "Usted no puede cerrar esta caja porque no la aperturó"
                End If

            End If


        Catch ex As Exception
            labelMensaje.Text = ex.Message
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        limpiarDatos()
    End Sub

    Protected Sub cboCaja_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            btnBuscar_Click(Nothing, Nothing)
            If cboCaja.SelectedIndex > 0 Then
                Dim numeroCaja As Integer = Integer.Parse(cboCaja.SelectedItem.ToString)
                Dim datosCaja As DataTable = objCaja.buscarCaja(numeroCaja)
                Dim estadoCaja As Char = datosCaja.Rows(0).Item(1)
                If estadoCaja = "A" Then
                    Dim aperturaCaja As DataTable = objApe.obtenerAperturaDeCaja(numeroCaja)
                    modificarControles("A", numeroCaja)
                    mostrarDatosCaja(aperturaCaja)

                ElseIf estadoCaja = "B" Then
                    limpiarDatos()
                    modificarControles("B", numeroCaja)
                Else
                    limpiarDatos()
                    modificarControles("C", numeroCaja)
                End If
            End If
        Catch ex As Exception
            labelMensaje.Text = "Hubo un error al obtener datos de la caja"
        End Try
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        Try
            labelMensaje.Text = ""
            If cboCaja.SelectedIndex > 0 Then
                ViewState("indiceCbo") = cboCaja.SelectedIndex
                Dim numeroCaja As Integer = Integer.Parse(cboCaja.SelectedItem.ToString)
                Dim datosCaja As DataTable = objCaja.buscarCaja(numeroCaja)
                Dim estadoCaja As Char = datosCaja.Rows(0).Item(1)
                If estadoCaja = "A" Then
                    Dim aperturaCaja As DataTable = objApe.obtenerAperturaDeCaja(numeroCaja)
                    modificarControles("A", numeroCaja)
                    mostrarDatosCaja(aperturaCaja)

                ElseIf estadoCaja = "B" Then
                    modificarControles("B", numeroCaja)
                Else
                    modificarControles("C", numeroCaja)
                End If

            End If
            cboCaja.SelectedIndex = ViewState("indiceCbo")
        Catch ex As Exception
            labelMensaje.Text = "Hubo un error al obtener datos de la caja"
        End Try
    End Sub


End Class