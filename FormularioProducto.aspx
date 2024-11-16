<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioProducto.aspx.cs" Inherits="Resto.FormularioProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
       <%-- <div class="col " style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100vh;">

                     <div class="mb-3">
                    <label for="txtId">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtDesc">Descripcion</label>
                    <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtPrecio">Precio</label>
                    <asp:TextBox runat="server" type="number" ID="txtPrecio" CssClass="form-control" />
                </div>

            <div>
            <%--<button class="btn btn-primary" id="btnAtras" onclick="">Atras</button>
            <a class="btn btn-primary me-md-2" href="Productos.aspx" role="button">Atras</a>
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" cssclass="btn btn-primary" />  
            <%--<button class="btn btn-primary" id="btnAceptar" OnClick="btnAceptar_Click">Aceptar</button>
            </div>

            </div>

    </div>--%>

          <div class="container mt-5">
        <!-- Botón para abrir el modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#formularioModal">
            Abrir Formulario
        </button>

        <!-- Modal -->
        <div class="modal fade" id="formularioModal" tabindex="-1" aria-labelledby="formularioModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Encabezado del modal -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="formularioModalLabel">Formulario de Producto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- Cuerpo del modal -->
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtDesc" class="form-label">Descripción</label>
                            <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtPrecio" class="form-label">Precio</label>
                            <asp:TextBox runat="server" type="number" ID="txtPrecio" CssClass="form-control" />
                        </div>
                    </div>
                    <!-- Pie del modal -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>