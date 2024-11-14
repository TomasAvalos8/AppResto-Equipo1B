using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resto
{
    public partial class FormularioModiProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargaDGV();
            }
        }

        protected void CargarTXT(object sender, EventArgs e)
        {

            GridViewRow SelectedRow = dgvProductos.SelectedRow;

            txtId.Text = SelectedRow.Cells[1].Text;
            txtNombre.Text = SelectedRow.Cells[2].Text;
            txtDesc.Text = SelectedRow.Cells[3].Text;
            txtPrecio.Text = SelectedRow.Cells[4].Text;
        }

        protected void CargaDGV()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            dgvProductos.DataSource = negocio.listar();
            dgvProductos.DataBind();
        }

    }
}