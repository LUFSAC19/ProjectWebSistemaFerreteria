const cboFiltro = document.getElementById("cboFiltro");
const txtCliente = document.getElementById("txtCliente");
const txtClienteHF = document.getElementById('<%= txtClienteHF.ClientID %>');
const filasTabla = document.querySelectorAll(".contenedor-tabla table tbody tr");
const btnLimpiar = document.querySelector(".btnLimpiar");
const btnSeleccionar = document.querySelector(".btnSeleccionar");

btnSeleccionar.addEventListener('click', () => {
    txtCliente.value = "";
    cboFiltro.value = "0";
    $('#myModal').modal('hide');
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