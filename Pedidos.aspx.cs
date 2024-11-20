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
                string diseno = hfDiseno.Value;
                // Aquí puedes guardar 'diseno' en una base de datos
                Response.Write("Diseño recibido: " + diseno);
            }
        }



    }
}