using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;

namespace web_cl2vf
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadDoctors();
                LoadPatients();
                LoadDoctorDropdown();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void LoadDoctors()
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT * FROM Users WHERE Role = 'Doctor'";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);
            SQLiteDataAdapter adapter = new SQLiteDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            gvDoctors.DataSource = dt;
            gvDoctors.DataBind();
            conn.Close();
        }

        protected void LoadPatients()
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT * FROM Users WHERE Role = 'Patient'";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);
            SQLiteDataAdapter adapter = new SQLiteDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            gvPatients.DataSource = dt;
            gvPatients.DataBind();
            conn.Close();
        }

        protected void LoadDoctorDropdown()
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT Id, Name FROM Users WHERE Role = 'Doctor'";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);
            SQLiteDataAdapter adapter = new SQLiteDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            ddlPatientDoctor.DataSource = dt;
            ddlPatientDoctor.DataTextField = "Name";
            ddlPatientDoctor.DataValueField = "Id";
            ddlPatientDoctor.DataBind();

            ddlPatientDoctor.Items.Insert(0, new ListItem("Select a doctor", ""));
            conn.Close();
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "INSERT INTO Users (Username, Password, Role, Name, IDNumber, Mobile) VALUES (@user, @pass, 'Doctor', @name, @idnum, @mobile)";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);

            cmd.Parameters.AddWithValue("@user", txtDoctorUsername.Text);
            cmd.Parameters.AddWithValue("@pass", txtDoctorPassword.Text);
            cmd.Parameters.AddWithValue("@name", txtDoctorName.Text);
            cmd.Parameters.AddWithValue("@idnum", txtDoctorID.Text);
            cmd.Parameters.AddWithValue("@mobile", txtDoctorMobile.Text);

            cmd.ExecuteNonQuery();
            conn.Close();

            LoadDoctors();
            LoadDoctorDropdown();
        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "INSERT INTO Users (Username, Password, Role, Name, IDNumber, Mobile, DOB, Address) VALUES (@user, @pass, 'Patient', @name, @idnum, @mobile, @dob, @address)";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);

            cmd.Parameters.AddWithValue("@user", txtPatientUsername.Text);
            cmd.Parameters.AddWithValue("@pass", txtPatientPassword.Text);
            cmd.Parameters.AddWithValue("@name", txtPatientName.Text);
            cmd.Parameters.AddWithValue("@idnum", txtPatientID.Text);
            cmd.Parameters.AddWithValue("@mobile", txtPatientMobile.Text);
            cmd.Parameters.AddWithValue("@dob", txtPatientDOB.Text);
            cmd.Parameters.AddWithValue("@address", txtPatientAddress.Text);

            cmd.ExecuteNonQuery();
            conn.Close();

            LoadPatients();
        }

        protected void gvDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDoctor")
            {
                string id = e.CommandArgument.ToString();
                string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
                SQLiteConnection conn = new SQLiteConnection(connectionString);
                conn.Open();

                string query = "DELETE FROM Users WHERE Id = @id";
                SQLiteCommand cmd = new SQLiteCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                conn.Close();

                LoadDoctors();
                LoadDoctorDropdown();
            }
        }

        protected void gvPatients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePatient")
            {
                string id = e.CommandArgument.ToString();
                string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
                SQLiteConnection conn = new SQLiteConnection(connectionString);
                conn.Open();

                string query = "DELETE FROM Users WHERE Id = @id";
                SQLiteCommand cmd = new SQLiteCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                conn.Close();

                LoadPatients();
            }
        }
    }
}