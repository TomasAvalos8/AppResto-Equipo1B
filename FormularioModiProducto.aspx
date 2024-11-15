<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioModiProducto.aspx.cs" Inherits="Resto.FormularioModiProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="tab-pane fade show active" id="Productos" role="tabpanel" aria-labelledby="home-tab">

    <asp:GridView ID="dgvProductos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="CargarTXT">

        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField HeaderText="Id" DataField="Id" />
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
        </Columns>

    </asp:GridView>

</div>

        <div class="row">
        <div class="col-6" style="display:flex; flex-direction:column; justify-content:left; align-items:self-end;">
                <div class="mb-3">
                    <label for="txtId">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                 
           

            </div>

            <div class="col-5" style="display:flex; flex-direction:column; justify-content:left; align-items:self-start;">

                <div class="mb-3">
                    <label for="txtDesc">Descripcion</label>
                    <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtPrecio">Precio</label>
                    <asp:TextBox runat="server" type="number" ID="txtPrecio" CssClass="form-control" />
                </div>
                <div>
                    <%--<button class="btn btn-primary" id="btnAtras" onclick="">Atras</button>--%>
                    <a class="btn btn-primary me-md-2" href="Productos.aspx" role="button">Atras</a>
                    <button class="btn btn-primary" id="btnAceptar" onclick="">Aceptar</button>
                </div>

            </div>
    </div>


</asp:Content>
