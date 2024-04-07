using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem
{
    public class Product
    {
        public String ProductName { get; set; }
        public float ProductPurchasingPrice { get; set; }
        public float ProductSellingPrice { get; set; }
        public String ProductStock { get; set; } 
        
        public void AddProduct(string name, float ppp,float psp,string stock)
        {
            ProductName = name;
            ProductPurchasingPrice = ppp;
            ProductSellingPrice = psp;
            ProductStock = stock;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"insert into tblProduct values('{ProductName}','{ProductPurchasingPrice}','{ProductSellingPrice}','{ProductStock}')";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query,conn);

            cmd.ExecuteNonQuery();
        }

        

    }
}