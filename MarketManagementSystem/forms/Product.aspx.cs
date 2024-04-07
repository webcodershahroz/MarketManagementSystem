using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketManagementSystem.forms
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            try
            {
                MarketManagementSystem.Product product = new MarketManagementSystem.Product();
                product.AddProduct(txtProductName.Text, float.Parse(txtProductPurchasingPrice.Text), float.Parse(txtProductSellingPrice.Text),txtProductStock.Text);
                gvProduct.DataBind();
                txtProductName.Text = "";
                txtProductPurchasingPrice.Text = "";
                txtProductSellingPrice.Text = "";
                txtProductStock.Text = "";
                

                
            }
            catch(SqlException sqlError) {  }
        }

    }
}