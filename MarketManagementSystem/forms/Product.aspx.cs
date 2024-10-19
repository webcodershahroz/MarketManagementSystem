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
            try
            {
                classes.Product prodcut = new classes.Product();
                SqlDataReader data = prodcut.ReadProduct();
                gvProduct.DataSource = data;
                gvProduct.DataBind();

                
            }
            catch
            {
                Response.Write("Error Reading Data");
            }
        }

        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {

            try
            {   
                
                if(txtProductName.Text.Length>0 && txtProductPurchasingPrice.Text.Length > 0 && txtProductSellingPrice.Text.Length > 0 && txtProductStock.Text.Length > 0)
                {
                    classes.Product product = new classes.Product();
                    product.AddProduct(txtProductName.Text, float.Parse(txtProductPurchasingPrice.Text), float.Parse(txtProductSellingPrice.Text), float.Parse(txtProductStock.Text));
                    Response.Redirect(Request.RawUrl);

                    txtProductName.Text = "";
                    txtProductPurchasingPrice.Text = "";
                    txtProductSellingPrice.Text = "";
                    txtProductStock.Text = "";
                }
                else
                {
                    Response.Write("Fill required fields");
                }
                
                

                
            }
            catch(SqlException sqlError) {  }
        }
        
        protected void BtnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {
                int productId = int.Parse(gvProduct.SelectedRow.Cells[1].Text);

                classes.Product product = new classes.Product();
                product.UpdateProduct(productId, txtProductName.Text, float.Parse(txtProductPurchasingPrice.Text), float.Parse(txtProductSellingPrice.Text), float.Parse(txtProductStock.Text));
                Response.Redirect(Request.RawUrl);
            }
            catch(Exception error) { Response.Write("Error Occur: " + error.Message); }
        }
        protected void BtnDeleteProduct_Click(object sender, EventArgs e)
        {
            try
            {
                int productId = int.Parse(gvProduct.SelectedRow.Cells[1].Text);

                classes.Product product = new classes.Product();
                product.DeleteProduct(productId);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception error) { Response.Write("Error Occur: " + error.Message); }
        }
        protected void BtnClearFields_Click(object sender, EventArgs e)
        {
            btnAddProduct.Visible = true;

            txtProductName.Text = "";
            txtProductPurchasingPrice.Text = "";
            txtProductSellingPrice.Text = "";
            txtProductStock.Text = "";

        }

        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAddProduct.Visible = false;
            btnUpdateProduct.Visible = true;
            btnDeleteProduct.Visible = true;

            txtProductName.Text = gvProduct.SelectedRow.Cells[2].Text;
            txtProductPurchasingPrice.Text = gvProduct.SelectedRow.Cells[3].Text;
            txtProductSellingPrice.Text = gvProduct.SelectedRow.Cells[4].Text;
            txtProductStock.Text = gvProduct.SelectedRow.Cells[5].Text;


        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string searchquery = txtSearch.Text;
            if (searchquery.Length > 0)
            {
                try
                {
                    classes.Product product = new classes.Product();
                    SqlDataReader data = product.SearchProduct(searchquery);
                    gvProduct.DataSource = data;
                    gvProduct.DataBind();
                    if (!data.HasRows)
                    {
                        Response.Write("No records found");
                    }
                }
                catch
                {
                    Response.Write("Error Occurs, Try Again");
                }
            }
        }

        protected void CbFilterProduct_CheckedChanged(object sender, EventArgs e)
        {

            classes.Product product = new classes.Product();
            if(cbFilterProduct.Checked)
            {
                SqlDataReader data = product.GetOutOfStock();
                gvProduct.DataSource = data;
                gvProduct.DataBind();
            }
            else if(!cbFilterProduct.Checked)
            {
                SqlDataReader data = product.ReadProduct();
                gvProduct.DataSource = data;
                gvProduct.DataBind();
            }
        }
    }
}
