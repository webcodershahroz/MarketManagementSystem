using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketManagementSystem.forms
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtCustomerEmail.Text.Length>0 && txtCustomerName.Text.Length > 0 && txtCustomerAddress.Text.Length > 0 && txtCustomerContact.Text.Length > 0 && txtPreviousBalance.Text.Length > 0)
                {
                    MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                    customer.AddCustomer(txtCustomerEmail.Text,txtCustomerName.Text,txtCustomerAddress.Text,txtCustomerContact.Text, float.Parse(txtPreviousBalance.Text));
                    gvCustomer.DataBind();

                    txtCustomerName.Text = "";
                    txtCustomerEmail.Text = "";
                    txtCustomerAddress.Text = "";
                    txtPreviousBalance.Text = "";
                    txtCustomerContact.Text = "";
                }
                else
                {
                    Response.Write("Fill all required feilds");
                }
                

            }catch (SqlException sqlError ) { }
        }
    }
}