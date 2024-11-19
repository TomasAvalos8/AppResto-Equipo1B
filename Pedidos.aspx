<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Resto.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <td >Claudio Blanco</td>
                <td >Hamburguesa</td>
            </tr>
        </tbody>
    </table>
    <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
    <button type="button" class="btn btn-primary" id="btnModificar">Modificar</button>
    <button type="button" class="btn btn-primary" id="btnEliminar">Eliminar</button>
        </div>
        <div class="tab-pane fade" id="mostrador" role="tabpanel" >
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
            <td >Claudio Blanco</td>
            <td >Hamburguesa</td>
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
            <td >Claudio Blanco</td>
            <td >Hamburguesa</td>
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
            <td >Claudio Blanco</td>
            <td >Hamburguesa</td>
        </tr>
    </tbody>
</table>


        </div>
            <br />
    </div>
</div>

    

  


</asp:Content>