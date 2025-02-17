using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FOOD_HUNTER.user
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCategories();
                LoadComments();
            }
        }

        void LoadComments()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("GetComments", con);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            rptComments.DataSource = dt;
            rptComments.DataBind();
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtComment.Text))
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("AddComment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", Session["name"] ?? "GUEST");
                cmd.Parameters.AddWithValue("@CommentText", txtComment.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                txtComment.Text = ""; // Clear the input field
                LoadComments(); // Refresh comments
            }
        }

       


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int commentId = Convert.ToInt32(btn.CommandArgument);

            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("DeleteComments", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CommentId", commentId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadComments(); // Refresh comments
        }

        void LoadUserLocation()
        {
            string userAddress = Session["address"]?.ToString() ?? "Default Location, City, Country";
            string postalCode = Session["postalCode"]?.ToString() ?? "000000";

            string fullAddress = userAddress + " " + postalCode;
            string coordinates = GetLatLongFromAddress(fullAddress); // Function to convert address to lat-long

            // Passing coordinates to the frontend
            ClientScript.RegisterStartupScript(this.GetType(), "setMapCoordinates",
                $"setMapLocation({coordinates});", true);
        }

        // Function to convert address to coordinates (mocked for now)
        string GetLatLongFromAddress(string address)
        {
            if (address.Contains("Default Location"))
                return "19.0760, 72.8777"; // Example: Default Mumbai Location

            return "0, 0"; // Fetch actual data if needed
        }


        private void getCategories()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();
        }
    }
}