<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="AperturarCaja.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/AperturarCaja.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="contenedor p-0">
    <h1>Apertura y cierre de caja</h1>
    <div class="contenedor-controles">
        <div class="controles-input">
            <label for="txtCaja">Caja:</label>
            <asp:DropDownList ID="cboCaja" runat="server" OnSelectedIndexChanged="cboCaja_SelectedIndexChanged" CssClass="input"></asp:DropDownList>
             <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"  CssClass="button"/>
        </div>
        <div class="controles-input">
            <label for="lblEstado">Estado:</label>
            <asp:TextBox ID="lblEstado" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="controles-input">
            <asp:Label ID="lblMontoApCi" runat="server" Text="Monto de apertura:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtMontoApCi" runat="server" CssClass="input"></asp:TextBox>
        </div>
        <asp:Label ID="labelMensaje" runat="server" Text=""></asp:Label>
    </div>
    <div class="contenedor-datos-caja">
        <div class="controles-input">
            <asp:Label ID="lblFechaApCi" runat="server" Text="Fecha cierre:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtFechaApCi" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="controles-input">
            <asp:Label ID="lblHoraApCi" runat="server" Text="Hora cierre:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtHoraApCi" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
        <hr>
        <div class="controles-input">
            <label for="txtMontoApertura">Monto apertura:</label>
            <asp:TextBox ID="txtMontoApertura" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="controles-input">
            <label for="txtMontoCierre">Monto cierre:</label>
            <asp:TextBox ID="txtMontoCierre" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="controles-input">
            <label for="txtMontoCuadre">Monto cuadre:</label>
            <asp:TextBox ID="txtMontoCuadre" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
        </div>
    </div>
    <div class="contenedor-botones">
        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click"  CssClass="button"/>
        <asp:Button ID="btnAperturar" runat="server" Text="Abrir caja" OnClick="btnAperturar_Click"  CssClass="button"/>
    </div>
</div>
</asp:Content>
