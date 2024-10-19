using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MarketManagementSystem.forms
{
    public partial class Order : System.Web.UI.Page
    {
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public String OrderDate { get; set; }
        public float OrderTotalPrice { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReadOrders();
            }
        }
        protected void ReadOrders()
        {
            try
            {

                MarketManagementSystem.classes.Order order = new MarketManagementSystem.classes.Order();
                SqlDataReader data = order.ReadOrder();
                gvOrder.DataSource = data;
                gvOrder.DataBind();
                lblTotalNoOfOrders.Text = gvOrder.Rows.Count.ToString();
            }
            catch (Exception error) { Response.Write(error.Message); }
        }
        public void GvOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            int orderId = int.Parse(gvOrder.SelectedRow.Cells[1].Text);

            Response.Redirect("/forms/OrderDetails.aspx?orderId="+orderId);
        }

        protected void TxtSearchOrder_TextChanged(object sender, EventArgs e)
        {
            try
            {
                classes.Order order = new classes.Order();
                SqlDataReader data = order.SearchByName(txtSearchOrder.Text);
                gvOrder.DataSource = data;
                gvOrder.DataBind();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void TxtSearchDate_TextChanged(object sender, EventArgs e)
        {
            try 
            { 
                classes.Order order = new classes.Order();
                SqlDataReader data = order.SearchByDate(txtSearchDate.Text);
                gvOrder.DataSource = data;
                gvOrder.DataBind();
            }catch(Exception error)
            {
                Response.Write(error.Message);
            }
            
        }





        protected void BtnClearFilter_Click(object sender, EventArgs e)
        {
            ReadOrders();
        }

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            string from = txtSearchFrom.Text;
            string to = txtSearchTo.Text;

            try
            {
                classes.Order order = new classes.Order();
                SqlDataReader data = order.SearchByDate(from,to);
                gvOrder.DataSource = data;
                gvOrder.DataBind();
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}