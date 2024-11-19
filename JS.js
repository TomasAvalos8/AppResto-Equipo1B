
    document.addEventListener("DOMContentLoaded", function () {
        const buttons = document.querySelectorAll(".draggable-button");

        buttons.forEach(button => {
        button.setAttribute("draggable", "true");

            button.addEventListener("dragstart", (e) => {
        e.dataTransfer.setData("text/plain", null);
    e.target.classList.add("dragging");
            });

            button.addEventListener("dragend", (e) => {
                const button = e.target;
    const container = document.querySelector(".button-container");

    // Obtener las coordenadas del mouse
    const rect = container.getBoundingClientRect();
    const x = e.clientX - rect.left - button.offsetWidth / 2;
    const y = e.clientY - rect.top - button.offsetHeight / 2;

    // Mover el botón
    button.style.left = `${x}px`;
    button.style.top = `${y}px`;
    button.classList.remove("dragging");
            });
        });
    });


button.addEventListener("dragend", (e) => {
    const button = e.target;
    const container = document.querySelector(".button-container");

    const rect = container.getBoundingClientRect();
    const x = e.clientX - rect.left - button.offsetWidth / 2;
    const y = e.clientY - rect.top - button.offsetHeight / 2;

    // Mover el botón
    button.style.left = `${x}px`;
    button.style.top = `${y}px`;

    // Enviar posición al servidor
    fetch("/SaveButtonPosition", {
        method: "POST",
        body: JSON.stringify({ id: button.id, left: x, top: y }),
        headers: {
            "Content-Type": "application/json"
        }
    });
});
