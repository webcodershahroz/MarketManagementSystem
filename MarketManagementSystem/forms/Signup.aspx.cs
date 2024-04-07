using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace MarketManagementSystem.forms
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            bool hasValue = txtEmail.Text.Length > 0 && txtPassword.Text.Length > 0 && txtType.Text.Length > 0 && txtShopName.Text.Length > 0;
            if (hasValue)
            {
                try
                {
                    MarketManagementSystem.Signup signup = new MarketManagementSystem.Signup();
                    signup.DoSignup(txtEmail.Text, txtPassword.Text, txtType.Text, txtShopName.Text);
                    Response.Redirect("~/forms/Login.aspx");
                }
                catch(SqlException sqlError) { if(sqlError.Number == 2627) txtSomethingWrong.Text ="User Already Exist"; }
            }
            else { txtSomethingWrong.Text = "Please fill all the fields"; }
         
        }
    }
}