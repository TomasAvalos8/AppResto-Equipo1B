<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Resto.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid bg-dark text-white">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" aria-current="page" href="#Productos">Lista Productos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#modificar">Modificar Productos</a>
            </li>


        </ul>
      </div>

        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="Productos" role="tabpanel" aria-labelledby="home-tab" >

                <asp:GridView ID="dgvProductos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="CargarTXT">

                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    </Columns>

                </asp:GridView>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">


                    <button type="button" class="btn btn-outline-primary me-md-2" data-bs-toggle="modal" data-bs-target="#formularioModalAgregar">Agregar </button>

                    <button type="button" class="btn btn-outline-primary me-md-2" data-bs-toggle="modal" data-bs-target="#formularioModalModi">Modificar </button>

                </div>
              </div>
                <%--FORMULARIO AGREGAR--%>
                <div class="modal fade" id="formularioModalAgregar" tabindex="-1" aria-labelledby="formularioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content bg-white text-dark">

                            <div class="modal-header">
                                <h5 class="modal-title" id="formularioModalLabelAgregar">Agregar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

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

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <asp:Button ID="btnaceptar" runat="server" Text="aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
        
                <%--FORMULARIO MODIFICAR--%>

                <div class="modal fade" id="formularioModalModi" tabindex="-1" aria-labelledby="formularioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content bg-white text-dark">

                            <div class="modal-header">
                                <h5 class="modal-title" id="formularioModalLabelModi">Modificar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="txtNombre" class="form-label">ID</label>
                                    <asp:TextBox runat="server" ID="txtMId" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtNombre" class="form-label">Nombre</label>
                                    <asp:TextBox runat="server" ID="txtMNombre" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtDesc" class="form-label">Descripción</label>
                                    <asp:TextBox runat="server" ID="txtMDesc" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtPrecio" class="form-label">Precio</label>
                                    <asp:TextBox runat="server" type="number" ID="txtMPrecio" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <asp:Button ID="Button1" runat="server" Text="aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
       </div>






</asp:Content>
