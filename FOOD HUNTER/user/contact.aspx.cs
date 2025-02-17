using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOOD_HUNTER.user
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserLocation();
            }
        }

        private void LoadUserLocation()
            {
                try
                {
                    con = new SqlConnection(Connection.GetConnectionString());
                    cmd = new SqlCommand("SELECT Latitude, Longitude FROM Users WHERE UserID = @UserID", con);
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]); // Assuming you store the UserID in Session

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    double latitude = 19.0760; // Default Mumbai latitude
                    double longitude = 72.8777; // Default Mumbai longitude

                    if (reader.Read())
                    {
                        latitude = Convert.ToDouble(reader["Latitude"]);
                        longitude = Convert.ToDouble(reader["Longitude"]);
                    }

                    reader.Close();
                    con.Close();

                    // Pass coordinates to JavaScript
                    string script = $"initLeafletMap({latitude}, {longitude});";
                    ScriptManager.RegisterStartupScript(this, GetType(), "initMap", script, true);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error loading map: " + ex.Message + "');</script>");
                }
            }

        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("ContactSp", con);
                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Thanks for reaching out will look into Your Query";
                lblMsg.CssClass = "alert alert-success";
                Clear();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally 
            { 
                con.Close(); 
            }
        }

        private void Clear()
        {
            txtName.Text= string.Empty;
            txtEmail.Text= string.Empty;
            txtSubject.Text= string.Empty;
            txtMessage.Text= string.Empty;
        }
    }
}