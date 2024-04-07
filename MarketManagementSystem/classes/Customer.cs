using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MarketManagementSystem
{
    public class Customer
    {
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

            try
            {
                SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-CA89MHE\SQLEXPRESS;Initial Catalog=MarketManagementSystem;Integrated Security=True;Encrypt=False");
                string query = $"insert into tblCustomer values('{CustomerEmail}','{CustomerName}','{CustomerAddress}','{CustomerContact}','{CustomerPreviousBalance}')";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.ExecuteNonQuery();
            }
            catch (SqlException sqlError) {  }
        }

    }
}