using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem
{
    public class Login
    {
        public String Email { get; set; }
        public String Password { get; set; }
        public SqlDataReader DoLogin(string email, string pass)
        {
            Email = email;
            Password = pass;
            
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"Select * from tblLogin where login_email = '{Email}' and login_password = '{Password}'";
           
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader data =  cmd.ExecuteReader();

            return data;
        }

    }
}