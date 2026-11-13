using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using web_cl2vf.Models;
using System.Data.SQLite;

namespace web_cl2vf
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT * FROM Users WHERE Username = @user AND Password = @pass";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);

            cmd.Parameters.AddWithValue("@user", txtUsername.Text);
            cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

            SQLiteDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                int id = Convert.ToInt32(reader["Id"]);
                string username = reader["Username"].ToString();
                string password = reader["Password"].ToString();
                string role = reader["Role"].ToString();
                string name = reader["Name"].ToString();

                User loggedInUser = new User(id, username, password, role, name);

                Session["UserRole"] = loggedInUser.Role;
                Session["UserId"] = loggedInUser.Id;

                if (loggedInUser.Role == "Admin") Response.Redirect("Admin.aspx");
                if (loggedInUser.Role == "Doctor") Response.Redirect("Doctor.aspx");
                if (loggedInUser.Role == "Patient") Response.Redirect("Patient.aspx");
            }

            conn.Close();
        }
    }
}