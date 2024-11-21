<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Resto.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <link href="Estilos.css" rel="stylesheet" />--%>
    <%--    <script src="JS.js"></script>--%>
    <link href="Estilos.css" rel="stylesheet" />

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

        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="mesas" role="tabpanel" aria-labelledby="home-tab">

                <table id="tablaMesas" border="1" style="width: 100%; border-collapse: collapse;">
                    <tbody>
                        <!-- Generar tabla dinámica -->
                    </tbody>
                </table>

                <div style="margin-top: 20px;">
                    <button id="btnAgregarMesa">Agregar Mesa</button>
                    <button id="btnGuardar">Guardar Diseño</button>
                </div>


                <script>
                // Configuración inicial de filas y columnas
                const filas = 5; // Número de filas
                const columnas = 5; // Número de columnas
                const tabla = document.querySelector("#tablaMesas tbody");

                // Generar la tabla inicial
                for (let i = 0; i < filas; i++) {
                    const fila = document.createElement("tr");
                    for (let j = 0; j < columnas; j++) {
                        const celda = document.createElement("td");
                        celda.style.width = "50px";
                        celda.style.height = "50px";
                        celda.style.border = "1px solid black";
                        celda.style.textAlign = "center";
                        celda.style.cursor = "pointer";

                        // Evento para marcar como mesa
                        celda.addEventListener("click", () => {
                            if (celda.classList.contains("mesa")) {
                                celda.classList.remove("mesa");
                                celda.innerHTML = "";
                            } else {
                                celda.classList.add("mesa");
                                celda.innerHTML = "Mesa";
                            }
                        });

                        fila.appendChild(celda);
                    }
                    tabla.appendChild(fila);
                }

                // Guardar diseño (ejemplo en consola)
                document.getElementById("btnGuardar").addEventListener("click", () => {
                    const diseño = [];
                    const filas = tabla.querySelectorAll("tr");
                    filas.forEach((fila, i) => {
                        const celdas = fila.querySelectorAll("td");
                        celdas.forEach((celda, j) => {
                            if (celda.classList.contains("mesa")) {
                                diseño.push({ fila: i, columna: j });
                            }
                        });
                    });
                    console.log("Diseño guardado:", diseño);
                });
                </script>

                <style>
    .mesa {
        background-color: lightblue;
        font-weight: bold;
        color: black;
    }

    #tablaMesas td:hover {
        background-color: lightgray;
    }
</style>

                <script>
    let dragged;

    document.querySelectorAll("#tablaMesas td").forEach((celda) => {
        celda.draggable = true;

        celda.addEventListener("dragstart", (event) => {
            dragged = event.target;
        });

        celda.addEventListener("dragover", (event) => {
            event.preventDefault(); // Permitir soltar
        });

        celda.addEventListener("drop", (event) => {
            event.preventDefault();
            if (!event.target.classList.contains("mesa")) {
                event.target.classList.add("mesa");
                event.target.innerHTML = dragged.innerHTML;
                dragged.classList.remove("mesa");
                dragged.innerHTML = "";
            }
        });
    });
                </script>


                <asp:HiddenField ID="hfDiseno" runat="server" />
                <button id="btnGuardarDiseno" onclick="guardarDiseno()">Guardar Diseño</button>

                <script>
    function guardarDiseno() {
        const diseño = [];
        const filas = tabla.querySelectorAll("tr");
        filas.forEach((fila, i) => {
            const celdas = fila.querySelectorAll("td");
            celdas.forEach((celda, j) => {
                if (celda.classList.contains("mesa")) {
                    diseño.push({ fila: i, columna: j });
                }
            });
        });

        // Guardar diseño en un campo oculto y enviarlo al servidor
        document.getElementById("<%= hfDiseno.ClientID %>").value = JSON.stringify(diseño);
        document.forms[0].submit();
    }
                </script>




                <button type="button" class="btn btn-primary" id="btnAgregar" data-bs-toggle="modal" data-bs-target="#ModalAgregarPedido">Agregar</button>
                <button type="button" class="btn btn-primary" id="btnModificar">Modificar</button>
                <button type="button" class="btn btn-primary" id="btnEliminar">Eliminar</button>
            </div>

            <div class="modal fade" id="ModalAgregarPedido" tabindex="-1" aria-labelledby="ModalAgregarPedidoLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content bg-white text-dark">

                        <div class="modal-header">
                            <h5 class="modal-title">Agregar Producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="ddlProducto" class="form-label">Producto</label>
                                <asp:DropDownList ID="ddlProducto" runat="server"></asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="txtCantidad" class="form-label">Cantidad</label>
                                <asp:TextBox runat="server" ID="txtCantidad" CssClass="form-control" />
                            </div>

                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <asp:UpdatePanel ID="upProductos" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                        <Columns>
                                            <asp:BoundField DataField="NombreProducto" HeaderText="Producto" />
                                            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                            <asp:BoundField DataField="Precio" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                   <%-- <asp:Button ID="btnEliminarProducto" runat="server" Text="Eliminar"
                                                        CommandArgument='<%# Eval("ProductoId") %>'
                                                        OnClick="btnEliminarProducto_Click"
                                                        CssClass="btn btn-danger" />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                            <asp:Button ID="btnAgregarProducto" runat="server" Text="Agregar Producto"
                                CssClass="btn btn-primary" OnClick="btnAgregarProducto_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <%-- <div class="mb-3">
                                <label for="txtPrecio" class="form-label">Precio</label>
                                <asp:TextBox runat="server" type="number" ID="txtPrecio" CssClass="form-control" />
                            </div>--%>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <asp:Button ID="btnAgregarPedido" runat="server" Text="Agregar" OnClick="btnAgregarPedido_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
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
