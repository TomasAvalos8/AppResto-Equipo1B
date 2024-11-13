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

        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="Productos" role="tabpanel" aria-labelledby="home-tab">

                <asp:GridView ID="dgvProductos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">

                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    </Columns>

                </asp:GridView>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a class="btn btn-outline-primary me-md-2" href="FormularioProducto.aspx" role="button">Agregar</a>

                    <a class="btn btn-outline-primary me-md-2" href="FormularioModiProducto.aspx" role="button">Modificar</a>

                    <%--<button type="button" class="btn btn-outline-primary me-md-2" id="btnModi">Modificar </button>--%>
                </div>

                
                

            </div>
            <div class="tab-pane fade" id="modificar" role="tabpanel">
                <label for="exampleDataList" class="form-label">Modificar productos</label>
                <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Escriba para buscar producto...">
            </div>
            <br />

        </div>
    </div>





    <%--<div class="input-group input-group-sm mb-3">
        <span class="input-group-text" id="inputGroup-sizing-sm">Nombre de producto</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text">Precio</span>
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
    </div>--%>
</asp:Content>
