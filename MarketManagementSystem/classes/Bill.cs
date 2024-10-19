using MarketManagementSystem.forms;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace MarketManagementSystem.classes
{
    public class Bill
    {
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public String CustomerName { get; set; }
        public String OrderDate { get; set; }
        public int ProductId { get; set; }
        public String ProductName { get; set; }
        public float Quantity { get; set; }
        public float TotalPrice { get; set; }
        public int Price { get; set; }
        public SqlDataReader GetCustomer()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = "select * from tblCustomer";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();
            return data;
        }
        public SqlDataReader GetProducts()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = "select * from tblProduct";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();
            return data;
        }
        public int CreateOrderAndGetNewlyCreatedOrderId(int ctrId,string ctrName)
        {
            CustomerId = ctrId;
            CustomerName = ctrName;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"insert into tblOrder output inserted.order_id values('{CustomerId}','{CustomerName}',GETDATE())"
                 +"SELECT CAST(scope_identity() AS int)";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            Int32 orderId = (Int32) cmd.ExecuteScalar();

            return (int) orderId;
        }

        public SqlDataReader AddItemToBill(int orId,int pdtId,int pPrice, string pdtName,float qty,int tlPrice)
        {
            OrderId = orId;
            ProductId = pdtId;
            ProductName = pdtName;
            Quantity = qty;
            Price =  pPrice; 
            TotalPrice = tlPrice;
            

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"insert into tblOrderDetails values('{OrderId}','{ProductId}','{Price}','{ProductName}','{Quantity}','{TotalPrice}')" +
                $"update tblProduct set product_stock = product_stock - {Quantity} where product_id = {ProductId}";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteNonQuery();

            string getQuery = $"select orderDetails_id,product_name,product_price,quantity,totalPrice  from tblOrderDetails where order_id = {OrderId}";
            SqlCommand getQueryCmd = new SqlCommand(getQuery, conn);
            
            SqlDataReader data = getQueryCmd.ExecuteReader();
            return data;
        }
        public int GetPriceOfProduct(int pdtId)
        {
            ProductId = pdtId;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select product_sellingPrice from tblProduct where product_id = '{ProductId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            object data = cmd.ExecuteScalar();
            int productPrice = Convert.ToInt32(data); 

            return productPrice;
        }
        
        public void EditCustomerForCurrentBill(int orderId,int ctrId, string ctrName)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"update tblOrder set customer_id = '{ctrId}', customer_name = '{ctrName}' where order_id = '{orderId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteNonQuery();
        }

        public void RecivedAmountAndTotalBill(float preBal, int ctrId)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"update tblCustomer set customer_previousBalance = '{preBal}' where customer_id = '{ctrId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteNonQuery();
        }

        public int GetPreviousBalance(int ctrId)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select customer_previousBalance from tblCustomer where customer_id = '{ctrId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            object data = cmd.ExecuteScalar();
            int previousBalance = Convert.ToInt32(data);

            return previousBalance;
        }

        public void CancelOrder(int oId)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"delete from tblOrderDetails where order_id={oId}" +
                $"delete from tblOrder where order_id = {oId}";

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
        }
        public SqlDataReader UpdateItemInBill(int oid,int odId,int price, int qty, int totalPrice)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"update tblOrderDetails set product_price = '{price}', quantity = '{qty}' , totalPrice = '{totalPrice}' where orderDetails_id = {odId}";
         
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            string getQuery = $"select orderDetails_id,product_name,product_price,quantity,totalPrice  from tblOrderDetails where order_id = {oid}";
            SqlCommand getQueryCmd = new SqlCommand(getQuery, conn);

            SqlDataReader data = getQueryCmd.ExecuteReader();
            return data;
        }

        public SqlDataReader DeleteProductInBill(int oId, int odId)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"delete from tblOrderDetails where orderDetails_id = '{odId}'";

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();

            string getQuery = $"select orderDetails_id,product_name,product_price,quantity,totalPrice  from tblOrderDetails where order_id = {oId}";
            SqlCommand getQueryCmd = new SqlCommand(getQuery, conn);

            SqlDataReader data = getQueryCmd.ExecuteReader();
            return data;
        }
        
    }
}