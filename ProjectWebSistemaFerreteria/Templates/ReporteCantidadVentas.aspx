<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="ReporteCantidadVentas.aspx.vb" Inherits="ProjectWebSistemaFerreteria.ReporteCantidadVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../CSS/ReporteCantidadVentas.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
    <h1>Reporte cantidad de ventas por mes</h1>
    <section>
        <div class="contenedor-filtro A">
            <p>Filtrar por año</p>  
            <input type="radio" name="radio1" id="rdo_anio_todos">
            <label for="rdo_anio_todos">Todos los años</label>
            <input type="radio" name="radio1" id="rdo_anio_especifico">
            <label for="rdo_anio_especifico">Año específico</label>
            <asp:HiddenField ID="eleccion_check" runat="server"  ClientIDMode="Static"/>
        </div>
        <div class="contenedor-input">
            <label for="input_anio" data-x="" data-label="Año" style="display: none;">Año:</label>
            <asp:TextBox ID="input_anio" data-x="" runat="server" ClientIDMode="Static"></asp:TextBox>        
            <asp:Button ID="btn_filtrar" runat="server" CssClass="button" Text="Filtrar" />
        </div>
        <div style="color: red; text-align: center;" id="lbl_mensaje_error"></div>
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static"/>
    </section>        
    <div class="contenedor-grafico">
        <asp:HiddenField ID="tiempo_grafico" runat="server" ClientIDMode="Static"/>
        <div id="piechart" style="width: min(100%,900px); height: max(100%,600px);"></div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../JS/ReporteCantidadVentas.js"></script>
</asp:Content>
