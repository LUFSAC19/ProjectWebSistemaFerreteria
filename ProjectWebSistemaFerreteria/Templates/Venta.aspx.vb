Imports prjCapaNegocio

Public Class Venta
    Inherits System.Web.UI.Page
    Dim objProducto As New clsProducto
    Dim objCliente As New clsCliente
    Dim objVenta As New clsventa
    Dim objApe As New clsApertura_caja
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dtDetalle As New DataTable()
            dtDetalle.Columns.Add("ID Producto")
            dtDetalle.Columns.Add("Producto")
            dtDetalle.Columns.Add("Cantidad")
            dtDetalle.Columns.Add("Precio Un.")
            dtDetalle.Columns.Add("Total")
            ViewState("dtDetalle") = dtDetalle
            ViewState("subtotal") = 0
            BindGrid()
            txtDocCliente = Session("idCliente")
        Else
            lblErrorDetalle.Visible = False
            lblErrorCliente.Visible = False
            lblErrorProducto.Visible = False

        End If
    End Sub

    Private Sub BindGrid()
        Dim dtDetalle As DataTable = CType(ViewState("dtDetalle"), DataTable)
        dgDetalle.DataSource = dtDetalle
        dgDetalle.DataBind()
    End Sub

    Protected Sub btnBuscarProducto_Click(sender As Object, e As EventArgs) Handles btnBuscarProducto.Click
        Try
            Dim idP = CInt(txtIdProducto.Text)
            Dim dtProd = objProducto.buscarProducto(idP)

            Dim dtDetalle As DataTable = CType(ViewState("dtDetalle"), DataTable)
            Dim stock = CInt(dtProd.Rows(0).Item(5))

            For Each row As DataRow In dtDetalle.Rows
                If row.Item(0) = idP Then
                    stock = stock - CInt(row.Item(2))
                    Exit For
                End If
            Next
            txtNombreProducto.Text = dtProd.Rows(0).Item(2)
            txtPrecioUnProducto.Text = dtProd.Rows(0).Item(7)
            txtStockProducto.Text = stock
            txtCantidadProducto.Text = ""
        Catch ex As Exception
            borrarDatosProducto()
            lblErrorProducto.Text = "Error al buscar producto"
            lblErrorProducto.Visible = True
        End Try
    End Sub

    Protected Sub btnBuscarCliente_Click(sender As Object, e As EventArgs) Handles btnBuscarCliente.Click
        Try
            Dim docCliente = txtDocCliente.Text
            Dim dtCli = objCliente.obtenerClienteXDocumento(docCliente)
            If docCliente.Length = 8 Then
                ' es persona sin ruc
                txtNombreCliente.Text = dtCli.Rows(0).Item(1) & " " & dtCli.Rows(0).Item(2)
                ViewState("tipoC") = 0
            Else
                txtNombreCliente.Text = dtCli.Rows(0).Item(3)
                ViewState("tipoC") = 1
            End If
            ViewState("idCliente") = CInt(dtCli.Rows(0).Item(0))

        Catch ex As Exception
            lblErrorCliente.Text = "Cliente no encontrado"
            lblErrorCliente.Visible = True
        End Try

    End Sub

    Protected Sub btnAgregarDetalle_Click(sender As Object, e As EventArgs) Handles btnAgregarDetalle.Click
        Try
            If CInt(txtStockProducto.Text) > 0 Then
                If CInt(txtCantidadProducto.Text) > 0 Then
                    If CInt(txtCantidadProducto.Text) <= CInt(txtStockProducto.Text) Then
                        Dim dtDetalle As DataTable = CType(ViewState("dtDetalle"), DataTable)

                        Dim repetido = False
                        Dim idProducto = txtIdProducto.Text
                        Dim cantidad = txtCantidadProducto.Text
                        Dim precioUn = txtPrecioUnProducto.Text


                        For Each row As DataRow In dtDetalle.Rows
                            If row.Item(0) = idProducto Then
                                repetido = True
                                row.Item(2) = CInt(row.Item(2)) + cantidad
                                row.Item(4) = CInt(row.Item(2)) * CDec(precioUn)
                                Exit For
                            End If
                        Next

                        If Not repetido Then
                            Dim row As DataRow = dtDetalle.NewRow()
                            row("ID Producto") = idProducto
                            row("Producto") = txtNombreProducto.Text
                            row("Cantidad") = cantidad
                            row("Precio Un.") = precioUn
                            row("Total") = (CInt(txtCantidadProducto.Text) * CDec(txtPrecioUnProducto.Text)).ToString()
                            dtDetalle.Rows.Add(row)
                        End If

                        ' Almacenar el DataTable actualizado en el ViewState
                        ViewState("dtDetalle") = dtDetalle

                        ViewState("subtotal") = ViewState("subtotal") + (CInt(txtCantidadProducto.Text) * CDec(txtPrecioUnProducto.Text))
                        txtSubtotal.Text = ViewState("subtotal")

                        Dim igv = Math.Round(ViewState("subtotal") * 0.18, 2)
                        txtIGV.Text = igv

                        txtTotal.Text = igv + ViewState("subtotal")

                        BindGrid()
                        borrarDatosProducto()
                    Else
                        lblErrorProducto.Text = "La cantidad excede al stock"
                        lblErrorProducto.Visible = True

                    End If
                Else
                    lblErrorProducto.Text = "Ingrese una cantidad valida"
                    lblErrorProducto.Visible = True
                End If
            Else
                lblErrorProducto.Text = "El producto ya no tiene stock"
                lblErrorProducto.Visible = True
            End If
            borrarDatosProducto()

        Catch ex As Exception
            lblErrorProducto.Text = "Ocurrió un error, revise los datos ingresados"
            lblErrorProducto.Visible = True
        End Try
    End Sub

    Protected Sub btnVender_Click(sender As Object, e As EventArgs) Handles btnVender.Click
        Try

            If objApe.obtenerAperturaDeCaja(1).Rows.Count > 0 Then

                Dim codApertura As Integer = objApe.obtenerAperturaDeCaja(1).Rows(0).Item(0)

                Dim idCliente = ViewState("idCliente")

                If idCliente IsNot "" Then


                    Dim fechaActual = Date.Now
                    Dim fecha = fechaActual.ToString("yyyy-MM-dd")

                    Dim dtDetalle As DataTable = CType(ViewState("dtDetalle"), DataTable)

                    If dtDetalle.Rows.Count > 0 Then


                        objVenta.registrarVenta(idCliente, codApertura, fecha, txtTotal.Text, ViewState("tipoC"), dtDetalle)
                        dtDetalle.Rows.Clear()
                        borrarDatosProducto()
                        borrarDatosCliente()
                        ViewState("dtDetalle") = dtDetalle
                        ViewState("subtotal") = 0.00
                        ViewState("idCliente") = ""
                        txtSubtotal.Text = 0.00
                        txtIGV.Text = 0.00
                        txtTotal.Text = 0.00
                        BindGrid()
                        lblErrorDetalle.Text = "Venta realizada correctamente"
                        lblErrorDetalle.ForeColor = System.Drawing.Color.Green
                        lblErrorDetalle.Visible = True
                    Else
                        lblErrorDetalle.Text = "No se tienen productos en el detalle"
                        lblErrorDetalle.ForeColor = System.Drawing.Color.Blue
                        lblErrorDetalle.Visible = True
                    End If
                Else
                    lblErrorDetalle.Text = "Ingrese un cliente"
                    lblErrorDetalle.ForeColor = System.Drawing.Color.Blue
                    lblErrorDetalle.Visible = True
                End If
            Else
                lblErrorDetalle.Text = "Verifique que haya una caja abierta"
                lblErrorDetalle.ForeColor = System.Drawing.Color.Blue
                lblErrorDetalle.Visible = True
            End If

        Catch ex As Exception
            lblErrorDetalle.Text = "Ocurrió un error al vender: " & ex.Message

            lblErrorDetalle.Visible = True
        End Try
    End Sub

    Protected Sub dgDetalle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dgDetalle.SelectedIndexChanged
        ' Obtener la fila seleccionada
        Try
            Dim selectedRow As GridViewRow = dgDetalle.SelectedRow

            Dim idProducto = selectedRow.Cells(1).Text
            Dim producto As String = selectedRow.Cells(2).Text
            Dim cantidad = selectedRow.Cells(3).Text
            Dim precioUn = selectedRow.Cells(4).Text

            txtIdProducto.Text = idProducto
            txtNombreProducto.Text = Server.HtmlDecode(producto)
            txtCantidadProducto.Text = cantidad
            txtPrecioUnProducto.Text = precioUn


        Catch ex As Exception
            lblErrorDetalle.Text = "Ocurrió un error al agregar el detalle: " & ex.Message
            lblErrorDetalle.Visible = True
        End Try
    End Sub

    Protected Sub btnEliminarDetalle_Click(sender As Object, e As EventArgs) Handles btnEliminarDetalle.Click
        Try

            Dim dtDetalle As DataTable = CType(ViewState("dtDetalle"), DataTable)
            Dim estado As Boolean = False
            Dim idProducto = txtIdProducto.Text

            For Each row As DataRow In dtDetalle.Rows
                If row.Item(0) = idProducto Then
                    estado = True
                    ViewState("subtotal") = ViewState("subtotal") - CDec(row.Item(4))
                    txtSubtotal.Text = ViewState("subtotal")

                    Dim igv = Math.Round(ViewState("subtotal") * 0.18, 2)
                    txtIGV.Text = igv

                    txtTotal.Text = igv + ViewState("subtotal")

                    dtDetalle.Rows.Remove(row)

                    Exit For
                End If
            Next

            If estado Then
                ViewState("dtDetalle") = dtDetalle
                BindGrid()
            Else
                lblErrorProducto.Text = "El producto no se encuentra en el detalle"
                lblErrorProducto.Visible = True
            End If

            borrarDatosProducto()

        Catch ex As Exception
            lblErrorProducto.Text = "Error al borrar el producto " & ex.Message
            lblErrorProducto.Visible = True
        End Try
    End Sub

    Protected Sub btnLimpiarCampos_Click(sender As Object, e As EventArgs) Handles btnLimpiarCampos.Click
        borrarDatosProducto()
    End Sub

    Private Sub borrarDatosProducto()
        txtIdProducto.Text = ""
        txtNombreProducto.Text = ""
        txtCantidadProducto.Text = ""
        txtPrecioUnProducto.Text = ""
        txtStockProducto.Text = ""
    End Sub

    Private Sub borrarDatosCliente()
        txtDocCliente.Text = ""
        txtNombreCliente.Text = ""
    End Sub
End Class