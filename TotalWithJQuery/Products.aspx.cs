using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TotalWithJQuery
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dtProducts = new DataTable();
                dtProducts.Columns.AddRange(new DataColumn[2] { new DataColumn("ItemName"), new DataColumn("ItemPrice") });
                dtProducts.Rows.Add("Good Day", 25);
                dtProducts.Rows.Add("Chaco Pie", 10);
                dtProducts.Rows.Add("Dream Cream", 35);
                GridView1.DataSource=dtProducts;
                GridView1.DataBind();


            }
        }
    }
}