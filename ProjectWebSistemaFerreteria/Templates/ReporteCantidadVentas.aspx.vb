Imports prjCapaNegocio

Public Class ReporteCantidadVentas
    Inherits System.Web.UI.Page
    Dim objVenta As New clsventa
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            HiddenField1.Value = ViewState("datos")
        End If
    End Sub

    Protected Function obtenerCantidadVentasXMes() As String
        Dim datos As DataTable = objVenta.obtenerVentasPorMes()
        Dim lista As String = ""
        lista = lista + "["
        For Each fila As DataRow In datos.Rows
            lista = lista + $"['{fila(0)}', {fila(1)}],"
        Next

        If lista.EndsWith(",") Then
            lista = lista.Substring(0, lista.Length - 1)
        End If
        lista = lista + "]"
        ViewState("datos") = lista
        Return lista

    End Function

    Protected Function obtenerCantidadVentasXMesSegunAnio(anio) As String
        Dim datos As DataTable = objVenta.obtenerVentasPorMesSegunAnio(anio)
        Dim lista As String = ""
        lista = lista + "["
        For Each fila As DataRow In datos.Rows
            lista = lista + $"['{fila(0)}', {fila(1)}],"
        Next

        If lista.EndsWith(",") Then
            lista = lista.Substring(0, lista.Length - 1)
        End If
        lista = lista + "]"
        ViewState("datos") = lista
        Return lista

    End Function

    Protected Sub btn_filtrar_Click(sender As Object, e As EventArgs) Handles btn_filtrar.Click
        If eleccion_check.Value = "0" Then
            HiddenField1.Value = obtenerCantidadVentasXMes()
            tiempo_grafico.Value = "en todos los años"
            ClientScript.RegisterStartupScript(Me.GetType(), "DatosSQL", "mostrarGrafico();", True)

        ElseIf eleccion_check.Value = "1" Then
            HiddenField1.Value = obtenerCantidadVentasXMesSegunAnio(input_anio.Text)
            tiempo_grafico.Value = "en el año " + input_anio.Text
            ClientScript.RegisterStartupScript(Me.GetType(), "DatosSQL", "mostrarGrafico();", True)

        End If
    End Sub

End Class