<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Resto.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <link href="Estilos.css" rel="stylesheet" />--%>
    <%--    <script src="JS.js"></script>--%>
    <link href="Estilos.css" rel="stylesheet" />
    <style>
        .mesa {
            background-color: lightblue;
            font-weight: bold;
            color: blue;
        }

        #tablaMesas td {
            width: 100px;
            height: 100px;
            border: 2px solid black;
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
         <asp>

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
         </asp>

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






</asp:Content>
