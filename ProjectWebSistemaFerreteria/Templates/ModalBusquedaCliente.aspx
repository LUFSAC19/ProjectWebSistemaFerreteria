<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ModalBusquedaCliente.aspx.vb" Inherits="ProjectWebSistemaFerreteria.ModalBusquedaCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <link href="../CSS/BusquedaAvanzadaCliente.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contenedor m-0 p-0" runat="server">
            <h1>Búsqueda avanzada de cliente</h1>
            <div class="contenedor-controles">
                <div class="controles-input">
                    <select name="cboFiltro" id="cboFiltro" style="border: 1px #a5a5a5 solid; outline: none; border-radius: 5px; background-color: #E5E5E5">
                        <option value="0">Nombre del  cliente</option>
                        <option value="1">N° Doc del cliente</option>
                    </select>
                    <input type="text" name="txtCliente" id="txtCliente" placeholder="Escriba aquí el nombre del cliente" class="input"/>
                    <asp:HiddenField ID="txtClienteHF" runat="server" />
                </div>
                <asp:Label ID="labelMensaje" runat="server" Text=""></asp:Label>
            </div>
            <div class="contenedor-botones">
                <asp:Button ID="btnRetroceder" runat="server" Text="Cerrar" CssClass="button" OnClick="btnRetroceder_Click" />
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="button btnLimpiar" OnClick="btnLimpiar_Click" />
                <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CssClass="button btnSeleccionar" OnClick="btnSeleccionar_Click" />

            </div>
            <div class="contenedor-tabla">
                <asp:Literal ID="tblClientes" runat="server"></asp:Literal>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        const cboFiltro = document.getElementById("cboFiltro");
        const txtCliente = document.getElementById("txtCliente");
        const txtClienteHF = document.getElementById('<%= txtClienteHF.ClientID %>');
        const filasTabla = document.querySelectorAll(".contenedor-tabla table tbody tr");
        const btnLimpiar = document.querySelector(".btnLimpiar");
        const btnSeleccionar = document.querySelector(".btnSeleccionar");

        btnSeleccionar.addEventListener('click', () => {
            txtCliente.value = "";
            cboFiltro.value = "0";
            window.parent.$('#myModal').modal('hide');
        });

        btnLimpiar.addEventListener('click', () => {
            txtCliente.value = "";
            cboFiltro.value = "0";
        });

        cboFiltro.addEventListener("change", () => {
            if (cboFiltro.value === "0") {
                txtCliente.placeholder = "Escriba aquí el nombre del cliente";
            } else {
                txtCliente.placeholder = "Escriba aquí el número del documento";
            }
            txtCliente.value = "";
            txtClienteHF.value = "";
        });

        txtCliente.addEventListener('input', () => {
            if (cboFiltro.value === "0") {
                filasTabla.forEach(fila => {
                    var textoInput = txtCliente.value.toUpperCase();
                    var valorCelda = fila.querySelector("td:nth-child(3)");
                    var nombreCliente = valorCelda.textContent || valorCelda.innerText;

                    if (nombreCliente.toUpperCase().indexOf(textoInput) > -1) {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }
                });
            } else {
                filasTabla.forEach(fila => {
                    var textoInput = txtCliente.value.toUpperCase();
                    var valorCelda = fila.querySelector("td:nth-child(2)");
                    var nombreCliente = valorCelda.textContent || valorCelda.innerText;

                    if (nombreCliente.toUpperCase().indexOf(textoInput) > -1) {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }
                });
            }
        });

        filasTabla.forEach(fila => {
            fila.addEventListener('click', function () {
                if (cboFiltro.value === "0") {
                    txtCliente.value = fila.querySelector("td:nth-child(3)").textContent;
                    txtClienteHF.value = fila.querySelector("td:nth-child(1)").textContent;
                } else {
                    txtCliente.value = fila.querySelector("td:nth-child(2)").textContent;
                    txtClienteHF.value = fila.querySelector("td:nth-child(1)").textContent;
                }
            });
        });
    </script>
</body>
</html>
