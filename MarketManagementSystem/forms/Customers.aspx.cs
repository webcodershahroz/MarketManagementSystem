using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MarketManagementSystem.forms
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                SqlDataReader customerData = customer.ReadCustomer();
                gvCustomer.DataSource = customerData;
                gvCustomer.DataBind();
            } catch { Response.Write("Error Reading Customer Data"); }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtCustomerEmail.Text.Length>0 && txtCustomerName.Text.Length > 0 && txtCustomerAddress.Text.Length > 0 && txtCustomerContact.Text.Length > 0 && txtPreviousBalance.Text.Length > 0)
                {
                    MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                    customer.AddCustomer(txtCustomerEmail.Text,txtCustomerName.Text,txtCustomerAddress.Text,txtCustomerContact.Text, float.Parse(txtPreviousBalance.Text));
                    Response.Redirect(Request.RawUrl);

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

        protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAdd.Visible = false;
            btnUpdate.Visible = true;
            btnDelete.Visible = true;

            txtCustomerEmail.Text = gvCustomer.SelectedRow.Cells[2].Text;   
            txtCustomerName.Text = gvCustomer.SelectedRow.Cells[3].Text;   
            txtCustomerAddress.Text = gvCustomer.SelectedRow.Cells[4].Text;   
            txtCustomerContact.Text = gvCustomer.SelectedRow.Cells[5].Text;   
            txtPreviousBalance.Text = gvCustomer.SelectedRow.Cells[6].Text;

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            btnAdd.Visible = true;
            txtCustomerName.Text = "";
            txtCustomerEmail.Text = "";
            txtCustomerAddress.Text = "";
            txtPreviousBalance.Text = "";
            txtCustomerContact.Text = "";
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            int customerId = int.Parse(gvCustomer.SelectedRow.Cells[1].Text);

            try
            {
                MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                customer.UpdateCustomer(customerId, txtCustomerEmail.Text, txtCustomerName.Text, txtCustomerAddress.Text, txtCustomerContact.Text, float.Parse(txtPreviousBalance.Text));
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write("Error Updating Customer Record, Try Again");
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            int customerId = int.Parse(gvCustomer.SelectedRow.Cells[1].Text);

            try
            {
                MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                customer.DeleteCustomer(customerId);
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write("Error Updating Customer Record, Try Again");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string searchquery = txtSearch.Text;
            if(searchquery.Length > 0)
            {
                try
                {
                    MarketManagementSystem.Customer customer = new MarketManagementSystem.Customer();
                    SqlDataReader data = customer.SearchCustomer(searchquery);
                    gvCustomer.DataSource = data;
                    gvCustomer.DataBind();
                    if(!data.Read())
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
    }
}