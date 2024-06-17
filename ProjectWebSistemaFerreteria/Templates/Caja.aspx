<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Caja.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/Caja.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor">
        <h1>Gestionar caja</h1>
        <div class="contenedor-controles">
            <div class="controles-input">
                <label for="txtCaja">Caja:</label>
                <asp:TextBox ID="txtCaja" runat="server" TextMode="Number" CssClass="input"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="button" />
            </div>
            <div class="controles-input">
                <label for="txtEstado">Estado:</label>
                <asp:TextBox ID="txtEstado" runat="server" ReadOnly="True" CssClass="input"></asp:TextBox>
            </div>
            <div class="controles-input">
                <label for="txtVigencia">Vigencia:</label>
                <asp:TextBox ID="txtVigencia" runat="server" ReadOnly="True" CssClass="input"></asp:TextBox>
            </div>
            <asp:Label ID="labelMensaje" runat="server" Text=""></asp:Label>
        </div>
        <div class="contenedor-botones">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" CssClass="button" />
            <asp:Button ID="btnBloquear" runat="server" Text="Bloquear" CssClass="button" OnClick="btnBloquear_Click" />
            <asp:Button ID="btnDarBaja" runat="server" Text="Dar Baja" CssClass="button" OnClick="btnDarBaja_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="button" OnClick="btnEliminar_Click" />
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" CssClass="button" />
        </div>
        <div class="contenedor-tabla">
            <asp:GridView ID="dgvCaja" runat="server" CssClass="table">
                <Columns>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
