

let tableId = 1; // Para identificar mesas

document.getElementById('add-table').addEventListener('click', function () {
    const mesa = document.createElement('div');
    mesa.className = 'mesa';
    mesa.id = 'mesa-' + tableId;
    mesa.innerHTML = 'Mesa ' + tableId;
    mesa.style.left = Math.random() * 80 + 'vw'; // Posici�n aleatoria
    mesa.style.top = Math.random() * 80 + 'vh'; // Posici�n aleatoria
    document.getElementById('mesa-container').appendChild(mesa);
    initializeDrag(mesa);
    tableId++;
});

document.addEventListener("DOMContentLoaded", function () {
    const addTableButton = document.getElementById("add-table");
    const panelButtons = document.querySelector(".button-container");

    let tableCount = 1; // Contador para los botones de mesas

    // Manejar el evento de clic en el bot�n "Agregar Mesa"
    addTableButton.addEventListener("click", function () {
        // Crear un nuevo bot�n
        const newTableButton = document.createElement("button");
        newTableButton.textContent = `Mesa ${tableCount}`;
        newTableButton.className = "btn btn-secondary m-2";
        newTableButton.id = `mesa-${tableCount}`;

        // Opcional: Agregar evento de clic al nuevo bot�n
        newTableButton.addEventListener("click", function () {
            alert(`Mesa ${tableCount} seleccionada.`);
        });

        // Agregar el nuevo bot�n al panel
        panelButtons.appendChild(newTableButton);

        // Incrementar el contador
        tableCount++;
    });
});






