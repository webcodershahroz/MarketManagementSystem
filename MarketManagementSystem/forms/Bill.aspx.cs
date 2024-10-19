using MarketManagementSystem.classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketManagementSystem.forms
{
    public partial class Bill : System.Web.UI.Page
    {
        public int orderId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString();
                classes.Bill bill = new classes.Bill();
                SqlDataReader customerData = bill.GetCustomer();
                SqlDataReader productData = bill.GetProducts();
                //setting ddlCustomer
                    ddlCustomer.DataSource = customerData;
                    ddlCustomer.DataTextField = "customer_name";
                    ddlCustomer.DataValueField = "customer_id";
                    ddlCustomer.DataBind();
                //setting ddlProducts
                    ddlProduct.DataSource = productData;
                    ddlProduct.DataTextField = "product_name";
                    ddlProduct.DataValueField = "product_id";
                    ddlProduct.DataBind();

            }
        }

        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                classes.Bill bill = new classes.Bill();
                //setting totalPrice according to quantity
                int totalPrice =int.Parse(txtQuantity.Text)*int.Parse(txtPrice.Text);
                //adding item in database
                SqlDataReader data = bill.AddItemToBill(int.Parse(txtOrderId.Text), int.Parse(ddlProduct.SelectedItem.Value),int.Parse(txtPrice.Text), ddlProduct.SelectedItem.Text, float.Parse(txtQuantity.Text), totalPrice);
                //setting datasourse of grid view
                gvBillDetail.DataSource = data;
                gvBillDetail.DataBind();
                //setting totalprice and total no of items
                lblTotalNoOfItems.Text = gvBillDetail.Rows.Count.ToString();
                int totalBill = int.Parse(txtTotalPrice.Text);
                totalBill += int.Parse(gvBillDetail.Rows[int.Parse(lblTotalNoOfItems.Text) - 1].Cells[5].Text);
                txtTotalPrice.Text = totalBill.ToString();
                txtPrice.Text = "";
                txtQuantity.Text = "1";
            }
            catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void BtnCreateOrder_Click(object sender, EventArgs e)
        {
            if(btnCreateOrder.Text.Trim() == "Edit")
            {
                try
                {
                    classes.Bill bill = new classes.Bill();
                    bill.EditCustomerForCurrentBill(int.Parse(txtOrderId.Text),int.Parse(ddlCustomer.SelectedItem.Value),ddlCustomer.SelectedItem.Text);
                    pnlAddCtrControls.Visible = false;
                    txtDate.Visible = true;
                    btnEditCustomer.Visible = true;
                }
                catch (Exception error)
                {
                    Response.Write(error.Message);
                }
                return;
            }
            try
            {
                classes.Bill bill = new classes.Bill();
                orderId = bill.CreateOrderAndGetNewlyCreatedOrderId(int.Parse(ddlCustomer.SelectedItem.Value), ddlCustomer.SelectedItem.Text);
                txtOrderId.Text = orderId.ToString();
                pnlAddCtrControls.Visible = false;
                pnlAddPdtControls.Visible = true;
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
            

        }

        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            if(txtRecivedAmount.Text.Trim() == "" )
            {
                Response.Write("Enter Recived Amount");
                return;
            }
            if(int.Parse(txtRecivedAmount.Text) > int.Parse(txtTotalPrice.Text))
            {
                Response.Write("Recieved amount must less than total amount");
                return;
            }
            if(txtRecivedAmount.Text.Trim() != txtTotalPrice.Text.Trim())
            {
                float newBalance = int.Parse(txtTotalPrice.Text) - int.Parse(txtRecivedAmount.Text);
                try
                {
                    classes.Bill bill = new classes.Bill();
                    bill.RecivedAmountAndTotalBill(newBalance, int.Parse(ddlCustomer.SelectedItem.Value));

                }
                catch(Exception error) { Response.Write(error.Message); }
            }
            Response.Redirect("/forms/Bill.aspx");
        }
        
        protected void BtnEditCustomer_Click(object sender, EventArgs e)
        {
            btnEditCustomer.Visible = false;
            pnlAddCtrControls.Visible = true;
            txtDate.Visible = false;
            btnCreateOrder.Text = "Edit";
        }

        protected void CbAddPreviousBalance_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                classes.Bill bill = new classes.Bill();
                int prvBal = bill.GetPreviousBalance(int.Parse(ddlCustomer.SelectedItem.Value));
                if(cbAddPreviousBalance.Checked)
                {
                    int newBalance = int.Parse(txtTotalPrice.Text) + prvBal;
                    txtTotalPrice.Text = newBalance.ToString();
                }
                else if(cbAddPreviousBalance.Checked == false) 
                {
                    int newBalance = int.Parse(txtTotalPrice.Text) - prvBal;
                    txtTotalPrice.Text = newBalance.ToString();
                }
            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void BtnCancelOrder_Click(object sender, EventArgs e)
        {
            try
            {
                classes.Bill bill = new classes.Bill();
                bill.CancelOrder(int.Parse(txtOrderId.Text));
                Response.Redirect("/forms/Bill.aspx");
            }catch(Exception error)
            {
                Response.Write(error.Message);
            }
        }

        protected void DdlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTotalPrice.Text = "0";
            if (cbAddPreviousBalance.Checked) { cbAddPreviousBalance.Checked = false; }

            int totalBill = 0;
            int totalRows = gvBillDetail.Rows.Count;
            for (int i = 0; i < totalRows; i++)
            {
                int price = int.Parse(gvBillDetail.Rows[i].Cells[3].Text);
                totalBill += price;
            }
            txtTotalPrice.Text = totalBill.ToString();

        }

        protected void DdlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            classes.Bill bill = new classes.Bill();
            int productPriceFromDb = bill.GetPriceOfProduct(int.Parse(ddlProduct.SelectedItem.Value));
            txtPrice.Text = productPriceFromDb.ToString();
        }

        protected void GvBillDetail_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEdit.Visible = true;
            ddlProduct.SelectedItem.Text = gvBillDetail.SelectedRow.Cells[2].Text; 
            txtQuantity.Text = gvBillDetail.SelectedRow.Cells[4].Text;
            txtPrice.Text = gvBillDetail.SelectedRow.Cells[3].Text;
        }
        protected void BtnEditProduct_Click(object sender, EventArgs e)
        {
            int orderDetailId = int.Parse(gvBillDetail.SelectedRow.Cells[1].Text);
            int price = int.Parse(txtPrice.Text);
            int qty = int.Parse(txtQuantity.Text);
            int ttlPrice = price * qty;
            try
            {
                classes.Bill bill = new classes.Bill();
                SqlDataReader data = bill.UpdateItemInBill(int.Parse(txtOrderId.Text),orderDetailId, price, qty, ttlPrice);
                gvBillDetail.DataSource = data;
                gvBillDetail.DataBind();
                int totalBill = 0;

                for(int i = 0; i <gvBillDetail.Rows.Count;i++)
                {
                    totalBill += int.Parse(gvBillDetail.Rows[i].Cells[5].Text);
                }
                txtTotalPrice.Text = totalBill.ToString();

                pnlEdit.Visible = false;

            }
            catch(Exception ex) { Response.Write(ex.Message); }
        }

        protected void BtnDeleteProduct_Click(object sender, EventArgs e)
        {
            int orderDetailId = int.Parse(gvBillDetail.SelectedRow.Cells[1].Text);

            try
            {
                classes.Bill bill = new classes.Bill();
                SqlDataReader data = bill.DeleteProductInBill(int.Parse(txtOrderId.Text),orderDetailId);
                gvBillDetail.DataSource = data;
                gvBillDetail.DataBind();
                int totalBill = 0;
                for (int i = 0; i < gvBillDetail.Rows.Count; i++)
                {
                    totalBill += int.Parse(gvBillDetail.Rows[i].Cells[5].Text);
                }
                txtTotalPrice.Text = totalBill.ToString();

                pnlEdit.Visible = false;

            }
            catch (Exception error)
            {
                Response.Write(error.Message);
            }
        }
    }
}