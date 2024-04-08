using System;
using System.Collections.Generic;
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

        }

    }
}