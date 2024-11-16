using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Resto
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ProductoNegocio negocio = new ProductoNegocio();
            dgvProductos.DataSource = negocio.listar();
            dgvProductos.DataBind();

        }

        //protected void btnAgregar_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("FormularioProducto.aspx", false);
        //}

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Producto nuevo = new Producto();
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDesc.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);

                negocio.agregarConSP(nuevo);


                Response.Redirect("Productos.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}