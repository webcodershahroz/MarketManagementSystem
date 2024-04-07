using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem
{
    public class Signup
    {
        public String Email { get; set; }
        public String Password { get; set; }
        public String Type { get; set; }
        public String FullName { get; set; }


        public int DoSignup(string email, string pass,string type,string fn)
        {
            Email = email;
            Password = pass;
            Type = type;
            FullName = fn;
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"insert into tblLogin values('{Email}','{Password}','{Type}','{FullName}')";
            conn.Open();  
            SqlCommand cmd = new SqlCommand(query, conn); 
            return cmd.ExecuteNonQuery();


        }
    }
}