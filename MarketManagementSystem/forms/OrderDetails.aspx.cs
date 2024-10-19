using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketManagementSystem.forms
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public float Quantity { get; set; }
        public float TotalPrice { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           int orderId = int.Parse(Request.Params["orderId"]);
            try
            {
                classes.OrderDetails orderDetails = new classes.OrderDetails();
                SqlDataReader data = orderDetails.ReadOrderDetail(orderId);
                gvOrderDetail.DataSource = data;
                gvOrderDetail.DataBind();
                lblTotalNoOfProductsSell.Text = gvOrderDetail.Rows.Count.ToString();
            }

            catch (Exception error) { Response.Write(error.Message); }
            TotalBill();
        }

        protected void TotalBill()
        {
            int totalBill = 0;
            int totalRows = gvOrderDetail.Rows.Count;
            for (int i = 0; i<totalRows;i++)
            {
                int price =int.Parse(gvOrderDetail.Rows[i].Cells[6].Text);
                totalBill += price;
            }
            lblTotalBill.Text = totalBill.ToString(); 
        }
    }
}