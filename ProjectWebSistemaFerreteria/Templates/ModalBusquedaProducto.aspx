<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModalBusquedaProducto.aspx.vb" Inherits="ProjectWebSistemaFerreteria.ModalBusquedaProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../CSS/BusquedaAvanzadaProducto.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor">
            <h1>Búsqueda avanzada de producto</h1>
            <div class="contenedor-controles">
                <div class="controles-input">
                    <label for="txtProducto">Nombre del producto:</label>
                    <input type="text" name="txtProducto" id="txtProducto" placeholder="Escriba aquí el nombre del producto" class="input" />
                    <asp:HiddenField ID="txtProductoHF" runat="server" />
                </div>
                <asp:Label ID="labelMensaje" runat="server" Text=""></asp:Label>
            </div>
            <div class="contenedor-filtros">
                <div class="controles-input">
                    <label for="cboTipo">Tipo:</label>
                    <asp:Literal ID="cboTipoLITERAL" runat="server"></asp:Literal>
                    <label for="cboMarca">Marca:</label>
                    <asp:Literal ID="cboMarcaLITERAL" runat="server"></asp:Literal>
                </div>
                <asp:Label ID="label1" runat="server" Text=""></asp:Label>
            </div>
            <div class="contenedor-botones">
                <asp:Button ID="btnRetroceder" runat="server" Text="Retroceder" CssClass="button" OnClick="btnRetroceder_Click" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="button btnLimpiar" OnClick="btnLimpiar_Click" />
                <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CssClass="button btnSeleccionar" OnClick="btnSeleccionar_Click" />
            </div>
            <div class="contenedor-tabla">
                <asp:Literal ID="tblProductos" runat="server"></asp:Literal>
            </div>
        </div>
        <script>
            const txtProducto = document.getElementById("txtProducto");
            const txtProductoHF = document.getElementById('<%= txtProductoHF.ClientID %>');
            const filasTabla = document.querySelectorAll(".contenedor-tabla table tbody tr");
            const btnLimpiar = document.querySelector(".btnLimpiar");
            const btnSeleccionar = document.querySelector(".btnSeleccionar");
            const cboTipo = document.getElementById("cboTipo");
            const cboMarca = document.getElementById("cboMarca");

            function filtrarTabla(tipo, marca) {
                filasTabla.forEach(fila => {
                    var valorTipo = fila.querySelector("td:nth-child(3)").textContent.trim();
                    var valorMarca = fila.querySelector("td:nth-child(4)").textContent;

                    if (valorTipo === tipo || tipo === "TODOS") {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }

                    if (valorMarca === marca || marca === "TODAS") {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }
                });
            }

            cboTipo.addEventListener('change', () => {
                filtrarTabla(cboTipo.value.trim(), cboMarca.value);
            });

            cboMarca.addEventListener('change', () => {
                filtrarTabla(cboTipo.value.trim(), cboMarca.value);
            });

            btnSeleccionar.addEventListener('click', () => {
                txtProducto.value = "";
            });

            btnLimpiar.addEventListener('click', () => {
                txtProducto.value = "";
                cboTipo.value = "0";
                cboMarca.value = "0";
            });

            txtProducto.addEventListener('input', () => {
                filasTabla.forEach(fila => {
                    var textoInput = txtProducto.value.toUpperCase();
                    var valorCelda = fila.querySelector("td:nth-child(2)");
                    var nombreProducto = valorCelda.textContent || valorCelda.innerText;

                    if (nombreProducto.toUpperCase().indexOf(textoInput) > -1) {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }
                });
                cboTipo.value = "TODOS";
                cboMarca.value = "TODAS";
            });

            filasTabla.forEach(fila => {
                fila.addEventListener('click', function () {
                    txtProducto.value = fila.querySelector("td:nth-child(3)").textContent;
                    txtProductoHF.value = fila.querySelector("td:nth-child(1)").textContent;

                    txtProducto.value = fila.querySelector("td:nth-child(2)").textContent;
                    txtProducto.value = fila.querySelector("td:nth-child(1)").textContent;
                });
            });
        </script>

    </form>
</body>
</html>
