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