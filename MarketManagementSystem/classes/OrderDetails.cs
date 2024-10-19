using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem.classes
{
    public class OrderDetails
    {
        public SqlDataReader ReadOrderDetail(int orderId)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblOrderDetails where order_id = '{orderId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }
    }
}