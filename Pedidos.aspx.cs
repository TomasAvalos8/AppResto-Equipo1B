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
            //if (!IsPostBack)
            //{
            //    GenerateButtons();
            //}
        }

        //private void GenerateButtons()
        //{
        //    for (int i = 1; i <= 5; i++) // Crear 5 botones como ejemplo
        //    {
        //        Button btn = new Button
        //        {
        //            ID = "Button" + i,
        //            Text = "Botón " + i,
        //            CssClass = "draggable-button"
        //        };

        //        // Opcional: Agregar un evento de servidor al botón
        //        btn.Click += Button_Click;

        //        // Agregar el botón al contenedor
        //        PanelButtons.Controls.Add(btn);
        //    }
        //}

        //protected void Button_Click(object sender, EventArgs e)
        //{
        //    Button clickedButton = sender as Button;
        //    // Lógica para manejar clic en el botón
        //    Response.Write($"Hiciste clic en: {clickedButton.Text}");
        //}

    }
}