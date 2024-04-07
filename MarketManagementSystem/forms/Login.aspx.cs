using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace MarketManagementSystem.forms
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            MarketManagementSystem.Login login = new MarketManagementSystem.Login();
            SqlDataReader data = login.DoLogin(txtEmail.Text,txtPassword.Text);

            if (data.Read())
            {
                string type = data.GetString(2).Trim();
                if (type == "Admin") {
                    Response.Redirect("~/forms/Admin.html"); 
                }
                else if (type == "Employee") { 
                    Response.Redirect("~/forms/Bill.aspx"); 
                }
            }
            else { lblIncorrectEmailPassword.Text = "Incorrect email or password. Try again"; }
        }
    }
}