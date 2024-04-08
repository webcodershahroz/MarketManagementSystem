using System;
using System.Collections.Generic;
using System.Linq;
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

        }
    }
}