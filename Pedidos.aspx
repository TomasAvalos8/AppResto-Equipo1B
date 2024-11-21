<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Resto.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <link href="Estilos.css" rel="stylesheet" />--%>
    <%--    <script src="JS.js"></script>--%>
    <link href="Estilos.css" rel="stylesheet" />
    <style>
        .mesa {
            background-color: lightblue;
            font-weight: bold;
            color: black;
        }

        #tablaMesas td {
            width: 100px;
            height: 100px;
            border: 1px solid black;
            text-align: center;
            cursor: pointer;
        }

            #tablaMesas td:hover {
                background-color: lightgray;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="bg-dark text-white p-2">
    <div class="container">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link text-white" href="#">Mesas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="#">Mostrador</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="#">Delivery</a>
            </li>
        </ul>
    </div>
</div>--%>
    <div class="container-fluid bg-dark text-white">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" aria-current="page" href="#mesas">Mesas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#mostrador">Mostrador</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#delivery">Delivery</a>
            </li>

        </ul>


        <table id="tablaMesas">
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <div style="margin-top: 20px;">
            <button id="btnGuardar">Guardar Diseño</button>
        </div>

        <script>
            const celdas = document.querySelectorAll("#tablaMesas td");

            // Evento para seleccionar o deseleccionar una celda como mesa
            celdas.forEach((celda, index) => {
                celda.addEventListener("click", () => {
                    if (celda.classList.contains("mesa")) {
                        celda.classList.remove("mesa");
                        celda.innerHTML = "";
                    } else {
                        celda.classList.add("mesa");
                        celda.innerHTML = "Mesa " + index;
                    }
                });

                // Hacer celdas arrastrables
                celda.draggable = true;

                celda.addEventListener("dragstart", (event) => {
                    event.dataTransfer.setData("text/plain", index);
                });

                celda.addEventListener("dragover", (event) => {
                    event.preventDefault();
                });

                celda.addEventListener("drop", (event) => {
                    event.preventDefault();
                    const draggedIndex = event.dataTransfer.getData("text/plain");
                    const draggedCell = celdas[draggedIndex];

                    if (!celda.classList.contains("mesa")) {
                        celda.classList.add("mesa");
                        celda.innerHTML = draggedCell.innerHTML;

                        draggedCell.classList.remove("mesa");
                        draggedCell.innerHTML = "";
                    }
                });
            });

            // Guardar diseño
            document.getElementById("btnGuardar").addEventListener("click", () => {
                const diseño = [];
                celdas.forEach((celda, index) => {
                    if (celda.classList.contains("mesa")) {
                        const fila = Math.floor(index / 5); // 5 columnas
                        const columna = index % 5;
                        diseño.push({ fila, columna });
                    }
                });
                console.log("Diseño guardado:", diseño);
            });
    </script>







        <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
        <button type="button" class="btn btn-primary" id="btnModificar">Modificar</button>
        <button type="button" class="btn btn-primary" id="btnEliminar">Eliminar</button>
    </div>
    <div class="tab-pane fade" id="mostrador" role="tabpanel">
        <p>Contenido de la segunda pestaña.</p>
    </div>

    <div class="tab-pane fade" id="delivery" role="tabpanel">
        <label>Pendientes</label>
        <table class="table table-bordered border-primary">
            <thead>
                <tr>
                    <th scope="col">Num Pedido</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Ramiro Blanco </td>
                    <td>Milanesa con papas fritas </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Tomas Avalos</td>
                    <td>Canelones</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Claudio Blanco</td>
                    <td>Hamburguesa</td>
                </tr>
            </tbody>
        </table>

        <label>En Preparacion</label>
        <table class="table table-bordered border-primary">
            <thead>
                <tr>
                    <th scope="col">Num Pedido</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Ramiro Blanco </td>
                    <td>Milanesa con papas fritas </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Tomas Avalos</td>
                    <td>Canelones</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Claudio Blanco</td>
                    <td>Hamburguesa</td>
                </tr>
            </tbody>
        </table>


        <label>Pendientes</label>
        <table class="table table-bordered border-primary">
            <thead>
                <tr>
                    <th scope="col">Num Pedido</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Ramiro Blanco </td>
                    <td>Milanesa con papas fritas </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Tomas Avalos</td>
                    <td>Canelones</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Claudio Blanco</td>
                    <td>Hamburguesa</td>
                </tr>
            </tbody>
        </table>


    </div>
    <br />
    </div>
</div>

    

  

</asp:Content>
