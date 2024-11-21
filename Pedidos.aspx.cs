using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto
{
    public partial class Pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            if (!IsPostBack)
            {


                    ProductoNegocio negocio = new ProductoNegocio();
                    List<Producto> lista = negocio.listar();

                    ddlProducto.DataSource = lista;
                    ddlProducto.DataValueField = "Id";
                    ddlProducto.DataTextField = "Nombre";
                    ddlProducto.DataBind();

            }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                Response.Redirect("Error.aspx");
            }
        }
        private List<ProductoPedido> ProductosTemp
        {
            get
            {
                if (Session["ProductosTemp"] == null)
                {
                    Session["ProductosTemp"] = new List<ProductoPedido>();
                }
                return (List<ProductoPedido>)Session["ProductosTemp"];
            }
            set
            {
                Session["ProductosTemp"] = value;
            }
        }

            // Obtener datos del producto
            int productoId = int.Parse(ddlProducto.SelectedValue);
            string nombreProducto = ddlProducto.SelectedItem.Text;
            int cantidad = int.Parse(txtCantidad.Text);

            // Aquí debes obtener el precio del producto desde la base de datos o lista precargada
            //decimal precio = ObtenerPrecioProducto(productoId);

            // Crear un nuevo objeto ProductoPedido y agregarlo a la lista
            var nuevoProducto = new ProductoPedido
            {
                ProductoId = productoId,
                NombreProducto = nombreProducto,
                Cantidad = cantidad,
                //Precio = precio
            };

            // Agregar el producto a la lista temporal
            var productos = ProductosTemp;
            productos.Add(nuevoProducto);
            ProductosTemp = productos;

            // Actualizar el GridView
            BindGridView();
        }
        private void BindGridView()
        {
            gvProductos.DataSource = ProductosTemp;
            gvProductos.DataBind();
        }
    }
}