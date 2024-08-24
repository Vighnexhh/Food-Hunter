using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FOOD_HUNTER.user
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");

                Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");

                pnlSliderUC.Controls.Add(sliderUserControl);
            }
            if (Session["userId"] == null)
            {
                lbLoginOrLogout.Text = "Login";
            }
            else
            {
                lbLoginOrLogout.Text = "Logout";

            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }

        }

        protected void lbRegisterOrProfile_Click(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                lbRegisterOrProfile.ToolTip = "User Profile";
                Response.Redirect("profile.aspx");
            }
            else
            {
                lbRegisterOrProfile.ToolTip = "User Registration";
                Response.Redirect("registration.aspx");
            }
        }
    }
}