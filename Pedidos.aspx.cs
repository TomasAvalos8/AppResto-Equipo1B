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
           


        }
        protected void BtnCelda_Click(object sender, EventArgs e)
        {
            // Obtener el control que disparó el evento
            LinkButton clickedButton = (LinkButton)sender;

            // Obtener el argumento del comando (CommandArgument)
            string cellId = clickedButton.CommandArgument;

            // Lógica específica para la celda seleccionada
            Response.Write($"Hiciste clic en la celda con ID: {cellId}");
        }


    }
}