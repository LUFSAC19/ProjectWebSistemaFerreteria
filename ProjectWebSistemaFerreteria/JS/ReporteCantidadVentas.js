const rdo_todos = document.querySelectorAll('.contenedor-filtro.A input');
const input_todos = document.querySelectorAll('.contenedor-input > *[data-x=""]');
const lbl_anio = document.querySelector('.contenedor-input label[data-label="Año"]');
const rdo_anio_todos = document.querySelector('#rdo_anio_todos');
const rdo_anio_especifico = document.querySelector('#rdo_anio_especifico');
const rdo_anio_rango = document.querySelector('#rdo_anio_rango');
const input_anio = document.querySelector('#input_anio');
const lbl_mensaje_error = document.querySelector('#lbl_mensaje_error');
const hiddenField = document.getElementById('HiddenField1');
const eleccion_check = document.getElementById('eleccion_check');
const tiempo_grafico = document.getElementById('tiempo_grafico');

input_anio.style.display = "none";

google.charts.load("current", { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var dsql = convertirCadenaALl(hiddenField.value);
    var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        [dsql[0][0], dsql[0][1]],
        [dsql[1][0], dsql[1][1]],
        [dsql[2][0], dsql[2][1]],
        [dsql[3][0], dsql[3][1]],
        [dsql[4][0], dsql[4][1]],
        [dsql[5][0], dsql[5][1]],
        [dsql[6][0], dsql[6][1]],
        [dsql[7][0], dsql[7][1]],
        [dsql[8][0], dsql[8][1]],
        [dsql[9][0], dsql[9][1]],
        [dsql[10][0], dsql[10][1]],
        [dsql[11][0], dsql[11][1]]
    ]);

    var options = {
        title: 'Cantidad de ventas por meses ' + tiempo_grafico.value
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
}

rdo_todos.forEach(rdo => {
    rdo.addEventListener('click', () => {
        lbl_mensaje_error.textContent = "";
        input_todos.forEach(inp => {
            inp.style.display = "none";
        });
        if (rdo.id === "rdo_anio_especifico") {
            lbl_anio.style.display = "block";
            input_anio.style.display = "block";
            eleccion_check.value = '1';

        } else if (rdo.id === "rdo_anio_todos") {
            eleccion_check.value = '0';
        }
    });
});
function convertirCadenaALl(cadena) {
    cadena = JSON.stringify(cadena);
    let partes = cadena.slice(2, -3).split('],');
    let listas = []

    partes.forEach(parte => {
        parte = parte.split(',');
        listas.push([parte[0].slice(2, -1), parseInt(parte[1])]);
    });
    return listas;
}
function mostrarGrafico() {
    var check = document.querySelector('.contenedor-filtro.A input:checked');
    if (check.id === "rdo_anio_especifico") {
        if (!input_anio.value.length) {
            lbl_mensaje_error.textContent = "No deje los campos vacíos por favor";
        } else {
            drawChart();
            lbl_mensaje_error.textContent = "";
        }

    } else {
        drawChart();
    }
}

input_anio.addEventListener('keypress', function (e) {
    if (e.keyCode === 43 || e.keyCode === 45 || e.keyCode === 47 || e.keyCode === 46 || e.keyCode === 101) {
        e.preventDefault();
    }
});