using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public String CustomerEmail { get; set; }
        public String CustomerName { get; set; }
        public String CustomerAddress { get; set; }
        public String CustomerContact { get; set; }
        public float CustomerPreviousBalance { get; set; }

        public void AddCustomer(String ctrEmail, String ctrName,String ctrAddress,String ctrContact, float ctrPreBal)
        {
            CustomerEmail = ctrEmail;
            CustomerName = ctrName;
            CustomerAddress = ctrAddress;
            CustomerContact = ctrContact;
            CustomerPreviousBalance = ctrPreBal;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"insert into tblCustomer values('{CustomerEmail}','{CustomerName}','{CustomerAddress}','{CustomerContact}','{CustomerPreviousBalance}')";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteNonQuery();
            }

        public void DeleteCustomer(int ctrId)
        {
            CustomerId = ctrId;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"delete from tblCustomer where customer_id={CustomerId}";

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();


        }
        public void UpdateCustomer(int ctrId, String ctrEmail, String ctrName, String ctrAddress, String ctrContact, float ctrPreBal)
        {

            CustomerId = ctrId;
            CustomerEmail = ctrEmail;
            CustomerName = ctrName;
            CustomerAddress = ctrAddress;
            CustomerContact = ctrContact;
            CustomerPreviousBalance = ctrPreBal;

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"update tblCustomer set customer_email = '{CustomerEmail}', customer_name = '{CustomerName}', customer_address = '{CustomerAddress}', customer_contact = '{CustomerContact}', customer_previousBalance = '{CustomerPreviousBalance}' where customer_id = '{CustomerId}'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteNonQuery();

        }
        public SqlDataReader ReadCustomer()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblCustomer";

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;

        }

        public SqlDataReader SearchCustomer(String ctrName)
        {
            CustomerName = ctrName;
                 
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
            string query = $"select * from tblCustomer where customer_name like '%{CustomerName}%'";

            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader data = cmd.ExecuteReader();

            return data;
        }
    }
        
    
}