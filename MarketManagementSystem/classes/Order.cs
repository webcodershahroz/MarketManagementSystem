using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem.classes
{
    public class Order
    {
        public SqlDataReader ReadOrder()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = "select * from tblOrder";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }

        public SqlDataReader SearchByName(string name)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblOrder where customer_name like '%{name}%'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }
        
        public SqlDataReader SearchByDate(string date)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblOrder where order_date = '{date}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }
        public SqlDataReader SearchByDate(string from ,string to)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblOrder where order_date between '{from}' and '{to}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }

    }
}