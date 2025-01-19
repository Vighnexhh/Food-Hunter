using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Web.Services.Description;

namespace FOOD_HUNTER.admin
{
    public partial class orderstatus : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Order Status";
                if (Session["vighnesh"] == null)
                {
                    Response.Redirect("../user/login.aspx");
                }
                else
                {
                    getOrderStatus();
                }
            }
            lblMsg.Visible = false;
            pUpdateOrderStatus.Visible = false;
        }

        private void getOrderStatus()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Invoices", con);
            cmd.Parameters.AddWithValue("@Action", "GETSTATUS");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrderStatus.DataSource = dt;
            rOrderStatus.DataBind();
        }

        protected void rOrderStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Invoices", con);
                cmd.Parameters.AddWithValue("@Action", "STATUSBYID");
                cmd.Parameters.AddWithValue("@OrderDetailsId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string status = dt.Rows[0]["Status"].ToString();

                    // Ensure the dropdown has the status value
                    if (ddlOrderStatus.Items.FindByValue(status) == null)
                    {
                        ddlOrderStatus.Items.Add(new ListItem(status = "Select Order Status"));
                        ddlOrderStatus.Items.Add(new ListItem(status = "Pending"));
                        ddlOrderStatus.Items.Add(new ListItem(status = "Dispatched"));
                        ddlOrderStatus.Items.Add(new ListItem(status = "Delivered"));
                    }

                    ddlOrderStatus.SelectedValue = status;
                    hdnId.Value = dt.Rows[0]["OrderDetailsId"].ToString();
                    pUpdateOrderStatus.Visible = true;

                    LinkButton lnkEdit = e.Item.FindControl("lnkEdit") as LinkButton;
                    lnkEdit.CssClass = "badge badge-warning";
                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int orderDetailsId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Invoices", con);
            cmd.Parameters.AddWithValue("@Action",  "UPDTSTATUS");
            cmd.Parameters.AddWithValue("@OrderDetailsId", orderDetailsId);
            cmd.Parameters.AddWithValue("@Status", ddlOrderStatus.SelectedValue);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Order Status Updated successfully!";
                lblMsg.CssClass = "alert alert-success";
                getOrderStatus();
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error - " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pUpdateOrderStatus.Visible = false;
        }
    }
}