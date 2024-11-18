using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Mostrador : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCatalogo();
            }
        }

        private void CargarCatalogo()
        {
            using (DBVentasElectronicaEntities1 db = new DBVentasElectronicaEntities1())
            {
                // Consulta LINQ para obtener productos agrupados por categoría
                var catalogo = db.Categorias
                    .Select(c => new
                    {
                        CategoriaNombre = c.Nombre,
                        Productos = c.Productos.Select(p => new
                        {
                            p.Nombre,
                            p.Descripcion,
                            p.Precio,
                            p.Stock,
                            Imagen = p.Imagen.Contains("http") ? p.Imagen : "~/Images/" + p.Imagen // Verifica si es URL absoluta
                        }).ToList()
                    }).ToList();

                // Asignar datos al Repeater de categorías
                rptCategorias.DataSource = catalogo;
                rptCategorias.DataBind();
            }
        }



    }
}