using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOOD_HUNTER.admin
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["vighnesh"] == null)
                {
                    Response.Redirect("../user/login.aspx");
                }
                getCategories();
            }
            lblMsg.Visible = false;
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(hdnId.Value);
            string action = categoryId == 0 ? "INSERT" : "UPDATE";
            string imagePath = imgCategory.ImageUrl.Replace("~/", ""); // Preserve existing image

            // Handle Image Upload
            if (fuCategoryImage.HasFile && Utils.IsValidExtension(fuCategoryImage.FileName))
            {
                string fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                string fileName = Guid.NewGuid().ToString() + fileExtension;
                imagePath = "Images/Category/" + fileName;
                fuCategoryImage.SaveAs(Server.MapPath("~/" + imagePath));
            }

            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("Category_Crud", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", action);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@IsActive", cblIsActive.Checked);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMsg.Text = (categoryId == 0 ? "Category added" : "Category updated") + " successfully!";
            lblMsg.CssClass = "alert alert-success";
            lblMsg.Visible = true;

            // Reset Form & Refresh List
            btnAddOrUpdate.Text = "Add";
            hdnId.Value = "0";
            getCategories();
            btnClear_Click(null, null);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            hdnId.Value = "0";
            txtName.Text = string.Empty;
            cblIsActive.Checked = false;
            imgCategory.ImageUrl = ""; // Reset image preview
            btnAddOrUpdate.Text = "Add"; // Reset button text
            lblMsg.Text = string.Empty;
        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int categoryId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "edit")
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand("Category_Crud", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "SELECT_BY_ID");
                        cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            hdnId.Value = reader["CategoryId"].ToString();
                            txtName.Text = reader["Name"].ToString();
                            cblIsActive.Checked = Convert.ToBoolean(reader["IsActive"]);
                            imgCategory.ImageUrl = "~/" + reader["ImageUrl"].ToString();

                            btnAddOrUpdate.Text = "Update"; // Switch button to Update mode
                        }
                        reader.Close();
                    }
                }
            }
            else if (e.CommandName == "delete")
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand("Category_Crud", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "DELETE");
                        cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                lblMsg.Text = "Category deleted successfully!";
                lblMsg.CssClass = "alert alert-success";
                lblMsg.Visible = true;
                getCategories();
            }
        }

        protected void rCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblIsActive = (Label)e.Item.FindControl("lblIsActive");
                if (lblIsActive != null)
                {
                    bool isActive = Convert.ToBoolean(lblIsActive.Text);
                    lblIsActive.Text = isActive ? "Active" : "Inactive";
                }
            }
        }

        private void getCategories()
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand("Category_Crud", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "SELECT");
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rCategory.DataSource = dt;
                    rCategory.DataBind();
                }
            }
        }
    }
}
